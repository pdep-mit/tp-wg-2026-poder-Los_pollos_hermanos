import personajes.*
import wollok.game.*
import movimientos.*
import salas.entrada.*
class Sala {
    method fondo()
    method objetos()
    method posicionInicial() 


method cargar() {
    game.ground(self.fondo())
    self.objetos().forEach({ objeto => game.addVisual(objeto) })
    alumno.position(self.posicionInicial())
    game.addVisual(alumno)
    controles.configurar()
  }
}

object controles {
  method configurar() {
    keyboard.up().onPressDo({ movimiento.arriba(alumno) })
  	keyboard.down().onPressDo({ movimiento.abajo(alumno) })
  	keyboard.left().onPressDo({ movimiento.izquierda(alumno) })
 	  keyboard.right().onPressDo({ movimiento.derecha(alumno) })
	  keyboard.e().onPressDo({ alumno.interactuar() })
    //keyboard.b().onPressDo({ mochila.abrir() })
  }
}

object habitacionActual {
    var property salaActual = entrada
    method irA(sala) {
        game.clear()
        salaActual = sala
        sala.cargar()
    }
}

class Puerta {
  const property position
  const destino  

  method image() = "bananita.png"

  method interactuar() {
    habitacionActual.irA(destino)
  }
}

object labo inherits Sala {

  override method fondo() = "x64sprites/mapa/baldosa.png"
  override method posicionInicial() = game.at(1, 1)
  override method objetos() = [new Puerta(position = game.at(8, 4), destino = entrada)]
}



