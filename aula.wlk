import wollok.game.*
import objetosUtiles.*
import objetosDecorados.*
import objetosParedes.*
import personajes.*

object puertaPasilloDesdeAula {
  var property position = game.at(8, 5)
  method image() = "x64sprites/mapa/puerta-der.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}