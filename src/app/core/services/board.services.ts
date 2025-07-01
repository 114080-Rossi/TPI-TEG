import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { BoardResponseDTO } from 'app/core/models/board.models/board-response-dto';
import { Observable } from 'rxjs';
import {CountryDTO} from 'app/core/models/board.models/country-dto';
import {backUrl} from '../../../../env';
import { AttackResultDTO } from 'app/core/models/board.models/attack-result-dto';
import {GameDTO} from 'app/core/models/game/game.model';
import {StartGameDTO} from 'app/core/models/game/startGame';


@Injectable({ providedIn: 'root' })
export class BoardService {
  private apiUrl = backUrl + `/countries`; //

  constructor(private http: HttpClient) {}

  //TODO AGREGARLO EN CADA PETICION
  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
      'ngrok-skip-browser-warning': 'true'
    })
  };

  getBoard(): Observable<BoardResponseDTO> {
    return this.http.get<BoardResponseDTO>(this.apiUrl +`/board`, this.httpOptions);

  }
  getCountryById(id: number): Observable<CountryDTO> {
    return this.http.get<CountryDTO>(this.apiUrl + `/${id}`, this.httpOptions);
  }

  findPath(fromId: number, toId: number): Observable<CountryDTO[]> {
    return this.http.get<CountryDTO[]>(this.apiUrl + `/findpath/${fromId}/${toId}`, this.httpOptions);
  }


  getCountriesByGameAndPlayer(gameId: number, playerId: number) {
    return this.http.get<CountryDTO[]>(backUrl + `/byGameAndPlayer/${gameId}/${playerId}`, this.httpOptions);
  }

  getFullGameStateAsAny(gameId: number) {
    return this.http.get<any>(`${backUrl}/games/${gameId}/status`, this.httpOptions);
  }
}
