const developmentUrl = 'http://localhost:8081';

const productionUrl = 'https://601b-2803-9800-9897-91b5-d08e-2075-fbcd-41e1.ngrok-free.app';

const production = true;

export const backUrl = production ? productionUrl : developmentUrl;

// Si production es false, backUrl será developmentUrl
// Si production es true, backUrl será productionUrl
