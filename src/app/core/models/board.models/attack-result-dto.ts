export interface AttackResultDTO {
  attackerDice: number[];
  defenderDice: number[];
  lostAttackerArmies: number;
  lostDefenderArmies: number;
  conquered: boolean;
  message: string;
}
