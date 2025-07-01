import {Component, AfterViewInit, OnInit} from '@angular/core';
import { CommonModule } from '@angular/common';
import { BoardService } from 'app/core/services/board.services';
import { CountryDTO } from 'app/core/models/board.models/country-dto';
import { FormsModule } from '@angular/forms';
import { interval, Subscription } from 'rxjs';
import {StartGameDTO, GamePlayerDTO} from 'app/core/models/game/startGame';
import {Router, Navigation} from '@angular/router';

import {ActivatedRoute} from '@angular/router';
import { AttackModalComponent } from './attack-modal/attack-modal.component';
import { RegroupModalComponent } from './regroup-modal/regroup-modal.component';
import { DistributeArmiesModalComponent } from './distribute-armies-modal/distribute-armies-modal.component';
import {Assignment} from 'app/core/models/assignments/assignment.model';
import {AttackResultDTO} from 'app/core/models/board.models/attack-result-dto';
import {ConfirmEndturnModalComponent} from 'app/features/board/confirm-endturn-modal/confirm-endturn-modal.component';
import {ContinentDTO} from 'app/core/models/board.models/continent-dto';
import { TurnsService } from 'app/core/services/turns.service';
import { forkJoin } from 'rxjs';
import {attackRequestDTO} from 'app/core/models/game/attackRequestDTO';


interface RawPlayer {
  player_id: number;
  name_player: string;
  turn_order: number;
  player_color: { color_name: string };
  objective_player: { objective: string };
  countries_player: Array<{
    country_id: number;
    country_name: string;
    country_army: number;
  }>;
}

interface RawGameData {
  game_difficulty: string;
  game_id: number;
  game_status: string;
  number_players: number;
  players: RawPlayer[];
}


type SimplePlayer = {
  playerId: number;
  color:    string;
};

type Phase = 'assign' | 'attack' | 'regroup';

