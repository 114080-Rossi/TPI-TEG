/**
 * Componente encargado de la lógica de inicio de sesión.
 * Muestra un formulario reactivo y comunica con AuthService para autenticar al usuario.
 */
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { Router, RouterModule } from '@angular/router';
import { AuthService } from 'app/core/services/auth.service';
import { CommonModule } from '@angular/common';

@Component({
  standalone: true,
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
  imports: [CommonModule, ReactiveFormsModule, RouterModule]
})
export class LoginComponent implements OnInit {
  /**
   * Formulario de login reactivo con validaciones requeridas.
   */
  loginForm!: FormGroup;

  /**
   * Mensaje de error mostrado si las credenciales no son validas.
   */
  errorMessage: string = '';

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router
  ) {}

  /**
   * Inicializa el formulario con campos validados.
   */
  ngOnInit(): void {
    this.loginForm = this.fb.group({
      username: ['', Validators.required],
      password: ['', Validators.required]
    });
  }

  /**
   * Llama al servicio de login con las credenciales ingresadas.
   * Si el login es exitoso, redirige al componente home.
   * Si falla, muestra un mensaje de error.
   */
  onSubmit(): void {

    if (this.loginForm.invalid) {
      return;
    }

    const username = this.loginForm.value.username.trim().toLowerCase();
    const password = this.loginForm.value.password;

    const credenciales = { username, password };

    this.authService.login(credenciales).subscribe({
      next: (response) => {
        sessionStorage.setItem('playerId', response.id.toString());
        this.router.navigate(['/home', response.id]);
      },
      error: () => {
        this.errorMessage = 'Asegurate de que el usuario exista o revisa tu usuario y contraseña';
      }
    });
  }
}

