import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {backUrl} from '../../../../env';
import {PlaceArmiesRequestDTO} from 'app/core/models/board.models/turns-model';
import {attackRequestDTO} from 'app/core/models/game/attackRequestDTO';

@Injectable({ providedIn: 'root' })
export class TurnsService {

  private BASE_URL = backUrl + '/turns';
  constructor(private http: HttpClient) {}

  //TODO AGREGARLO EN CADA PETICION
  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
      'ngrok-skip-browser-warning': 'true'
    })
  };

  postTurnDistribuir(dto: any) {
    const url = this.BASE_URL + '/placeArmies';
    return this.http.post<void>(url, dto, this.httpOptions);
  }

  postAttack(dto: attackRequestDTO) {
    const url = this.BASE_URL + '/attack';
    return this.http.post<any>(url, dto, this.httpOptions);
  }
}
