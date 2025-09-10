// Detectar el cambio de modo
function void onLoad() {
  var darkModeEnabled = /* lógica para verificar si el modo oscuro está habilitado */;
  if (darkModeEnabled) {
      // Cambiar el tema de Mermaid a oscuro
      mermaid.initialize({ theme: 'dark' });
  } else {
      // Cambiar el tema de Mermaid a claro
      mermaid.initialize({ theme: 'default' });
  }
}

// Escuchar el evento de cambio de modo y llamar a la función
// toggleDarkMode() cuando ocurra el cambio
// Por ejemplo, si estás usando un botón para cambiar entre los modos claro y oscuro
document.getElementById('toggle-dark-mode-button').addEventListener('click', toggleDarkMode);
  
  