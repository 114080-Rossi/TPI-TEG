import {GameService, NewGameRequestDTO} from 'app/core/services/game.service';

enum Colors {
  RED = 'RED',
  BLUE = 'BLUE',
  GREEN = 'GREEN',
  YELLOW = 'YELLOW',
  PURPLE = 'PURPLE'
}
enum DifficultyLevel {
  PROFESIONAL = 'PROFESIONAL',
  MEDIUM = 'MEDIUM',
  AMATEUR = 'AMATEUR'
}
enum GameState {
  ESPERANDO_JUGADORES = 'ESPERANDO_JUGADORES',
  REPARTO_TERRITORIOS = 'REPARTO_TERRITORIOS',
  ASIGNACION_OBJETIVOS = 'ASIGNACION_OBJETIVOS',
  RONDA_1 = 'RONDA_1',
  RONDA_2 = 'RONDA_2',
  RONDA_3 = 'RONDA_3',
  TURNO_JUGADOR = 'TURNO_JUGADOR',
  FIN_JUEGO = 'FIN_JUEGO'
}
enum TurnState {
  STARTED = 'STARTED',
  FINISHED = 'FINISHED',
  PAUSE = 'PAUSE',
  CANCELED = 'CANCELED'
}

interface GameConfig {
  gameId: number;
  gameDifficulty: DifficultyLevel;
  gameState: GameState;
  currentTurnPlayerId: number | null;
  createdByPlayerId: number;
  turnState: TurnState;
}

import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import {FormBuilder, FormGroup, ReactiveFormsModule, Validators} from '@angular/forms';
import {Router} from '@angular/router';

@Component({
  selector: 'app-home',
  standalone: true,
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
  imports: [CommonModule, ReactiveFormsModule]
})

export class HomeComponent {
  showNewGameForm = false
  showLoadGameList = false
  newGameForm: FormGroup
  savedGames: GameConfig[] = []
  currentDate: Date = new Date();
  joinGameId: number | null = null;
  showJoinGameForm = false;

  colorOptions = [
    { value: "RED", label: "RED" },
    { value: "BLUE", label: "BLUE" },
    { value: "GREEN", label: "GREEN" },
    { value: "YELLOW", label: "YELLOW" },
    { value: "PURPLE", label: "PURPLE" }
  ]

  difficultyOptions = [
    { value: "easy", label: "Fácil" },
    { value: "medium", label: "Medio" },
    { value: "expert", label: "Experto" }
  ]

  constructor(private fb: FormBuilder, private gameService: GameService, private router: Router) {
    this.newGameForm = this.fb.group({
      color: ["", Validators.required],
      difficulty: ["", Validators.required],
      botCount: ["", Validators.required]
    });
    this.loadSavedGames();
  }

  onNewGame() {
    this.showNewGameForm = true
    this.showLoadGameList = false
    this.showJoinGameForm = false
  }

  onLoadGame() {
    this.showLoadGameList = true
    this.showNewGameForm = false
    this.showJoinGameForm = false
    // this.loadSavedGames()
  }

  onJoinGame() {
    this.showJoinGameForm = true;
    this.showNewGameForm = false;
    this.showLoadGameList = false;
    this.gameService.getJoinGameNumber().subscribe(id => {
      this.joinGameId = id;
    });
  }

  onCloseJoinGame() {
    this.showJoinGameForm = false;
    this.joinGameId = null;
  }

  onJoinToGame(gameId: number) {
    // Aquí va la lógica para unirse al juego, por ejemplo:

    this.router.navigate(['/board', gameId]);
  }

  onStartNewGame() {
    if (this.newGameForm.invalid) return;
    const difficultyMap: { [key: string]: number } = {
      easy: 1,
      medium: 2,
      expert: 3
    };
    const colorMap: { [key: string]: number } = {
      RED: 1,
      BLUE: 2,
      GREEN: 3,
      YELLOW: 4,
      PURPLE: 5
    };
    const formValue = this.newGameForm.value;
    //const playerId = Number(sessionStorage.getItem('playerId'));
    const newGameRequest: NewGameRequestDTO = {
      created_by_player_id: 1063, // Reemplaza con el ID real del jugador sessionstorage
      amount_bot: Number(formValue.botCount),
      game_difficulty: difficultyMap[formValue.difficulty],
      color_id: colorMap[formValue.color]
    };

    this.gameService.createNewGame(newGameRequest).subscribe({
      next: (response) => {
        if (response && response.gameId !== undefined && response.gameId !== null) {
          this.router.navigate(['/board', response.gameId]);
        } else {
          console.error('gameId es undefined o null en la respuesta');
        }
      },
      error: (err) => console.error('Error al crear el juego', err)
    });

    this.newGameForm.reset();
    this.showNewGameForm = false;
  }

  onSelectSavedGame(game: GameConfig) {
    // Aquí puedes navegar a la pantalla del juego con la configuración cargada
    this.showLoadGameList = false
  }

  onDeleteSavedGame(gameId: number) {
    this.savedGames = this.savedGames.filter(game => game.gameId !== gameId)
    this.updateLocalStorage()
  }

  onCancel() {
    this.showNewGameForm = false
    this.showLoadGameList = false
    this.newGameForm.reset()
  }

  private generateGameId(): string {
    return "game_" + Date.now() + "_" + Math.random().toString(36).substr(2, 9)
  }

  private saveGame(gameConfig: GameConfig) {
    this.savedGames.push(gameConfig)
    this.updateLocalStorage()
  }

  //savedGames: NewGameResponseDTO[] = [];

  loadSavedGames() {
    const playerId = 49; // Reemplaza con el ID del jugador actual
    //TODO todavia me falta esta parte, por ahora lo dejo hardcodeado
    this.gameService.getGamesByPlayer(playerId).subscribe({
      next: (games) => {
        this.savedGames = games.map(game => ({
          gameId: game.gameId,
          gameDifficulty: game.gameDifficulty as DifficultyLevel,
          gameState: game.gameState as GameState,
          currentTurnPlayerId: game.currentTurnPlayerId,
          createdByPlayerId: game.createdByPlayerId,
          turnState: game.turnState as TurnState
        }));
      },
      error: (err) => {
        console.error('Error al cargar juegos', err);
        this.savedGames = [];
      }
    });
  }

  private updateLocalStorage() {
    localStorage.setItem("savedGames", JSON.stringify(this.savedGames))
  }

  getColorClass(color: string): string {
    return `color-${color}`
  }

  getDifficultyClass(difficulty: string): string {
    return `difficulty-${difficulty}`
  }
  irAlTablero() {
    this.router.navigate(['/board']);
  }



}
