import { Board } from './Board';
import { BotPlayer } from './BotPlayer';

export interface IBotProfile {
  analyze(board: Board, bot: BotPlayer): void;
  decideAttack(bot: BotPlayer): void;
  decideReinforcement(bot: BotPlayer): void;
  decideGroup(bot: BotPlayer): void;
}
