import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { NgIf, NgForOf } from '@angular/common';

@Component({
  selector: 'app-welcome',
  standalone: true,
  imports: [NgIf, NgForOf],
  templateUrl: './welcome.component.html',
  styleUrls: ['./welcome.component.css']
})
export class WelcomeComponent {
  border = Array.from({ length: 14 });

  team = [
    { nombre: 'Brizuela Tomas', legajo: '406132' },
    { nombre: 'Leiva Tamara', legajo: '412349' },
    { nombre: 'Orozco Carlos', legajo: '412099' },
    { nombre: 'Rossi Brian', legajo: '114080' },
    { nombre: 'Veron Andres', legajo: '113872' }
  ];

  showTeam = false;

  constructor(private router: Router) {}

  goLogin(): void {
    this.router.navigate(['/login']);
  }

  openRules(): void {
    window.open('https://yetem.com/wp-content/uploads/2017/06/TEG.pdf', '_blank');
  }
}

