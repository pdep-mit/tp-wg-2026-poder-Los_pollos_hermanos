import personajes.*
import wollok.game.*
import movimientos.*
import mochila.*
import panelMochila.*

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
    self.objetosEnElMapa().forEach({ objeto => game.addVisual(objeto) })
    self.ocultarFueraDeSala(0, 0)
    wachington.position(self.posicionInicial())
    game.addVisual(wachington)
    controles.configurar()
    habitacionActual.salaActual(self)
  }

  method configurar() {}

  // Lo que ya se recogio no se vuelve a dibujar al volver a la sala
  method objetosEnElMapa() = self.objetos().filter({ objeto => !mochila.fueRecogido(objeto) })

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
    keyboard.up().onPressDo({ self.siEstaJugando({ movimiento.arriba(wachington) }) })
    keyboard.down().onPressDo({ self.siEstaJugando({ movimiento.abajo(wachington) }) })
    keyboard.left().onPressDo({ self.siEstaJugando({ movimiento.izquierda(wachington) }) })
    keyboard.right().onPressDo({ self.siEstaJugando({ movimiento.derecha(wachington) }) })
    keyboard.e().onPressDo({ self.siEstaJugando({ wachington.interactuar() }) })
    keyboard.b().onPressDo({ panelMochila.alternar() })
    keyboard.num1().onPressDo({ panelMochila.mostrar(pestaniaMision) })
    keyboard.num2().onPressDo({ panelMochila.mostrar(pestaniaObjetos) })
  }

  // Con la mochila abierta Wachington no se mueve ni interactua
  method siEstaJugando(accion) {
    if (!panelMochila.estaAbierto()) accion.apply()
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
