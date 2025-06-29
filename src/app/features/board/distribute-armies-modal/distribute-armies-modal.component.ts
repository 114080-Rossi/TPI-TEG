import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CountryDTO } from 'app/core/models/board.models/country-dto';
import {NgForOf, NgIf, NgOptimizedImage} from '@angular/common';
import {FormsModule} from '@angular/forms';
import {Assignment} from 'app/core/models/assignments/assignment.model';

@Component({
  selector: 'app-distribute-armies-modal',
  imports: [
    NgIf,
    FormsModule,
    NgForOf,
    NgOptimizedImage
  ],
  templateUrl: './distribute-armies-modal.component.html',
  styleUrl: './distribute-armies-modal.component.css'
})
export class DistributeArmiesModalComponent {
  @Input() open: boolean = false;
  @Input() playerId: number | null = null;
  @Input() countries: CountryDTO[] = [];
  @Input() totalArmies: number = 0; // ¿Cuántos debe repartir el jugador?
  @Output() close = new EventEmitter<void>();
  @Output() confirm = new EventEmitter<Assignment[]>(); // Devuelve la lista final

  selectedCountryId: number | null = null;
  assignedArmies: number = 1;

  // Acumulado de asignaciones
  assignments: Assignment[] = [];

  get armiesLeft(): number {
    const used = this.assignments.reduce((sum, a) => sum + a.armies, 0);
    return this.totalArmies - used;
  }

  get myAvailableCountries(): CountryDTO[] {
    return this.countries;
  }

  assign() {
    if (!this.selectedCountryId || this.assignedArmies < 1 || this.assignedArmies > this.armiesLeft) return;
    const country = this.countries.find(c => c.id === this.selectedCountryId);
    if (!country) return;

    // Suma a lo ya asignado si el país ya tiene asignaciones
    const existing = this.assignments.find(a => a.countryId === country.id);
    if (existing) {
      existing.armies += this.assignedArmies;
    } else {
      this.assignments.push({
        countryId: country.id,
        countryName: country.name,
        armies: this.assignedArmies
      });
    }
    // Limpiar campos
    this.selectedCountryId = null;
    this.assignedArmies = 1;
  }

  removeAssignment(index: number) {
    this.assignments.splice(index, 1);
  }

  onConfirm() {
    if (this.armiesLeft === 0) {
      this.confirm.emit(this.assignments);
      this.reset();
      this.close.emit();
    }
  }

  onClose() {
    this.reset();
    this.close.emit();
  }

  reset() {
    this.selectedCountryId = null;
    this.assignedArmies = 1;
    this.assignments = [];
  }
}
