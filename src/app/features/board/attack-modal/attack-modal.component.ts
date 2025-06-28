import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CountryDTO } from 'app/core/models/board.models/country-dto';
import {FormsModule} from '@angular/forms';
import {NgForOf, NgIf} from '@angular/common';


@Component({
  selector: 'app-attack-modal',
  imports: [FormsModule, NgIf, NgForOf],
  templateUrl: './attack-modal.component.html',
  styleUrl: './attack-modal.component.css',
  standalone: true
})
export class AttackModalComponent {
  @Input() countries: CountryDTO[] = [];
  @Input() open: boolean = false;
  @Output() close = new EventEmitter<void>();
  @Output() confirm = new EventEmitter<{ from: number, to: number, armies: number }>();

  fromCountryId: number | null = null;
  toCountryId: number | null = null;
  armies: number = 1;

  get attackableCountries(): CountryDTO[] {
    const selected = this.countries.find(c => c.id === this.fromCountryId);
    if (!selected) return [];
    // Solo países vecinos (no filtra por dueño porque tu modelo no lo tiene)
    return this.countries.filter(c => selected.borderIds.includes(c.id));
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
