/**
 * Componente responsable del registro de nuevos usuarios.
 * Incluye un formulario reactivo con validacion de coincidencia de contraseñas.
 */
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router, RouterModule } from '@angular/router';
import { AuthService } from 'src/app/core/services/auth.service';
import { PlayerRegisterRequestDTO } from 'app/features/register/PlayerRegisterRequestDTO';

@Component({
  selector: 'app-register',
  standalone: true,
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css'],
  imports: [CommonModule, ReactiveFormsModule, RouterModule],
})
export class RegisterComponent implements OnInit {
  /**
   * Formulario de registro con campos de usuario, contraseña y confirmacion.
   */
  registerForm!: FormGroup;

  /**
   * Mensaje mostrado tras intento de registro (exitoso o fallido).
   */
  message: string = '';

  /**
   * Define si el mensaje es de éxito o error para el estilo visual.
   */
  isSuccess: boolean = false;

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router
  ) {}

  /**
   * Inicializa el formulario con validadores requeridos y validación personalizada.
   */
  ngOnInit(): void {
    this.registerForm = this.fb.group({
      username: ['', Validators.required],
      password: ['', Validators.required],
      confirmPassword: ['', Validators.required]
    }, { validator: this.passwordsMatchValidator });
  }

  /**
   * Validador personalizado para verificar coincidencia de contraseñas.
   * @returns null si coinciden, objeto con error si no.
   */
  private passwordsMatchValidator(form: FormGroup): object | null {
    const password = form.get('password')?.value;
    const confirmPassword = form.get('confirmPassword')?.value;

    if (password === confirmPassword) {
      return null;
    } else {
      return { mismatch: true };
    }
  }

  /**
   * Procesa el registro enviando los datos al backend si el formulario es valido.
   * Excluye el campo confirmPassword al enviar la solicitud.
   */
  register(): void {
    if (this.registerForm.invalid) {
      this.message = 'Complete todos los campos.';
      this.isSuccess = false;
      return;
    }

    const username = this.registerForm.value.username.trim().toLowerCase();

    const request: PlayerRegisterRequestDTO = {
      username: username,
      password: this.registerForm.value.password,
      name: '',
      avatar: '',
      playerTypeId: 1,
      playerProfileId: 1
    };

    this.authService.register(request).subscribe({
      next: () => {
        this.isSuccess = true;
        this.message = 'Usuario registrado correctamente.';
        setTimeout(() => this.router.navigate(['/']), 1500);
      },
      error: () => {
        this.isSuccess = false;
        this.message = 'No se pudo registrar. El usuario ya existe.';
      }
    });
  }
}
