import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { LoginRequest, LoginResponse } from 'src/app/core/models/interfaces/player/player.login.model';
import {backUrl} from '../../../../env';

/**
 * Servicio que gestiona la autenticación de usuarios.
 * Proporciona métodos para login y registro comunicándose con el backend.
 */
@Injectable({ providedIn: 'root' })
export class AuthService {
  /**
   * URL base de la API backend.
   */
  private BASE_URL = backUrl;
  constructor(private http: HttpClient) {}

  /**
   * Envia credenciales al backend para iniciar sesion.
   * @param data Objeto con username y password
   * @returns Observable con la respuesta del backend (LoginResponse)
   */
  login(data: LoginRequest): Observable<LoginResponse> {
    return this.http.post<LoginResponse>(`${this.BASE_URL}/players/login`, data);
  }
  /**
   * Envia los datos necesarios al backend para registrar un nuevo usuario.
   * @param data Datos del nuevo jugador (excluye confirmación de contraseña)
   * @returns Observable con la respuesta del backend
   */
  register(data: any): Observable<any> {
    return this.http.post(`${this.BASE_URL}/players/register`, data);
  }

}
