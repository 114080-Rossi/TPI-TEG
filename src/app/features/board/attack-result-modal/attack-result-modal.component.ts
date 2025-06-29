import { Component, Input, Output, EventEmitter } from '@angular/core';
import { AttackResultDTO } from 'app/core/models/board.models/attack-result-dto';
import {NgForOf, NgIf} from '@angular/common';

@Component({
  selector: 'app-attack-result-modal',
  imports: [
    NgIf,
    NgForOf
  ],
  templateUrl: './attack-result-modal.component.html',
  styleUrl: './attack-result-modal.component.css',
  standalone: true
})
export class AttackResultModalComponent {
  @Input() open: boolean = false;
  @Input() result!: AttackResultDTO;
  @Output() close = new EventEmitter<void>();

  ngOnChanges() {
    if (this.open) {
      const audio = new Audio('assets/sounds/dice.mp3');
      audio.play();
    }
  }
}
