import wollok.game.*
import objetosUtiles.*
import objetosDecorados.*
import objetosParedes.*
import personajes.*
import habitaciones.*
import aula.*
import labo.*
import pasilloBedelia.*

//ACCESOS UTILES
object puertaAulaDesdePasillo {
  var property position = game.at(0, 2)
  method image() = "x64sprites/mapa/puerta-izq.png"
  method esSolido() = true
  method esInteractuable() = true

  method interactuar() {
    habitacionActual.irA(salaAula, game.at(7, 5))
  }
}
object puertaLaboDesdePasillo {
  var property position = game.at(12, 5)
  method image() = "x64sprites/mapa/puerta-medio.png"
  method esSolido() = true
  method esInteractuable() = true

  method interactuar() {
    habitacionActual.irA(salaLabo, game.at(4, 1))
  }
}
object puertaBedelia1DesdePasillo {
  var property position = game.at(17,2)
  method image() = "x64sprites/mapa/puerta-der.png"
  method esSolido() = true
  method esInteractuable() = true

  method interactuar() {
    habitacionActual.irA(salaPasilloBedelia, game.at(1, 5))
  }
}
object puertaBedelia2DesdePasillo {
  var property position = game.at(17,3)
  method image() = "x64sprites/mapa/puerta-der.png"
  method esSolido() = true
  method esInteractuable() = true

  method interactuar() {
    habitacionActual.irA(salaPasilloBedelia, game.at(1, 5))
  }
}



//ACCESOS INUTILES
object escalerasDesdePasillo1 {
  var property position = game.at(3, 0)
  method image() = "x64sprites/mapa/puerta-salida-izq.png"
  method esSolido() = false
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object escalerasDesdePasillo2 {
  var property position = game.at(4, 0)
  method image() = "x64sprites/mapa/puerta-salida-der.png"
  method esSolido() = false
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}

object salaPasillo inherits Sala {
  override method fondo() = "x64sprites/mapa/baldosa.png"
  override method posicionInicial() = game.at(13, 0)
  override method ancho() = 18
  override method alto() = 6
  override method objetos() = [
    new ParedFrente(position = game.at(1, 5)),
    new ParedFrente(position = game.at(2, 5)),
    new ParedFrente(position = game.at(3, 5)),
    new ParedFrente(position = game.at(4, 5)),
    new ParedFrente(position = game.at(5, 5)),
    new ParedFrente(position = game.at(6, 5)),
    new ParedCarteleraIzq(position = game.at(7, 5)),
    new ParedCarteleraLlena(position = game.at(8, 5)),
    new ParedCarteleraDer(position = game.at(9, 5)),
    new ParedFrente(position = game.at(10, 5)),
    new ParedFrente(position = game.at(11, 5)),
    new ParedFrente(position = game.at(13, 5)),
    new ParedFrente(position = game.at(14, 5)),
    new ParedFrente(position = game.at(15, 5)),
    new ParedFrente(position = game.at(16, 5)),
    new ParedIzq(position = game.at(0, 0)),
    new ParedIzq(position = game.at(0, 1)),
    new ParedIzq(position = game.at(0, 3)),
    new ParedIzq(position = game.at(0, 4)),
    new ParedIzq(position = game.at(0, 5)),
    new ParedDer(position = game.at(17, 0)),
    new ParedDer(position = game.at(17, 1)),
    new ParedDer(position = game.at(17, 4)),
    new ParedDer(position = game.at(17, 5)),
    puertaAulaDesdePasillo,
    puertaLaboDesdePasillo,
    puertaBedelia1DesdePasillo,
    puertaBedelia2DesdePasillo,
    escalerasDesdePasillo1,
    escalerasDesdePasillo2,
    new CartelAgua(position = game.at(7, 1)),
    new Aguita(position = game.at(6, 1)),
    new Aguita(position = game.at(8, 1)),
    new Aguita(position = game.at(4, 4)),
    new TaraguiPared(position = game.at(4, 5)),
    taraguiPiso,
    hanz,
    conserje
  ]

  override method configurar() {
    game.title("Pasillo")
  }
}
