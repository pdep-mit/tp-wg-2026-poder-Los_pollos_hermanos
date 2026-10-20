import wollok.game.*
import objetosUtiles.*
import objetosDecorados.*
import objetosParedes.*
import personajes.*
import habitaciones.*
import pasillo.*

//ACCESOS UTILES
object ascensor {
  var property position = game.at(4, 9)
  method image() = "x64sprites/mapa/ascensor.png"
  method esSolido() = true
  method esInteractuable() = true

  method interactuar() {
    habitacionActual.irA(salaPasillo, game.at(14, 0))
  }
}


//ACCESOS INUTILES
object puertaBaño {
  var property position = game.at(2, 9)
  method image() = "x64sprites/mapa/puerta-banio.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object puertaAMMedio {
  var property position = game.at(7, 9)
  method image() = "x64sprites/mapa/puerta-am-medio.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object puertaAMIzq {
  var property position = game.at(6, 9)
  method image() = "x64sprites/mapa/puerta-am-izq.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object puertaAMDer {
  var property position = game.at(8, 9)
  method image() = "x64sprites/mapa/puerta-am-der.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object puertaSalidaMedio {
  var property position = game.at(7, 0)
  method image() = "x64sprites/mapa/puerta-salida-medio.png"
  method esSolido() = false
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object puertaSalidaIzq {
  var property position = game.at(6, 0)
  method image() = "x64sprites/mapa/puerta-salida-izq.png"
  method esSolido() = false
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object puertaSalidaDer {
  var property position = game.at(8, 0)
  method image() = "x64sprites/mapa/puerta-salida-der.png"
  method esSolido() = false
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object escalerasIzq {
  var property position = game.at(11, 9)
  method image() = "x64sprites/mapa/escaleras-izq.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object escalerasDer {
  var property position = game.at(12, 9)
  method image() = "x64sprites/mapa/escaleras-der.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}

object salaEntrada inherits Sala {
  override method fondo() = "x64sprites/mapa/baldosa.png"
  override method posicionInicial() = game.at(7, 0)
  override method ancho() = 15
  override method alto() = 10
  override method objetos() = [
    new ParedFrente(position = game.at(1, 9)),
    new ParedFrente(position = game.at(2, 9)),
    new ParedFrente(position = game.at(3, 9)),
    new ParedFrente(position = game.at(4, 9)),
    new ParedFrente(position = game.at(5, 9)),
    new ParedFrente(position = game.at(6, 9)),
    new ParedFrente(position = game.at(7, 9)),
    new ParedFrente(position = game.at(8, 9)),
    new ParedFrente(position = game.at(9, 9)),
    new ParedFrente(position = game.at(10, 9)),
    new ParedFrente(position = game.at(13, 9)),
    new ParedFrente(position = game.at(14, 9)),
    new ParedIzq(position = game.at(0, 0)),
    new ParedIzq(position = game.at(0, 1)),
    new ParedIzq(position = game.at(0, 2)),
    new ParedIzq(position = game.at(0, 3)),
    new ParedIzq(position = game.at(0, 4)),
    new ParedIzq(position = game.at(0, 5)),
    new ParedIzq(position = game.at(0, 6)),
    new ParedIzq(position = game.at(0, 7)),
    new ParedIzq(position = game.at(0, 8)),
    new ParedIzq(position = game.at(0, 9)),
    new ParedDer(position = game.at(14, 0)),
    new ParedDer(position = game.at(14, 1)),
    new ParedDer(position = game.at(14, 2)),
    new ParedDer(position = game.at(14, 3)),
    new ParedDer(position = game.at(14, 4)),
    new ParedDer(position = game.at(14, 5)),
    new ParedDer(position = game.at(14, 6)),
    new ParedDer(position = game.at(14, 7)),
    new ParedDer(position = game.at(14, 8)),
    new ParedDer(position = game.at(14, 9)),
    portero,
    tecnico,
    ascensor,
    puertaAMMedio,
    puertaAMIzq,
    puertaAMDer,
    puertaBaño,
    puertaSalidaMedio,
    puertaSalidaIzq,
    puertaSalidaDer,
    escalerasIzq,
    escalerasDer,
    suciedadPapeles1,
    suciedadPapeles2,
    suciedadPapeles3,
    suciedadPapeles4,
    suciedadPapeles5,
    tachoBasura,
    new MesaVerticalPapeles(position = game.at(2, 3)),
    new MesaArribaVertical(position = game.at(2, 4)),
    new MesaAbajoVertical(position = game.at(2, 2)),
    new CartelUTNIzq(position = game.at(10, 4)),
    new CartelUTNDer(position = game.at(11, 4))
  ]

  override method configurar() {
    game.title("Entrada")
  }
}