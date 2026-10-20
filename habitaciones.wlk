import personajes.*
import wollok.game.*
import movimientos.*

class Sala {
    method fondo()
    method objetos()
    method posicionInicial() 
    method ancho()
    method alto()


  method cargar() {
    self.configurar()
    tablero.configurar(self.ancho(), self.alto())
    game.ground(self.fondo())
    self.objetos().forEach({ objeto => game.addVisual(objeto) })
    self.ocultarFueraDeSala(0, 0)
    wachington.position(self.posicionInicial())
    game.addVisual(wachington)
    controles.configurar()
    habitacionActual.salaActual(self)
  }

  method configurar() {}

  method ocultarFueraDeSala(x, y) {
    if (y < game.height()) {
      if (x < game.width()) {
        if (x >= self.ancho() || y >= self.alto()) {
          game.addVisual(new MascaraFueraDeSala(position = game.at(x, y)))
        }
        self.ocultarFueraDeSala(x + 1, y)
      } else {
        self.ocultarFueraDeSala(0, y + 1)
      }
    }
  }
}

class MascaraFueraDeSala {
  const property position
  method image() = "x64sprites/mapa/afuera-de-sala.png"
  method esSolido() = false
  method esInteractuable() = false
}

object controles {
  method configurar() {
    keyboard.up().onPressDo({ movimiento.arriba(wachington) })
  	keyboard.down().onPressDo({ movimiento.abajo(wachington) })
  	keyboard.left().onPressDo({ movimiento.izquierda(wachington) })
 	  keyboard.right().onPressDo({ movimiento.derecha(wachington) })
	  keyboard.e().onPressDo({ wachington.interactuar() })
    //keyboard.b().onPressDo({ mochila.abrir() })
  }
}

object habitacionActual {
    var property salaActual = null
    method irA(sala, posicionLlegada) {
        game.clear()
        sala.cargar()
        wachington.position(posicionLlegada)
    }
}
