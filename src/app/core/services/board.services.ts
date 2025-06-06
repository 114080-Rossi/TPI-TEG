import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BoardResponseDTO } from 'app/core/models/board.models/board-response-dto';
import { Observable } from 'rxjs';
import {CountryDTO} from 'app/core/models/board.models/country-dto';

@Injectable({ providedIn: 'root' })
export class BoardService {
  private apiUrl = 'http://localhost:8081/countries/board'; //

  constructor(private http: HttpClient) {}

  getBoard(): Observable<BoardResponseDTO> {
    return this.http.get<BoardResponseDTO>(this.apiUrl);

  }
  getCountryById(id: number): Observable<CountryDTO> {
    return this.http.get<CountryDTO>(`http://localhost:8081/countries/${id}`);
  }

  findPath(fromId: number, toId: number): Observable<CountryDTO[]> {
    return this.http.get<CountryDTO[]>(`http://localhost:8081/countries/findpath/${fromId}/${toId}`);
  }
}
