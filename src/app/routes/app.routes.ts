import { Routes } from '@angular/router';
import { LoginComponent } from 'src/app/features/login/login.component';
import {BoardComponent} from 'app/features/board/boardComponent';

export const routes: Routes = [
  { path: '', component: LoginComponent },
  { path: 'board', component: BoardComponent }

];
