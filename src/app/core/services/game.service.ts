// services/game.service.ts
import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { Observable } from 'rxjs';

// Interfaces para los DTO
export interface NewGameRequestDTO {
  gameDifficulty: number;
  colorPlayer: number;
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
  private apiUrl = 'http://localhost:8081/games';

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
      `${this.apiUrl}/newGame`,
      gameData,
      this.httpOptions
    );
  }
  /**
   * Cargar partida por ID
   */
  getGamesByPlayer(playerId: number): Observable<NewGameResponseDTO[]> {
    return this.http.get<NewGameResponseDTO[]>(`${this.apiUrl}/byPlayer/${playerId}`);
  }

}
