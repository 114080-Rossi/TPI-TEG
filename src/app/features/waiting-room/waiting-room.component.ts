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
  gameId!: number;
  @Input() gameData: any | GameDTO;

  constructor(
    private gameService: GameService,
    private route: ActivatedRoute,
    private router: Router
  ){}

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      const id = params.get('gameId');
      console.log('ngOnInit ejecutado: '+ id);
      if (id) {
        this.gameId = +id;
        this.loadWaitingRoomData();
      }
    });
  }

  cancelGame(): void {
    this.router.navigate(['/home']);
  }

  loadWaitingRoomData() {
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
          this.router.navigate(['/board'], { state: { game: response } });
        },
        error: (err) => {
          console.error('Error al iniciar partida:', err);
        }
      });
  }


}
