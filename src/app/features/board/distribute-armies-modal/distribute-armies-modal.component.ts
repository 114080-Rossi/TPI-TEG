import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CountryDTO } from 'app/core/models/board.models/country-dto';
import { Assignment } from 'app/core/models/assignments/assignment.model';
import {FormsModule} from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-distribute-armies-modal',
  templateUrl: './distribute-armies-modal.component.html',
  styleUrls: ['./distribute-armies-modal.component.css'],
  imports: [
    CommonModule,
    FormsModule
  ],
  standalone: true
})

export class DistributeArmiesModalComponent {
  @Input() open: boolean = false;
  @Input() countries: CountryDTO[] = [];
  @Input() armiesLeft: number = 0;

  @Output() close = new EventEmitter<void>();
  @Output() confirm = new EventEmitter<Assignment[]>();

  selectedCountryId: number | null = null;
  assignedArmies: number = 1;
  assignments: Assignment[] = [];

  ngOnChanges() {
    if (this.open) {
      this.selectedCountryId = null;
      this.assignedArmies = 1;
      this.assignments = [];
    }
  }

  assign() {
    if (!this.selectedCountryId || this.assignedArmies < 1 || this.assignedArmies > this.armiesLeft) return;
    const country = this.countries.find(c => c.id === this.selectedCountryId);
    if (!country) return;

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
    this.selectedCountryId = null;
    this.assignedArmies = 1;
  }

  removeAssignment(index: number) {
    this.assignments.splice(index, 1);
  }

  onConfirm() {
    const totalAssigned = this.assignments.reduce((sum, a) => sum + a.armies, 0);
    if (totalAssigned === 0) return;
    this.confirm.emit(this.assignments);
    this.close.emit();
  }

  onClose() {
    this.close.emit();
  }
}
