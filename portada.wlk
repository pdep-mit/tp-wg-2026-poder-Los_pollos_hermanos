import wollok.game.*
import entrada.*
import habitaciones.*

object imagenPortada {
  var property position = game.at(4, 0)
  method image() = "x64sprites/mapa/portada.gif" // Asegurate de que esté en la carpeta assets
  method interactuar() {}
}

object pantallaInicio {
  method iniciar() {
    game.title("Grupo: Los Pollos Hermanos | Aprobame, Rasta")
    game.cellSize(64)
    game.width(18)
    game.height(10)
    
    // Mostramos la portada
    game.addVisual(imagenPortada)
    
    // AL HACER CLICK CON EL MOUSE 🖱️
    game.onClickDo({ pos => self.comenzar() })
    
    // O AL APRETAR ENTER ⌨️
    keyboard.enter().onPressDo({ self.comenzar() })
    
    game.start()
  }

  method comenzar() {
    game.clear()          // Limpia la imagen de portada y los clicks
    salaEntrada.cargar()  // CARGA LA ENTRADA CON TODA SU HISTORIA INTACTA
  }
}