import { Player } from './Player';

export class Country {
  name: string;
  continent: string;
  occupant: Player | null;
  armies: number;
  borders: Country[];

  constructor(name: string, continent: string) {
    this.name = name;
    this.continent = continent;
    this.occupant = null;
    this.armies = 0;
    this.borders = [];
  }
}
