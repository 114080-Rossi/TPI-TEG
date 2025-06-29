import {Component, Input, Output, EventEmitter, SimpleChanges} from '@angular/core';
import {NgIf} from '@angular/common';

@Component({
  selector: 'app-confirm-endturn-modal',
  imports: [
    NgIf
  ],
  templateUrl: './confirm-endturn-modal.component.html',
  styleUrl: './confirm-endturn-modal.component.css',
  standalone: true
})
export class ConfirmEndturnModalComponent {
  @Input() open = false;
  @Output() confirm = new EventEmitter<void>();
  @Output() cancel = new EventEmitter<void>();

  ngOnChanges(changes: SimpleChanges): void {
    if (changes['open'] && changes['open'].currentValue === true) {
      const audio = new Audio('assets/sounds/end_turn.wav');
      audio.play();

      setTimeout(() => {
        audio.pause();
        audio.currentTime = 0;
      }, 2500);
    }
  }

}
