import { Routes } from '@angular/router';
import { LoginComponent } from 'src/app/features/login/login.component';
import { HomeComponent }  from 'src/app/features/home/home.components';
import { BoardComponent } from 'src/app/features/board/boardComponent';

export const routes: Routes = [
  { path: '',               component: LoginComponent },
  { path: 'home/:playerId', component: HomeComponent },
  { path: 'board/:gameId/:playerId', component: BoardComponent },
  // opcional: { path: '**', redirectTo: '' }
];
