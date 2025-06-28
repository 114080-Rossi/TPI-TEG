import {Component, EventEmitter, Output, Input} from '@angular/core';

import {CommonModule} from '@angular/common';

@Component({
  selector:    'app-player-info',
  standalone:  true,
  imports:     [ CommonModule ],
  templateUrl: './playerinfo.html',
  styleUrls: ['./PlayerInfo.css']
})
export class PlayerinfoComponent {
  /** Texto con el objetivo del jugador */
  @Input() objective: string = '';

  /** Eventos para los botones */
  @Output() rollDice   = new EventEmitter<void>();
  @Output() attack     = new EventEmitter<void>();
  @Output() regroup    = new EventEmitter<void>();
  @Output() endTurn    = new EventEmitter<void>();
}
