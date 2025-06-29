// URLs para uso directo (si no usás Netlify o el proxy)

const developmentUrl = 'http://localhost:8081';
const productionUrl =  'https://79c9-2803-9800-9897-91b5-c814-db61-a259-114a.ngrok-free.app';  // actualizable si cambia`


// Si production es false, backUrl será developmentUrl`
// Si production es true, backUrl será productionUrl`
const production = false;


export const backUrl = production ? productionUrl : developmentUrl;
//Urlexport const *backUrl* = production ? '/api' : developmentUrl;
