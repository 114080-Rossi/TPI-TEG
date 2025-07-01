const developmentUrl = 'http://localhost:8081';

const productionUrl = 'https://4068-2803-9800-9897-91b5-44f9-3da9-7530-df6d.ngrok-free.app';

const production = true;

export const backUrl = production ? productionUrl : developmentUrl;

// Si production es false, backUrl será developmentUrl
// Si production es true, backUrl será productionUrl
