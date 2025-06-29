import { Player } from './Player';
import { IBotProfile } from './Interfaces';
import { Board } from './Board';

export class BotPlayer extends Player {
  profile: IBotProfile;

  constructor(name: string, number: number, profile: IBotProfile) {
    super(name, number);
    this.profile = profile;
  }

  playTurn() {}
}
