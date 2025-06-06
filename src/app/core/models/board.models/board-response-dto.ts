import { CountryDTO } from '../../../../../../../TP-TEG-FRONT/src/app/models/country-dto';
import { ContinentDTO } from '../../../../../../../TP-TEG-FRONT/src/app/models/continent-dto';

export interface BoardResponseDTO {
  countries: CountryDTO[];
  continents: ContinentDTO[];
}
