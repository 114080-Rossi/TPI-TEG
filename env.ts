const developmentUrl = 'http://localhost:8081';

const productionUrl = 'https://measured-mammoth-driven.ngrok-free.app';

const production = false;

export const backUrl = production ? productionUrl : developmentUrl;

// Si production es false, backUrl será 'http://localhost:8081'.
// Si production es true, backUrl será 'https://measured-mammoth-driven.ngrok-free.app'
