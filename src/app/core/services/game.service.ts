// services/game.service.ts
import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {map, Observable} from 'rxjs';
import {backUrl} from '../../../../env';

// Interfaces para los DTO
export interface NewGameRequestDTO {
  created_by_player_id: number;
  amount_bot: number;
  game_difficulty: number;
  color_id: number;
}

export interface NewGameResponseDTO {
  gameId: number;
  gameDifficulty: string;
  gameState: string;
  currentTurnPlayerId: number | null;
  createdByPlayerId: number;
  turnState: string;
}

@Injectable({providedIn: 'root'})
export class GameService {
  /**
   * URL base de la API backend.
   */
  private apiUrl = backUrl + `/games`;

  constructor(private http: HttpClient) {}

  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    })
  };

  /**
   * Crear nueva partida
   */
  createNewGame(gameData: NewGameRequestDTO): Observable<NewGameResponseDTO> {
    return this.http.post<NewGameResponseDTO>(
      `${this.apiUrl}/new`,
      gameData,
      this.httpOptions
    );
  }
  /**
   * Cargar partida por ID
   */
  getGamesByPlayer(playerId: number): Observable<NewGameResponseDTO[]> {
    return this.http.get<NewGameResponseDTO[]>(`${this.apiUrl}/history/${playerId}`);
  }

  /**
   * Obtener id del game creado
   */
  getJoinGameNumber(): Observable<number> {
    return this.http.get<any>(`${this.apiUrl}/lastest`).pipe(
      map(res => res.game_id)
    );
  }
}
