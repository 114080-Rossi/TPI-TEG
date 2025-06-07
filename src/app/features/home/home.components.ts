import {GameService, NewGameRequestDTO} from 'app/core/services/game.service';

interface GameConfig {
  id: string
  color: string
  difficulty: string
  date: Date
  status: string
}

import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import {FormBuilder, FormGroup, ReactiveFormsModule, Validators} from '@angular/forms';
import {Router} from '@angular/router';

@Component({
  selector: 'app-home',
  standalone: true,
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
  imports: [CommonModule, ReactiveFormsModule]
})

export class HomeComponent {
  showNewGameForm = false
  showLoadGameList = false
  newGameForm: FormGroup
  savedGames: GameConfig[] = []
  currentDate: Date = new Date();

  colorOptions = [
    { value: "red", label: "Rojo" },
    { value: "blue", label: "Azul" },
    { value: "green", label: "Verde" },
    { value: "yellow", label: "Amarillo" },
    { value: "purple", label: "Morado" }
  ]

  difficultyOptions = [
    { value: "easy", label: "Fácil" },
    { value: "medium", label: "Medio" },
    { value: "expert", label: "Experto" }
  ]

  constructor(private fb: FormBuilder,
              private gameService: GameService) {
    this.newGameForm = this.fb.group({
      color: ["", Validators.required],
      difficulty: ["", Validators.required]
    })

    this.loadSavedGames()
  }

  onNewGame() {
    this.showNewGameForm = true
    this.showLoadGameList = false
  }

  onLoadGame() {
    this.showLoadGameList = true
    this.showNewGameForm = false
  }

  onStartNewGame() {
    const difficultyMap: { [key: string]: number } = {
      easy: 1,
      medium: 2,
      expert: 3
    };
    const colorMap: { [key: string]: number } = {
      red: 1,
      blue: 2,
      green: 3,
      yellow: 4,
      purple: 5
    }
    const selectedDifficulty = this.newGameForm.value.difficulty;
    const selectedColor = this.newGameForm.value.color;

    const newGameRequest: NewGameRequestDTO = {
      gameDifficulty: difficultyMap[selectedDifficulty],
      colorPlayer: colorMap[selectedColor]
    };

      this.gameService.createNewGame(newGameRequest).subscribe({
        next: (response) => console.log('Guardado en backend:', response),
        error: (err) => console.error('Error al guardar en backend', err)
      });

      this.newGameForm.reset();
      this.showNewGameForm = false;
  }

  onSelectSavedGame(game: GameConfig) {
    // Aquí puedes navegar a la pantalla del juego con la configuración cargada
    this.showLoadGameList = false
  }

  onDeleteSavedGame(gameId: string) {
    this.savedGames = this.savedGames.filter(game => game.id !== gameId)
    this.updateLocalStorage()
  }

  onCancel() {
    this.showNewGameForm = false
    this.showLoadGameList = false
    this.newGameForm.reset()
  }

  private generateGameId(): string {
    return "game_" + Date.now() + "_" + Math.random().toString(36).substr(2, 9)
  }

  private saveGame(gameConfig: GameConfig) {
    this.savedGames.push(gameConfig)
    this.updateLocalStorage()
  }

  private loadSavedGames() {
    console.log('Loading existing game...');
    const saved = localStorage.getItem("savedGames")
    if (saved) {
      this.savedGames = JSON.parse(saved).map((game: any) => ({
        ...game,
        date: new Date(game.date)
      }))
    }
  }

  private updateLocalStorage() {
    localStorage.setItem("savedGames", JSON.stringify(this.savedGames))
  }

  getColorClass(color: string): string {
    return `color-${color}`
  }

  getDifficultyClass(difficulty: string): string {
    return `difficulty-${difficulty}`
  }


}
