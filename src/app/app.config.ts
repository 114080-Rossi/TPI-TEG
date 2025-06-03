import { provideRouter } from '@angular/router';
import { provideHttpClient } from '@angular/common/http';
import { routes } from './routes/app.routes';

export const appConfig = {
  providers: [
    provideRouter(routes),
    provideHttpClient()
  ]
};


