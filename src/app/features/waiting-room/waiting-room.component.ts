import {Component, Input, OnInit} from '@angular/core';
import {GameService} from 'app/core/services/game.service';
import {GameDTO} from 'app/core/models/game/game.model';
import { CommonModule } from '@angular/common';
import {ActivatedRoute, Router, Routes} from '@angular/router';
import {StartGameDTO} from 'app/core/models/game/startGame';

@Component({
  selector: 'app-waiting-room',
  imports: [CommonModule],
  templateUrl: './waiting-room.component.html',
  styleUrl: './waiting-room.component.css'
})
export class WaitingRoomComponent implements OnInit {
  gameId: number | null = null;
  playerId: number| null = null;
  private refreshInterval: any
  @Input() gameData: any | GameDTO;

  constructor(
    private gameService: GameService,
    private route: ActivatedRoute,
    private router: Router
  ){}

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      // const id = params.get('gameId');
      // if (id) {
      //   this.gameId = +id;
      //   this.loadWaitingRoomData();
      // }
      const paramGameId = this.route.snapshot.paramMap.get('gameId');
      this.gameId = paramGameId != null ? Number(paramGameId) : null;
      console.log('ngOnInit ejecutado: '+ this.gameId);

      const param = this.route.snapshot.paramMap.get('id');
      this.playerId = param != null ? Number(param) : null;


      this.loadWaitingRoomData();

      // Refresca cada 3 segundos
      this.refreshInterval = setInterval(() => {
        this.loadWaitingRoomData();
      }, 3000);
    });
  }

  ngOnDestroy(): void {
    if (this.refreshInterval) {
      clearInterval(this.refreshInterval);
    }
  }

  cancelGame(): void {
    this.router.navigate(['/home', this.playerId]);
  }

  loadWaitingRoomData() {
    if (this.gameId === null){
      console.error('gameId es null en loadWaitingRoomData');
      return;
    }
    this.gameService.getGameById(this.gameId).subscribe({
      next: (data: GameDTO) => {
        this.gameData = data;
      },
      error: (err) => console.error('Error al cargar la sala de espera', err)
    });
  }

  canStartGame(): boolean {
    console.log('canStartGame numberPlayer: '+ this.gameData.numberPlayer);
    return this.gameData && this.gameData.numberPlayer >= 3 && this.gameData.numberPlayer < 6
  }

  startGame(): void {
    this.gameService.startGame(this.gameData.gameId)
      .subscribe({
        next: (response: StartGameDTO) => {
          console.log('ngOnInit ejecutado');
          this.router.navigate(['/board', this.gameId , this.playerId], { state: { game: response } });
        },
        error: (err) => {
          console.error('Error al iniciar partida:', err);
        }
      });
  }

}
