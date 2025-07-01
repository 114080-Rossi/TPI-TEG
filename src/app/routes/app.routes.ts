import { Routes } from '@angular/router';
import { LoginComponent } from 'src/app/features/login/login.component';
import { RegisterComponent } from '../features/register/register.component';
import { HomeComponent } from '../features/home/home.components';
import { BoardComponent } from '../features/board/boardComponent';
import {WaitingRoomComponent} from 'app/features/waiting-room/waiting-room.component';
import {WelcomeComponent} from 'app/features/welcome/welcome.component';

export const routes: Routes = [
  { path: '', component: WelcomeComponent },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'home/:id', component: HomeComponent },
  { path: 'board/:gameId/:id', component: BoardComponent },
  { path: 'waiting-room/:gameId/:id', component: WaitingRoomComponent },
];
