import { Player } from './Player';
import { Board } from './Board';

export abstract class Card {
  id: number;
  name: string;
  description: string;

  constructor(id: number, name: string, description: string) {
    this.id = id;
    this.name = name;
    this.description = description;
  }

  abstract applyEffect(player: Player, board: Board): void;
}
