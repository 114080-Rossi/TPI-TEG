import { ContinentDTO } from './continent-dto';

export interface CountryDTO {
  id: number;
  name: string;
  armies: number;
  continent: ContinentDTO;
  borderIds: number[];
  svgId: string;
}
