import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BoardResponseDTO } from 'app/core/models/board.models/board-response-dto';
import { Observable } from 'rxjs';
import {CountryDTO} from 'app/core/models/board.models/country-dto';
import {backUrl} from '../../../../env';
import { AttackResultDTO } from 'app/core/models/board.models/attack-result-dto';


@Injectable({ providedIn: 'root' })
export class BoardService {
  private apiUrl = backUrl + `/countries`; //

  constructor(private http: HttpClient) {}

  getBoard(): Observable<BoardResponseDTO> {
    return this.http.get<BoardResponseDTO>(this.apiUrl +`/board`);

  }
  getCountryById(id: number): Observable<CountryDTO> {
    return this.http.get<CountryDTO>(this.apiUrl + `/${id}`);
  }

  findPath(fromId: number, toId: number): Observable<CountryDTO[]> {
    return this.http.get<CountryDTO[]>(this.apiUrl + `/findpath/${fromId}/${toId}`);
  }

  attack(gameId: number, playerId: number, fromCountryId: number, toCountryId: number, attackingArmies: number) {
    return this.http.post<AttackResultDTO>(backUrl + '/turns/attack', {
      gameId,
      playerId,
      fromCountryId,
      toCountryId,
      attackingArmies
    });
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
    });
  }

  getCountriesByGameAndPlayer(gameId: number, playerId: number) {
    return this.http.get<CountryDTO[]>(backUrl + `/countries/byGameAndPlayer/${gameId}/${playerId}`);
  }
}
