import wollok.game.*
import objetosUtiles.*
import objetosDecorados.*
import objetosParedes.*
import personajes.*

object puertaPasillo1DesdeBedelia {
  var property position = game.at(0,5)
  method image() = "x64sprites/mapa/puerta-izq.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object puertaPasillo2DesdeBedelia {
  var property position = game.at(0,6)
  method image() = "x64sprites/mapa/puerta-izq.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object puertaBuffetDesdeBedelia1 {
  var property position = game.at(3,0)
  method image() = "x64sprites/mapa/puerta-salida-izq.png"
  method esSolido() = false
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object puertaBuffetDesdeBedelia2 {
  var property position = game.at(4,0)
  method image() = "x64sprites/mapa/puerta-salida-der.png"
  method esSolido() = false
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}