import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CountryDTO } from 'app/core/models/board.models/country-dto';
import { FormsModule } from '@angular/forms';
import { NgForOf, NgIf, NgOptimizedImage } from '@angular/common';

@Component({
  selector: 'app-attack-modal',
  imports: [FormsModule, NgIf, NgForOf, NgOptimizedImage],
  templateUrl: './attack-modal.component.html',
  styleUrl: './attack-modal.component.css',
  standalone: true
})
export class AttackModalComponent {
  // Usamos un setter para blindar el input y asegurar que siempre es un array
  private _countries: CountryDTO[] = [];
  @Input()
  set countries(value: CountryDTO[] | undefined | null) {
    this._countries = Array.isArray(value) ? value : [];
  }
  get countries(): CountryDTO[] {
    return this._countries;
  }

  @Input() open: boolean = false;
  @Output() close = new EventEmitter<void>();
  @Output() confirm = new EventEmitter<{ from: number, to: number, armies: number }>();

  fromCountryId: number | null = null;
  toCountryId: number | null = null;
  armies: number = 1;

  get attackableCountries(): CountryDTO[] {
    // Protegemos el array de países y la búsqueda
    if (!Array.isArray(this.countries) || this.countries.length === 0) return [];
    const selected = this.countries.find(c => c.id === this.fromCountryId);
    if (!selected || !Array.isArray(selected.borderIds)) return [];
    return this.countries.filter(c => selected.borderIds!.includes(c.id));
  }

  get maxDice(): number {
    const from = this.countries.find(c => c.id === this.fromCountryId);
    if (!from || !from.armies || from.armies <= 1) return 1;
    return Math.min(3, from.armies - 1);
  }

  isValidAttack(): boolean {
    return !!this.fromCountryId &&
      !!this.toCountryId &&
      this.armies >= 1 &&
      this.armies <= this.maxDice;
  }

  onConfirm() {
    if (!this.isValidAttack()) {
      alert(`La cantidad de dados debe ser entre 1 y ${this.maxDice}.`);
      return;
    }
    this.confirm.emit({
      from: this.fromCountryId!,
      to: this.toCountryId!,
      armies: this.armies
    });
    this.reset();
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
