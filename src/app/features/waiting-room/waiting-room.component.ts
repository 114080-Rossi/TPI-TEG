import {Component, OnInit} from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {GameService} from 'app/core/services/game.service';
import {GameDTO} from 'app/core/models/game/game.model';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-waiting-room',
  imports: [CommonModule], // <-- Agrega esto
  templateUrl: './waiting-room.component.html',
  styleUrl: './waiting-room.component.css'
})
export class WaitingRoomComponent implements OnInit {
  gameId!: number;
  gameData!: GameDTO;
  players: string[] = [];
  isGameReady = false;

  constructor(
    private route: ActivatedRoute,
    private gameService: GameService
  ) {}

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      const id = params.get('gameId');
      if (id) {
        this.gameId = +id;
        this.loadWaitingRoomData();
      }
    });
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
    return this.gameData && this.gameData.numberPlayer >= 3 && this.gameData.numberPlayer < 6;
  }
}
