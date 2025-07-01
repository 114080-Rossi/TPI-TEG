// services/game.service.ts
import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {map, Observable} from 'rxjs';
import {backUrl} from '../../../../env';
import {GameDTO, GameHistory, NewGameRequestDTO, NewGameResponseDTO, PlayerNewDTO} from '../models/game/game.model';
import {ColorDTO, GameJoinRequestDTO, StartGameDTO} from 'app/core/models/game/startGame';


@Injectable({providedIn: 'root'})
export class GameService {
  /**
   * URL base de la API backend.
   */
  private apiUrl = backUrl + `/games`;

  constructor(private http: HttpClient) {}

  //TODO AGREGARLO EN CADA PETICION
  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
      'ngrok-skip-browser-warning': 'true'
    })
  };

  /**
   * Crear nueva partida
   */
  createNewGame(gameData: NewGameRequestDTO): Observable<NewGameResponseDTO> {
    return this.http.post<any>(`${this.apiUrl}/new`, gameData, this.httpOptions).pipe(
      map(response => ({
        gameId: response.game_id,
        gameDifficulty: response.game_difficulty,
        gameState: response.game_state,
        createdByPlayerId: response.created_by_player_id,
        gamePlayerDTOList: response.game_players
      }))
    );
  }

  /**
   * Post game start -> Empezar Game
   */
  startGame(gameId: number): Observable<StartGameDTO> {
    return this.http.post<StartGameDTO>(`${this.apiUrl}/${gameId}/start`, {}, this.httpOptions);
  }

    /**
     * Cargar todas las partida por ID del player
     */
    getGamesByPlayer(playerId: number): Observable<GameHistory[]> {
      return this.http.get<any[]>(`${this.apiUrl}/history/${playerId}`, this.httpOptions).pipe(
        map(games => games.map(game => ({
          gameId: game.game_id,
          localDateTime: game.game_created_at,
          difficultyLevel: game.game_difficulty,
          status: game.game_status,
          numberPlayer: game.number_players
        })))
      );
    }

  /**
   * Obtener id del game creado
   */
  getJoinGameNumber(): Observable<number> {
    return this.http.get<any>(`${this.apiUrl}/lastest`, this.httpOptions).pipe(
      map(res => res.game_id)
    );
  }

  /**
   * Obtener game por Id.
   */
  getGameById(gameId: number): Observable<GameDTO> {
    return this.http.get<any>(`${this.apiUrl}/${gameId}`, this.httpOptions).pipe(
      map(response => ({
        gameId: response.game_id,
        localDateTime: response.game_created_at,
        difficultyLevel: response.game_difficulty,
        status: response.game_status,
        turnState: response.turn_state,
        numberPlayer: response.number_players
      }))
    );
  }
  /**
   * Obtener los colores del game.
   */
  getVerifyGame(gameId: number): Observable<ColorDTO[]> {
    return this.http.get<{ color_list: { color_id: number, color_name: string }[] }>(`${this.apiUrl}/${gameId}/verify`, this.httpOptions).pipe(
      map(response => (response.color_list ?? []).map(color => ({
        id: color.color_id,
        colorName: color.color_name
      })))
    );
  }

  /**
   * Post para unirse a la partida.
   */
  joinGame(gameId: number, joinRequest: GameJoinRequestDTO): Observable<any> {
    return this.http.post(`${this.apiUrl}/${gameId}/join`, joinRequest, { responseType: 'text' });
  }
}
