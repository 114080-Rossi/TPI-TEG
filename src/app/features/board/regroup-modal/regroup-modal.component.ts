import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CountryDTO } from 'app/core/models/board.models/country-dto';
import {FormsModule} from '@angular/forms';
import {NgForOf, NgIf} from '@angular/common';


@Component({
  selector: 'app-regroup-modal',
  imports: [
    FormsModule,
    NgForOf,
    NgIf
  ],
  templateUrl: './regroup-modal.component.html',
  styleUrl: './regroup-modal.component.css',
  standalone: true
})
export class RegroupModalComponent {
  @Input() countries: CountryDTO[] = [];
  @Input() open: boolean = false;
  @Output() close = new EventEmitter<void>();
  @Output() confirm = new EventEmitter<{ from: number, to: number, armies: number }>();

  fromCountryId: number | null = null;
  toCountryId: number | null = null;
  armies: number = 1;

  get fromCountry(): CountryDTO | undefined {
    return this.countries.find(c => c.id === this.fromCountryId!);
  }

  get toCountry(): CountryDTO | undefined {
    return this.countries.find(c => c.id === this.toCountryId!);
  }

  get toCountryOptions(): CountryDTO[] {
    const origen = this.fromCountry;
    if (!origen) return [];
    // Solo países tuyos y vecinos del origen (puedes ajustar según lógica de tu juego)
    // Por ahora muestro todos los vecinos
    return this.countries.filter(c =>
        origen.borderIds.includes(c.id)
      // && c.ownerId === this.playerId // Si luego tienes dueño de país
    );
  }

  get armiesMax(): number {
    return this.fromCountry ? Math.max(1, this.fromCountry.armies - 1) : 1;
  }

  get armiesFinalOrigen(): number {
    return this.fromCountry ? this.fromCountry.armies - this.armies : 0;
  }

  get armiesFinalDestino(): number {
    return this.toCountry ? this.toCountry.armies + this.armies : 0;
  }

  onConfirm() {
    if (this.fromCountryId && this.toCountryId && this.armies > 0) {
      this.confirm.emit({
        from: this.fromCountryId,
        to: this.toCountryId,
        armies: this.armies
      });
      this.reset();
    }
    this.close.emit();
  }
  onClose() {
    this.reset();
    this.close.emit();
  }
  private reset() {
    this.fromCountryId = null;
    this.toCountryId = null;
    this.armies = 1;
  }
}
