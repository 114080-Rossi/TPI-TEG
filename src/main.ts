import { routes } from 'app/routes/app.routes';
import {bootstrapApplication} from '@angular/platform-browser';
import {AppComponent} from 'app/app.component';
import {provideRouter} from '@angular/router';
import {provideHttpClient} from '@angular/common/http'; // asegurate que el path sea correcto

bootstrapApplication(AppComponent, {
  providers: [
    provideRouter(routes),
    provideHttpClient()
  ]
});
