import { Component, AfterViewInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BoardService } from 'app/core/services/board.services';
import { CountryDTO } from 'app/core/models/board.models/country-dto';
import { FormsModule } from '@angular/forms';


@Component({
  selector: 'app-board',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './board.html',
  styleUrls: ['./board.css'],
})
export class BoardComponent implements AfterViewInit {
  countries: CountryDTO[] = [];
  selectedCountryId: number | null = null;
  svgDoc: Document | null = null;
  selectedOriginId: number | null = null;
  selectedDestinationId: number | null = null;
  caminoActual: CountryDTO[] = [];

  constructor(private boardService: BoardService) {}

  ngAfterViewInit(): void {
    const svgElement = document.getElementById('svgMap') as HTMLObjectElement;

    svgElement.addEventListener('load', () => {
      this.svgDoc = svgElement.contentDocument;
      if (!this.svgDoc) {
        console.error('No se pudo acceder al contenido del SVG.');
        return;
      }

      this.boardService.getBoard().subscribe((response) => {
        this.countries = response.countries ?? response;
        console.log("CARGADOS:", this.countries);
        this.pintarMapa();
      });
    });

  }


  mostrarCamino(): void {
    if (!this.selectedOriginId || !this.selectedDestinationId) {
      alert('Elegí un país de origen y destino');
      return;
    }

    this.boardService.findPath(this.selectedOriginId, this.selectedDestinationId)
      .subscribe((camino: CountryDTO[]) => {
        this.caminoActual = camino;
        this.animarCamino(camino);
      });
  }

  animarCamino(camino: CountryDTO[]): void {
    if (!this.svgDoc) return;

    let index = 0;

    const interval = setInterval(() => {
      if (index >= camino.length) {
        clearInterval(interval);
        return;
      }

      const country = camino[index];
      const element = this.svgDoc!.getElementById(String(country.id));

      if (element) {
        element.setAttribute('fill', '#FFD700'); // Amarillo
      }

      index++;
    }, 500); // 500ms entre país y país
  }


  pintarMapa(): void {
    if (!this.svgDoc) return;

    this.countries.forEach(country => {
      const element = this.svgDoc!.getElementById(String(country.id));

      if (element) {

        element.setAttribute('fill', 'lightblue');
        element.style.cursor = 'pointer';


        element.addEventListener('click', () => {
          console.log(`🖱️ País seleccionado:`, {
            id: country.id,
            name: country.name,
            armies: country.armies,
            continentId: country.continent.id,
            borders: country.borderIds
          });

          this.seleccionarPorId(country.id);
        });


        element.addEventListener('mouseenter', () => {
          if (country.id !== this.selectedCountryId) {
            element.setAttribute('fill', '#87CEEB');
          }
        });

        element.addEventListener('mouseleave', () => {
          if (country.id !== this.selectedCountryId) {
            element.setAttribute('fill', 'lightblue');
          }
        });
      }
    });
  }


  actualizarSeleccion(): void {
    if (!this.svgDoc) return;

    this.countries.forEach((country) => {
      const element = this.svgDoc!.getElementById(String(country.id));

      if (element) {

        if (country.id === this.selectedCountryId) {
          element.setAttribute('style', 'fill: red; cursor: pointer;');
        }

        else if (
          this.selectedCountryId !== null &&
          this.countries.find(c => c.id === this.selectedCountryId)?.borderIds.includes(country.id)
        ) {
          element.setAttribute('style', 'fill: orange; cursor: pointer;');
        }

        else {
          element.setAttribute('style', 'fill: #9be09e; cursor: pointer;');
        }
      }
    });
  }

  seleccionarPorId(id: number): void {
    console.log('🖱️ Selección del país con ID:', id);

    if (this.selectedCountryId === id) {
      this.selectedCountryId = null;
      this.actualizarSeleccion();
      console.log('🔙 País deseleccionado');
      return;
    }

    const country = this.countries.find(c => c.id === id);

    if (country) {
      console.log('✅ País encontrado:', country.name);
      this.selectedCountryId = country.id;
      this.actualizarSeleccion();
    } else {
      console.warn(`❌ País no encontrado con ID: ${id}`);
    }
  }

}
