import {ContinentDTO} from 'app/core/models/board.models/continent-dto';

export interface GamePlayerDTO {
  playerId: number;
  turnOrder: number;
  color: ColorDTO;
  objetiveCard: ObjetiveCardDTO;
  countryList: CountryMatchDTO[];
}

export enum TurnState {
  STARTED = 'STARTED',
  FINISHED = 'FINISHED',
  PAUSE = 'PAUSE',
  CANCELED = 'CANCELED'
}
export interface ColorDTO {
  id: number;
  colorName: string;
}

export interface ObjetiveCardDTO {
  objetiveId: number;
  cardId: number;
  detail: string;
  cardTypeName: string;
}

export interface CountryMatchDTO {
  id: number;
  name: string;
  armies: number;
  continent: ContinentDTO;
}

export interface StartGameDTO {
  id: number;
  difficultyLevel: string;
  gameState: string;
  turnState: TurnState;
  numberPlayer: number;
  gamePlayerDTOList: GamePlayerDTO[];
}

