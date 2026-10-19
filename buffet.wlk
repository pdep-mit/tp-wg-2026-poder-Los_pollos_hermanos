import wollok.game.*
import objetosUtiles.*
import objetosDecorados.*
import objetosParedes.*
import personajes.*

object puertaBedeliaDesdeBuffet1 {
  var property position = game.at(7,7)
  method image() = "x64sprites/mapa/puerta-am-izq.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object puertaBedeliaDesdeBuffet2 {
  var property position = game.at(8,7)
  method image() = "x64sprites/mapa/puerta-am-der.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}