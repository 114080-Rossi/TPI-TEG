import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { BoardResponseDTO } from 'app/core/models/board.models/board-response-dto';
import { Observable } from 'rxjs';
import {CountryDTO} from 'app/core/models/board.models/country-dto';
import {backUrl} from '../../../../env';
import { AttackResultDTO } from 'app/core/models/board.models/attack-result-dto';


@Injectable({ providedIn: 'root' })
export class BoardService {
  private apiUrl = backUrl + `/countries`; //

  constructor(private http: HttpClient) {}

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

  attack(gameId: number, playerId: number, fromCountryId: number, toCountryId: number, attackingArmies: number) {
    return this.http.post<AttackResultDTO>(backUrl + '/turns/attack', {
      gameId,
      playerId,
      fromCountryId,
      toCountryId,
      attackingArmies
    }, this.httpOptions);
  }

  placeArmies(
    gameId: number,
    playerId: number,
    countryId: number,
    numArmies: number
  ) {
    return this.http.post<void>(backUrl + '/turns/placeArmies', {
      gameId,
      playerId,
      countryId,
      numArmies
    }, this.httpOptions);
  }

  getCountriesByGameAndPlayer(gameId: number, playerId: number) {
    return this.http.get<CountryDTO[]>(backUrl + `/countries/byGameAndPlayer/${gameId}/${playerId}`, this.httpOptions);
  }
}
