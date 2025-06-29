import { Country } from './Country';

export class Board {
  countries: Country[];

  constructor() {
    this.countries = [];
  }

  getCountry(name: string): Country | undefined {
    return this.countries.find(c => c.name === name);
  }
}
