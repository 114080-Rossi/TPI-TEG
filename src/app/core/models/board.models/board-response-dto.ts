import { CountryDTO } from './country-dto';
import { ContinentDTO } from './continent-dto';

export interface BoardResponseDTO {
  countries: CountryDTO[];
  continents: ContinentDTO[];
}
