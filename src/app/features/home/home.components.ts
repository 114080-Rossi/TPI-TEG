import { Component, OnInit } from '@angular/core';
import { CommonModule }      from '@angular/common';
import {  FormBuilder,  FormGroup,  ReactiveFormsModule,  Validators} from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { GameService } from 'app/core/services/game.service';
import {GameHistory, NewGameRequestDTO} from 'app/core/models/game/game.model';

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
  showNewGameForm = false
  showLoadGameList = false
  newGameForm: FormGroup
  savedGames: GameHistory[] = []
  currentDate: Date = new Date();
  joinGameId: number | null = null;
  showJoinGameForm = false;
  playerId: number| null = null;

  swords = Array.from({ length: 14 });

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
    //this.playerId = +this.route.snapshot.paramMap.get('playerId')!;
    const param = this.route.snapshot.paramMap.get('id');
    this.playerId = param != null ? Number(param) : null;

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

    const formValue = this.newGameForm.value;
    //const playerId = 1063 //Number(sessionStorage.getItem('playerId')); // TODO Reemplaza con el ID real del jugador sessionstorage

    const difficulty = this.newGameForm.get('difficulty')!.value as 'easy'|'medium'|'expert';
    const color      = this.newGameForm.get('color')!.value      as keyof typeof colorMap;
    const botCount   = Number(this.newGameForm.get('botCount')!.value);

    if (this.playerId === null){
      console.error('playerId es null en onStartNewGame');
      return;
    }

    const newGameRequest: NewGameRequestDTO = {
      color_id: colorMap[color],
      game_difficulty: difficultyMap[difficulty],
      amount_bot: botCount,
      created_by_player_id: this.playerId
    };

    this.gameService.createNewGame(newGameRequest).subscribe({
      next: (response) => {
        if (response && response.gameId !== undefined && response.gameId !== null) {
          const gameId = (response as any).gameId ?? (response as any).game_id;
          //this.router.navigate(['/waiting-room', response.gameId]);
          this.router.navigate(['/waiting-room', gameId, this.playerId]);  // <-- ambos IDs

        } else {
          console.error('gameId es undefined o null en la respuesta');
        }
// =======

//     const dto: NewGameRequestDTO = {
//       created_by_player_id: this.playerId,
//       amount_bot:           botCount,
//       game_difficulty:      difficultyMap[difficulty],
//       color_id:             colorMap[color]
//     };

//     this.gameService.createNewGame(dto).subscribe({
//       next: response => {
//         // ajusta si tu DTO usa snake_case o camelCase:
//         const gameId = (response as any).gameId ?? (response as any).game_id;
//         this.router.navigate(['/board', gameId, this.playerId]);  // <-- ambos IDs
// >>>>>>> weekNine
      },
      error: err => console.error('Error al crear el juego', err)
    });

    this.newGameForm.reset();
    this.showNewGameForm = false;
  }

  onSelectSavedGame(game: GameHistory) {
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

  private saveGame(gameConfig: GameHistory) {
    this.savedGames.push(gameConfig)
    this.updateLocalStorage()
  }

  loadSavedGames() {
    //const playerId = 1063; // TODO: Reemplaza con el ID real del jugador
    if (this.playerId === null){
      console.error('playerId es null en loadSavedGames');
      return;
    }
    this.gameService.getGamesByPlayer(this.playerId).subscribe({
      next: (games) => {
        this.savedGames = games.map(game => ({
          gameId: game.gameId,
          localDateTime: game.localDateTime,
          difficultyLevel: game.difficultyLevel,
          status: game.status,
          numberPlayer: game.numberPlayer
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
