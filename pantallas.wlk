import wollok.game.*
import entrada.*
import habitaciones.*
import musica.*

//dsp hacer clase imagen? 
object imagenPortada {
  var property position = game.at(0, 0)
  method image() = "pantallas/aprobame-rasta-carga.gif"
  method interactuar() {}
}

object imagenContexto {
  var property position = game.at(0, 0)
  method image() = "pantallas/aprobame-rasta-contexto.png"
  method interactuar() {}
}

object imagenFinal {
  var property position = game.at(0, 0)
  method image() = "pantallas/aprobame-rasta-final.png"
  method interactuar() {}
}

// PANTALLAS
object pantallaInicio {
  method iniciar() {
    game.title("Grupo: Los Pollos Hermanos | Aprobame, Rasta")
    game.cellSize(64)
    game.width(18)
    game.height(10)
    // El piso hay que definirlo ANTES de game.start(): despues ya no se actualiza
    game.ground("x64sprites/mapa/baldosa.png")

    // Mostramos la portada
    game.addVisual(imagenPortada)
    
    // AL HACER CLICK CON EL MOUSE
    game.onClickDo({ pos => self.comenzar() })
    
    // O AL APRETAR ENTER
    keyboard.enter().onPressDo({ self.comenzar() })
    
    game.start()
  }

  method comenzar() {
    game.clear()          // Limpia la imagen de portada y los clicks
    musica.iniciar()
    pantallaContexto.mostrar()
  }
}

object pantallaContexto {
  method mostrar() {
    game.addVisual(imagenContexto)
    game.onClickDo({ pos => self.comenzar() })
    keyboard.enter().onPressDo({ self.comenzar() })
  }

  method comenzar() {
    game.clear()
    salaEntrada.cargar() // CARGA LA ENTRADA CON TODA SU HISTORIA INTACTA
  }
}

object pantallaFinal {
  method mostrar() {
    game.clear()
    musica.pausar()
    game.addVisual(imagenFinal)
  }
}