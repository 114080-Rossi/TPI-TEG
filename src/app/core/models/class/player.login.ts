/**
 * Datos necesarios para iniciar sesión.
 */
export interface LoginRequest {
  /** Nombre de usuario */
  username: string;

  /** Contraseña del usuario */
  password: string;
}

/**
 * Respuesta devuelta por el backend al hacer login.
 */
export interface LoginResponse {
  /** ID del jugador */
  id: number;

  /** Nombre de usuario */
  username: string;

  /** Mensaje opcional de confirmación */
  message: string;
}
