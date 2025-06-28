// Interfaces para los DTO
export interface NewGameRequestDTO {
  created_by_player_id: number;
  amount_bot: number;
  game_difficulty: number;
  color_id: number;
}

export interface PlayerNewDTO {
  playerId: number;
  color: string;
}

export interface NewGameResponseDTO {
  gameId: number;
  gameDifficulty: string;
  gameState: string;
  createdByPlayerId: number;
  gamePlayerDTOList: PlayerNewDTO[];
}

export interface GameHistory {
  gameId: number;
  localDateTime: string;
  difficultyLevel: string;
  status: string;
  numberPlayer: number;
}

export interface GameDTO {
  gameId: number;
  localDateTime: string;
  difficultyLevel: string;
  status: string;
  turnState: any; // o el tipo correcto si tienes el modelo TurnState
  numberPlayer: number;
}
