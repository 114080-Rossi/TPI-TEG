import { Routes } from '@angular/router';
import { LoginComponent } from 'src/app/features/login/login.component';

import {BoardComponent} from 'app/features/board/boardComponent';
import {WaitingRoomComponent} from 'app/features/waiting-room/waiting-room.component';
import {HomeComponent} from 'app/features/home/home.components';
import {RegisterComponent} from 'app/features/register/register.component';

export const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'home/:id', component: HomeComponent },
  { path: 'board/:gameId/:id', component: BoardComponent },
  { path: 'waiting-room/:gameId/:id', component: WaitingRoomComponent },
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  { path: '**', redirectTo: 'login' }

];
