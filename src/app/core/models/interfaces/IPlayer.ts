
export interface IPlayer {
  name: string;
  number: number;
  objective: Objective | null;
  countries: Country[];
  armies: number;
  pacts: Pact[];
}