@Component({
  standalone: true,
  imports: [CommonModule, FormsModule, AttackModalComponent, RegroupModalComponent, DistributeArmiesModalComponent, ConfirmEndturnModalComponent],
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
  myCountries: CountryDTO[] = [];
  secondsLeft = 90;
  public playersNames: string[] = [];
  public myPlayerName: string = '';

  game!: StartGameDTO;
  gameId: number | null = null;
  playerId: number | null = null;
  objective: string = '';
  attackResult: AttackResultDTO | null = null;
  playersdto: SimplePlayer[] = [];
  refreshSubscription?: Subscription;

  modalDistributeOpen = false;
  armiesLeft = 10; //HAY QUE PONERLE LOS EJERCITOS QUE CORRESPONDEN A LA RONDA

  constructor(
    private boardService: BoardService,
    private turnsService: TurnsService,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  private countdown!: ReturnType<typeof setInterval>;

  ngOnInit(): void {

    this.startAutoRefresh();

    this.gameId   = Number(this.route.snapshot.paramMap.get('gameId'));
    this.playerId = Number(this.route.snapshot.paramMap.get('id'));

    this.refreshGameState();

    this.countdown = setInterval(() => {
      if (this.secondsLeft > 0) {
        this.secondsLeft--;
      } else {
        clearInterval(this.countdown);
      }
    }, 1000);
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
  /**
   * Método auxiliar para obtener el dueño de un país
   */
  private getCountryOwner(countryId: number): RawPlayer | null {
    const rawGame = this.game as any as RawGameData;
    return rawGame.players.find(player =>
      player.countries_player.some(country => country.country_id === countryId)
    ) || null;
  }

  /**
   * Método auxiliar para obtener el color de un país
   */
  public getCountryColor(countryId: number): string {
    const owner = this.getCountryOwner(countryId);
    let color = owner
      ? owner.player_color.color_name.toLowerCase()
      : 'lightgray';

    // Si el color original es “black”, le asigno un gris más claro
    if (color === 'black') {
      color = '#444444';
    }

    if(color === "yellow") {
      color = '#FFFF99';
    }
    return color;
  }

  /**
   * Método auxiliar para obtener información completa del país de un jugador
   */
  private getCountryInfo(countryId: number): { owner: RawPlayer | null, countryData: any | null } {
    const owner = this.getCountryOwner(countryId);
    const countryData = owner?.countries_player.find(c => c.country_id === countryId) || null;
    return { owner, countryData };
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

      // ESPERAR un poco más para asegurar que el SVG esté completamente cargado
      setTimeout(() => {
        this.boardService.getBoard().subscribe((response) => {
          this.countries = response.countries ?? response;
          console.log("✅ Países cargados:", this.countries);
          // AÑADIR otro pequeño delay antes de pintar
          setTimeout(() => {
            this.pintarMapa();
          }, 100);
        });
      }, 200);
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


  /**
   * Pinta cada país según el color del jugador que lo posee
   * Usa la información del StartGameDTO para determinar colores
   */
  /**
   * Pinta cada país según el color del jugador que lo posee
   */
  pintarMapa(): void {
    if (!this.svgDoc || !this.game) {
      console.error('❌ SVG o game no disponibles');
      return;
    }

    console.log('🎨 Iniciando pintado del mapa...');
    const rawGame = this.game as any as RawGameData;
    console.log('🎮 Estructura del juego:', rawGame);

    // VERIFICAR que el SVG tenga elementos antes de proceder
    const allSvgElements = this.svgDoc.querySelectorAll('[id]');
    if (allSvgElements.length === 0) {
      console.error('❌ El SVG no tiene elementos con ID. Reintentando en 500ms...');
      setTimeout(() => this.pintarMapa(), 500);
      return;
    }

    let paisesEncontrados = 0;
    let paisesNoEncontrados = 0;

    this.countries.forEach(country => {
      const baseId = String(country.id);

      // BUSCAR ELEMENTOS DE FORMA MÁS EXHAUSTIVA
      const possibleIds = [
        baseId,
        `${baseId}b`,
        `country_${baseId}`,
        `c${baseId}`,
        `path${baseId}`,
        baseId.padStart(2, '0'),
        `${baseId.padStart(2, '0')}b`
      ];

      let foundElements: Element[] = []; // Cambiar SVGElement[] por Element[]

      possibleIds.forEach(id => {
        const element = this.svgDoc!.getElementById(id);
        if (element) {
          foundElements.push(element);
        }
      });

      if (foundElements.length > 0) {
        paisesEncontrados++;

        const fillColor = this.getCountryColor(country.id);
        const { owner, countryData } = this.getCountryInfo(country.id);

        console.log(`🏳️ País ${country.name} (ID: ${country.id}) - Owner: ${owner ? `Jugador ${owner.player_id}` : 'Sin dueño'} - Color: ${fillColor} - Ejércitos: ${countryData?.country_army || 0}`);

        // APLICAR ESTILOS Y EVENTOS A TODOS LOS ELEMENTOS ENCONTRADOS
        foundElements.forEach(element => {
          // Verificar que el elemento tenga los métodos necesarios
          if (element && typeof element.setAttribute === 'function') {
            element.removeAttribute('style');
            // Pintar con el color del jugador
            // 1) sacamos el style inline que traía el SVG
            element.removeAttribute('style');

            // 2) color de interior según jugador
            element.setAttribute('fill', fillColor);

            // 3) borde: mismo color (o uno distinto si querés)
            element.setAttribute('stroke', fillColor);
            element.setAttribute('stroke-width', '2');

            // Opcionales para redondear esquinas y puntas:
            element.setAttribute('stroke-linejoin', 'round');
            element.setAttribute('stroke-linecap', 'round');

            // Solo aplicar cursor si el elemento tiene style
            if ((element as any).style) {
              (element as any).style.cursor = 'pointer';
            }

            // CLONAR PARA LIMPIAR EVENTOS PREVIOS
            const newEl = element.cloneNode(true) as Element;
            if (element.parentNode) {
              element.parentNode.replaceChild(newEl, element);
            }

            // Agregar eventos de interacción
            newEl.addEventListener('click', (event) => {
              event.preventDefault();
              event.stopPropagation();
              console.log(`🖱️ Click en ${country.name} (${country.id})`);
              this.seleccionarPorId(country.id);
            });

            newEl.addEventListener('mouseenter', () => {
              if (country.id !== this.selectedCountryId) {
                const hoverColor = this.getLighterColor(fillColor);
                newEl.setAttribute('fill', hoverColor);
              }
            });

            newEl.addEventListener('mouseleave', () => {
              if (country.id !== this.selectedCountryId) {
                newEl.setAttribute('fill', fillColor);
              }
            });
          }
        });

      } else {
        paisesNoEncontrados++;
        console.warn(`❌ No se encontró ningún elemento SVG para ${country.name} (ID: ${baseId})`);

        // Debug: mostrar algunos IDs disponibles para este país
        const availableIds = Array.from(allSvgElements)
          .map(el => el.id)
          .filter(id => id.includes(baseId) || baseId.includes(id))
          .slice(0, 5);

        if (availableIds.length > 0) {
          console.log(`🔍 IDs similares disponibles para ${country.name}:`, availableIds);
        }
      }
    });

    console.log(`📊 Resumen: ${paisesEncontrados} países encontrados, ${paisesNoEncontrados} no encontrados`);

    // SI NO SE ENCONTRARON SUFICIENTES PAÍSES, REINTENTAR
    if (paisesNoEncontrados > paisesEncontrados) {
      console.warn('⚠️ Demasiados países no encontrados. Reintentando en 1 segundo...');
      setTimeout(() => this.pintarMapa(), 1000);
      return;
    }

    console.log('✅ Pintado del mapa completado');
  }

  /**
   * Obtiene una versión más clara del color para el efecto hover
   */
  private getLighterColor(color: string): string {
    const colorMap: { [key: string]: string } = {
      'red': '#ff6666',
      'blue': '#6666ff',
      'green': '#66ff66',
      'yellow': '#ffff66',
      'purple': '#ff66ff',
      'orange': '#ffaa66',
      'lightgray': '#e6e6e6'
    };
    return colorMap[color.toLowerCase()] || '#cccccc';
  }


  /**
   * Actualiza la visualización de la selección
   */
  actualizarSeleccion(): void {
    if (!this.svgDoc || !this.game) return;

    const SELECTED_FILL    = '#1E90FF';
    const SELECTED_STROKE  = '#104E8B';
    const NEIGHBOR_FILL    = '#ADD8E6';
    const NEIGHBOR_STROKE  = '#1E90FF';

    this.countries.forEach(country => {
      const idStr = country.id.toString();
      const el = this.svgDoc!.getElementById(idStr);
      if (!el) return;

      // color “por defecto” de este país
      const defaultColor = this.getCountryColor(country.id);

      // 1) seleccionado
      if (country.id === this.selectedCountryId) {
        el.setAttribute('fill', SELECTED_FILL);
        el.setAttribute('stroke', SELECTED_STROKE);
        el.setAttribute('stroke-width', '3');

        // 2) vecinos
      } else if (
        this.selectedCountryId !== null &&
        this.countries
          .find(c => c.id === this.selectedCountryId)
          ?.borderIds?.includes(country.id)
      ) {
        el.setAttribute('fill', NEIGHBOR_FILL);
        el.setAttribute('stroke', NEIGHBOR_STROKE);
        el.setAttribute('stroke-width', '2');

        // 3) todos los demás: vuelta al color del jugador
      } else {
        el.setAttribute('fill', defaultColor);
        el.setAttribute('stroke', 'none');
        el.setAttribute('stroke-width', '0');
      }


      el.setAttribute('stroke-linejoin', 'round');
      el.setAttribute('stroke-linecap', 'round');
    });

    console.log('✅ Selección actualizada');
  }


  /**
   * Selecciona un país por ID
   */
  seleccionarPorId(id: number): void {
    console.log('🖱️ Selección del país con ID:', id);

    // 1) Si clickeás dos veces el mismo país, deselecciono y reseteo
    if (this.selectedCountryId === id) {
      this.selectedCountryId = null;
      this.pintarMapa();    // repinta TODO con colores de jugador
      return;
    }

    // 2) Si es una nueva selección
    this.selectedCountryId = id;
    this.actualizarSeleccion();
  }

  modalAtaqueAbierto = false;
  /** Se disparará al hacer click en "Atacar" */
  attack(): void {
    this.playSound('espada_ataque.wav', 0.5);
    console.log('attack pulsado');
    this.modalAtaqueAbierto = true;
  }

  onAttackConfirm(event: { from: number, to: number, armies: number }) {
    if (this.gameId == null || this.playerId == null) {
      alert('No se pudo obtener el GameID o PlayerID');
      this.modalAtaqueAbierto = false;
      return;
    }

    const dto: attackRequestDTO = {
      gameId: this.gameId,
      playerId: this.playerId,
      fromCountryId: event.from,
      toCountryId: event.to,
      attackingArmies: event.armies
    };

    this.turnsService.postAttack(dto).subscribe({
      next: (result) => {
        this.attackResult = result;
        this.modalAtaqueAbierto = false;

      },
      error: () => {
        alert('Hubo un error al procesar el ataque');
        this.modalAtaqueAbierto = false;
      }
    });
  }

  modalRegroupAbierto = false;
  /** Se disparará al hacer click en "Reagrupar" */
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

  // LOGICA PARA MOVER EJERCITOS
  distributeArmies(): void {
    this.playSound('army_insert.wav', 1);
    this.modalDistributeOpen = true;
  }

  onDistributeConfirm(assignments: Assignment[]) {
    if (!assignments || assignments.length === 0) return;

    const requests = assignments.map(a =>
      this.turnsService.postTurnDistribuir({
        playerId: this.playerId!,
        countryId: a.countryId,
        numArmies: a.armies
      })
    );
    forkJoin(requests).subscribe({
      next: () => {
        const totalAssigned = assignments.reduce((sum, a) => sum + a.armies, 0);
        this.armiesLeft -= totalAssigned;
        this.modalDistributeOpen = false;
        this.refreshGameState();
      },
      error: (e) => {
        alert('Ocurrió un error al asignar ejércitos. Intentalo de nuevo.');
        console.log("POST error:", e);
      }
    });
  }

    modalConfirmEndTurnOpen = false;
  /** Se disparará al hacer click en “Terminar Turno” */
  endTurn(): void {
    console.log('endTurn pulsado');
    this.modalConfirmEndTurnOpen = true;
  }

  onConfirmEndTurn() {
    this.modalConfirmEndTurnOpen = false;
    // Aquí ejecuta la lógica real para terminar turno
    // this.boardService.endTurn(...);
  }
  onCancelEndTurn() {
    this.modalConfirmEndTurnOpen = false;
  }

  /** Solo testeo Borrar luego */
  testAttackResult() {
    this.attackResult = {
      attackerDice: [6, 5, 2],
      defenderDice: [4, 3],
      lostAttackerArmies: 1,
      lostDefenderArmies: 2,
      conquered: true,
      message: '¡Probando el modal! El atacante conquistó el país.'
    };
  }

  //Nombre dueño del pais
  getCountryOwnerName(countryId: number): string {
    const owner = this.getCountryOwner(countryId);
    return owner ? owner.player_color.color_name : 'Sin dueño';
  }

  phaseOrder: Phase[] = ['assign', 'attack', 'regroup'];
  currentPhaseIndex = 0;

  buttonsState = {
    assign: true,
    attack: false,
    regroup: false
  };

  changePhase(): void {
    this.buttonsState.assign = false;
    this.buttonsState.attack = false;
    this.buttonsState.regroup = false;

    this.currentPhaseIndex = (this.currentPhaseIndex + 1) % this.phaseOrder.length;
    const nextPhase = this.phaseOrder[this.currentPhaseIndex];

    this.buttonsState[nextPhase] = true;
    console.log(`✅ Fase actual cambiada a: ${nextPhase}`);

    this.refreshGameState();
  }

  private refreshGameState(): void {
    this.boardService.getFullGameStateAsAny(this.gameId!).subscribe((updatedGame) => {

      this.game = updatedGame;
      this.countries = Array.isArray(updatedGame.countries) ? updatedGame.countries : [];

      const rawGame = this.game as any as RawGameData;

      if (rawGame.players) {
        this.playersdto = rawGame.players.map((p: any) => ({
          playerId: p.player_id,
          color:    p.player_color.color_name.toLowerCase()
        }));
      }

      const me = rawGame.players?.find((p: any) => p.player_id === this.playerId);

      if (me) {
        this.myPlayerName = me.player_color.color_name;
        this.objective = me.objective_player?.objective ?? 'Sin objetivo';
        this.myCountries = me.countries_player.map((cp: any) => ({
          id: cp.country_id,
          name: cp.country_name,
          armies: cp.country_army,
          continent: {} as ContinentDTO,
          borderIds: cp.border_ids ?? [],
          svgId: cp.svg_id ?? ''
        }));
      } else {
        this.myCountries = [];
        this.myPlayerName = '';
        this.objective = 'Sin objetivo';
      }

      // Si necesitás actualizar nombres para mostrar en pantalla
      if (rawGame.players) {
        this.playersNames = rawGame.players.map((player: any) => player.player_color.color_name);
      }

      console.log('✅ Estado actualizado:', updatedGame);
      console.log('🏳️‍myCountries:', this.myCountries);
    });
  }


  startAutoRefresh() {
    // Cada 5000 ms llama a refreshGameState
    this.refreshSubscription = interval(5000).subscribe(() => this.refreshGameState());
  }
}

