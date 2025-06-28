// src/main.ts
import { bootstrapApplication } from '@angular/platform-browser';
import { provideRouter, Routes } from '@angular/router';
import { provideHttpClient }       from '@angular/common/http';

import { AppComponent }    from './app/app.component';
import { LoginComponent }  from 'app/features/login/login.component';
import { RegisterComponent } from 'app/features/register/register.component';
import { HomeComponent }   from 'app/features/home/home.components';
import { BoardComponent }  from 'app/features/board/boardComponent';

const routes: Routes = [
  { path: '',               redirectTo: 'login', pathMatch: 'full' },
  { path: 'login',          component: LoginComponent },
  { path: 'register',       component: RegisterComponent },
  { path: 'home/:playerId', component: HomeComponent },
  { path: 'board/:gameId/:playerId', component: BoardComponent },
  { path: '**',             redirectTo: 'login' }
];

bootstrapApplication(AppComponent, {
  providers: [
    provideRouter(routes),
    provideHttpClient()
  ]
});
