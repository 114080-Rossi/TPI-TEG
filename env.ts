const developmentUrl = 'http://localhost:8081';

const productionUrl = 'https://measured-mammoth-driven.ngrok-free.app';

const production = true;

export const backUrl = production ? productionUrl : developmentUrl;
