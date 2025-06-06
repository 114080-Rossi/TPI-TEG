/**
 * Datos requeridos para registrar un nuevo jugador.
 */
export interface PlayerRegisterRequestDTO {
  /** Nombre de usuario deseado por el jugador. */
  username: string;

  /** Contraseña elegida para la cuenta. */
  password: string;

  /** Nombre real del jugador o alias visible. */
  name: string;

  /** Ruta o nombre del avatar del jugador. */
  avatar: string;

  /** ID del tipo de jugador. */
  playerTypeId: number;

  /** ID del perfil del jugador.  */
  playerProfileId: number;
}

