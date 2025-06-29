import { Country } from './Country';

export abstract class Player {
  name: string;
  number: number;
  objective: Objective | null;
  countries: Country[];
  armies: number;
  pacts: Pact[];

  constructor(name: string, number: number) {
    this.name = name;
    this.number = number;
    this.objective = null;
    this.countries = [];
    this.armies = 0;
    this.pacts = [];
  }

  abstract playTurn(): void;
}
