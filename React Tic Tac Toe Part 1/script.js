import React, { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';

let App = function Square() {
  return <button className="square">X</button>;
}


const root = createRoot(document.getElementById('root'));
root.render(
  <StrictMode>
    <App />
  </StrictMode>
);
