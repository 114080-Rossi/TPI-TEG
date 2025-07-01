// URLs para uso directo (si no usás Netlify o el proxy)

const developmentUrl = 'http://localhost:8081';
const productionUrl = 'https://7fc1-190-114-208-144.ngrok-free.app';  // actualizable si cambia`

// Si production es false, backUrl será developmentUrl`
// Si production es true, backUrl será productionUrl`

const production = true;
export const backUrl = production ? productionUrl : developmentUrl;
//export const *backUrl* = production ? '/api' : developmentUrl;

// Si production es false, backUrl será developmentUrl
// Si production es true, backUrl será productionUrl

