import {Component, AfterViewInit, OnInit} from '@angular/core';
import { CommonModule } from '@angular/common';
import { BoardService } from 'app/core/services/board.services';
import { CountryDTO } from 'app/core/models/board.models/country-dto';
import { FormsModule } from '@angular/forms';

import {StartGameDTO} from 'app/core/models/game/startGame';
import {Router} from '@angular/router';

import {PlayerinfoComponent} from 'app/features/PlayerInfo/playerinfo.component';
import {ActivatedRoute} from '@angular/router';
import { AttackModalComponent } from './attack-modal/attack-modal.component';
import { RegroupModalComponent } from './regroup-modal/regroup-modal.component';
import { DistributeArmiesModalComponent } from './distribute-armies-modal/distribute-armies-modal.component';
import {Assignment} from 'app/core/models/assignments/assignment.model';


@Component({
  standalone: true,
  imports: [CommonModule, FormsModule, PlayerinfoComponent, AttackModalComponent, RegroupModalComponent, DistributeArmiesModalComponent],
  selector:   'app-board',
  templateUrl:'./board.html',
  styleUrls: ['./board.css'],
})
export class BoardComponent implements OnInit, AfterViewInit {
  countries: CountryDTO[] = [];
  selectedCountryId: number | null = null;
  svgDoc: Document | null = null;
  selectedOriginId: number | null = null;
  selectedDestinationId: number | null = null;
  caminoActual: CountryDTO[] = [];
  game!: StartGameDTO;
  gameId!:   number;
  playerId!: number;
  objective = '📝 Objetivo de ejemplo';

  constructor(
    private boardService: BoardService,
    private route: ActivatedRoute,
    private router: Router
  ) {}


  ngOnInit(): void {
    const navigation = this.router.getCurrentNavigation();
    this.game = navigation?.extras.state?.['game'] as StartGameDTO;
    console.log('ngOnInit ejecutado');
    this.gameId   = +this.route.snapshot.paramMap.get('gameId')!;
    this.playerId = +this.route.snapshot.paramMap.get('playerId')!;
  }

    playSound(file: string, duration?: number) {
    const audio = new Audio();
    audio.src = `assets/sounds/${file}`;
    audio.load();
    if (duration) {
      audio.addEventListener('play', () => {
        setTimeout(() => {
          audio.pause();
          audio.currentTime = 0;
        }, duration * 1500);
      });
    }
    audio.play();
  }


  ngAfterViewInit(): void {
    const svgElement = document.getElementById('svgMap') as HTMLObjectElement;

      if (!svgElement) {
        console.error('❌ No se encontró el elemento SVG');
        return;
      }

      const onLoad = () => {
        this.svgDoc = svgElement.contentDocument;
        if (!this.svgDoc) {
          console.error('❌ No se pudo acceder al contenido del SVG.');
          return;
        }

        this.boardService.getBoard().subscribe((response) => {
          this.countries = response.countries ?? response;
          console.log("CARGADOS:", this.countries);
          console.log("✅ CARGADOS:", this.countries);
          this.pintarMapa();
        });
      };

    if (svgElement.contentDocument?.rootElement) {
      console.warn('⚠️ SVG ya estaba cargado al iniciar');
      onLoad();
    } else {
      svgElement.addEventListener('load', onLoad);
    }
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
      const baseId = String(country.id);

      const elements = [
        this.svgDoc!.getElementById(baseId),
        this.svgDoc!.getElementById(`${baseId}b`)
      ].filter(e => e !== null)
        .map(e => e as unknown as SVGElement);


      elements.forEach(el => {
        el.setAttribute('fill', '#FFD700'); // Color dorado para marcar camino
      });

      index++;
    }, 500);
  }

  pintarMapa(): void {
    if (!this.svgDoc) return;

    this.countries.forEach(country => {
      const baseId = String(country.id);
      const element = this.svgDoc!.getElementById(baseId);
      const border = this.svgDoc!.getElementById(`${baseId}b`);

      [element, border].forEach(el => {
        if (el) {
          console.log(`✅ Elemento encontrado para país ${country.name} con ID: ${el.id}`);
          el.setAttribute('fill', 'lightblue');
          el.style.cursor = 'pointer';

          el.addEventListener('click', () => {
            this.seleccionarPorId(country.id);
          });

          el.addEventListener('mouseenter', () => {
            if (country.id !== this.selectedCountryId) {
              el.setAttribute('fill', '#87CEEB');
            }
          });

          el.addEventListener('mouseleave', () => {
            if (country.id !== this.selectedCountryId) {
              el.setAttribute('fill', 'lightblue');
            }
          });
        } else {
          console.warn(`❌ No se encontró el elemento con ID: ${el === element ? baseId : `${baseId}b`}`);
        }
      });
    });
  }

  actualizarSeleccion(): void {
    if (!this.svgDoc) return;

    this.countries.forEach((country) => {
      const elements = [
        this.svgDoc!.getElementById(country.id.toString()),
        this.svgDoc!.getElementById(`${country.id}b`)
      ].filter((e): e is HTMLElement => e !== null)
        .map(e => e as unknown as SVGElement);

      elements.forEach(el => {
        if (country.id === this.selectedCountryId) {
          el.setAttribute('style', 'fill: red; cursor: pointer;'); //El seleccionado es rojo
        } else if (
          this.selectedCountryId !== null &&
          this.countries.find(c => c.id === this.selectedCountryId)
            ?.borderIds.includes(country.id)
        ) {
          el.setAttribute('style', 'fill: orange; cursor: pointer;'); // Los borders son naranjas
        } else {
          el.setAttribute('style', 'fill: #b3b3b3; cursor: pointer;'); // el resto es gris
        }
      });
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
  rollDice(): void {
    console.log('rollDice pulsado');
    //TODO
  }

  modalAtaqueAbierto = false;
  /** Se disparará al hacer click en “Atacar” */
  attack(): void {
    this.playSound('espada_ataque.wav', 0.5);
    console.log('attack pulsado');
    this.modalAtaqueAbierto = true;
  }

  onAttackConfirm(event: { from: number, to: number, armies: number }) {
    // solo para test, luego llamas al servicio aquí
    console.log('Confirmado ataque:', event);
    this.modalAtaqueAbierto = false;
  }

  modalRegroupAbierto = false;
  /** Se disparará al hacer click en “Reagrupar” */
  regroup(): void {
    this.playSound('army_regroup.wav', 1);
    console.log('regroup pulsado');
    this.modalRegroupAbierto = true;
  }

  onRegroupConfirm(event: { from: number, to: number, armies: number }) {
    // Llama aquí al BoardService con el endpoint de /turns/regroup
    // this.boardService.regroup(this.gameId, this.playerId, event.from, event.to, event.armies).subscribe(...);
    console.log('Reagrupación:', event);
    this.modalRegroupAbierto = false;
  }

  modalDistributeOpen = false;
  distributeArmies(): void {
    this.playSound('army_insert.wav', 1);
    console.log('Repartir Ejército pulsado');
    this.modalDistributeOpen = true;
  }

  onDistributeConfirm(assignments: Assignment[]) {
    console.log('Reparto final:', assignments);
    this.modalDistributeOpen = false;
    // Aquí llamas al backend, procesas el resultado, etc.
  }

  /** Se disparará al hacer click en “Terminar Turno” */
  endTurn(): void {
    console.log('endTurn pulsado');
    //TODO
  }
}
