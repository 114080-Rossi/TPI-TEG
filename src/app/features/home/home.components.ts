// src/app/features/home/home.component.ts

import { Component, OnInit } from '@angular/core';
import { CommonModule }      from '@angular/common';
import {
  FormBuilder,
  FormGroup,
  ReactiveFormsModule,
  Validators
} from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { GameService, NewGameRequestDTO } from 'app/core/services/game.service';

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

@Component({
  selector:    'app-home',
  standalone:  true,
  imports:     [ CommonModule, ReactiveFormsModule ],
  templateUrl: './home.component.html',
  styleUrls:   ['./home.component.css'],
})
export class HomeComponent implements OnInit {

  playerId!: number;

  showNewGameForm   = false;
  showLoadGameList  = false;
  showJoinGameForm  = false;
  newGameForm:      FormGroup;
  savedGames:       GameConfig[] = [];
  currentDate       = new Date();
  joinGameId:       number | null = null;

  colorOptions = [
    { value: "RED",    label: "RED" },
    { value: "BLUE",   label: "BLUE" },
    { value: "GREEN",  label: "GREEN" },
    { value: "YELLOW", label: "YELLOW" },
    { value: "PURPLE", label: "PURPLE" }
  ];

  difficultyOptions = [
    { value: "easy",   label: "Fácil" },
    { value: "medium", label: "Medio" },
    { value: "expert", label: "Experto" }
  ];

  constructor(
    private fb:          FormBuilder,
    private gameService: GameService,
    private router:      Router,
    private route:       ActivatedRoute               // <-- inyectado
  ) {
    this.newGameForm = this.fb.group({
      color:      ["", Validators.required],
      difficulty: ["", Validators.required],
      botCount:   ["", Validators.required]
    });
  }

  ngOnInit(): void {

    this.playerId = +this.route.snapshot.paramMap.get('playerId')!;
    this.loadSavedGames();  // ya con playerId correcto
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


  onJoinToGame(gameId: number): void {
    // ahora pasamos también playerId
    this.router.navigate(['/board', gameId, this.playerId]);
  }

  onStartNewGame(): void {
    if (this.newGameForm.invalid) return;

    const difficultyMap: Record<'easy'|'medium'|'expert', number> = {
      easy:   1,
      medium: 2,
      expert: 3
    };
    const colorMap: Record<keyof typeof Colors, number> = {
      RED: 1, BLUE: 2, GREEN: 3, YELLOW: 4, PURPLE: 5
    };

    const difficulty = this.newGameForm.get('difficulty')!.value as 'easy'|'medium'|'expert';
    const color      = this.newGameForm.get('color')!.value      as keyof typeof colorMap;
    const botCount   = Number(this.newGameForm.get('botCount')!.value);

    const dto: NewGameRequestDTO = {
      created_by_player_id: this.playerId,
      amount_bot:           botCount,
      game_difficulty:      difficultyMap[difficulty],
      color_id:             colorMap[color]
    };

    this.gameService.createNewGame(dto).subscribe({
      next: response => {
        // ajusta si tu DTO usa snake_case o camelCase:
        const gameId = (response as any).gameId ?? (response as any).game_id;
        this.router.navigate(['/board', gameId, this.playerId]);  // <-- ambos IDs
      },
      error: err => console.error('Error al crear el juego', err)
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
