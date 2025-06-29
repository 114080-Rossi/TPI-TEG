// Modo de entorno: true = producción, false = desarrollo local
const production = true;

// URLs para uso directo (si no usás Netlify o el proxy)
const developmentUrl = 'http://localhost:8081';
const productionUrl = 'https://2afc-2803-9800-9897-91b5-d08e-2075-fbcd-41e1.ngrok-free.app'; // actualizable si cambia

// backUrl será la URL base de la API
// Si usás Netlify con proxy, usá '/api'
// Si querés conectar directamente (sin proxy), usá productionUrl
export const backUrl = production ? '/api' : developmentUrl;

// Opción alternativa para uso sin proxy:
// export const backUrl = production ? productionUrl : developmentUrl;

// Si production es false, backUrl será developmentUrl
// Si production es true, backUrl será productionUrl
