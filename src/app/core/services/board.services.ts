import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BoardResponseDTO } from 'app/core/models/board.models/board-response-dto';
import { Observable } from 'rxjs';
import {CountryDTO} from 'app/core/models/board.models/country-dto';
import {backUrl} from '../../../../env';

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
}
