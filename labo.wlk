import wollok.game.*
import objetosUtiles.*
import objetosDecorados.*
import objetosParedes.*
import personajes.*
import habitaciones.*

object puertaPasilloDesdeLabo {
  var property position = game.at(4, 0)
  method image() = "x64sprites/mapa/puerta-salida.png"
  method esSolido() = false
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}

object salaLabo inherits Sala {
  override method fondo() = "x64sprites/mapa/baldosa.png"
  override method posicionInicial() = game.at(3, 3)
  override method ancho() = 9
  override method alto() = 9
  override method objetos() = [
    new ParedFrente(position = game.at(1, 8)),
    new ParedFrente(position = game.at(2, 8)),
    new ParedPizarraIzq(position = game.at(3, 8)),
    new ParedPizarraMedioEscrito(position = game.at(4, 8)),
    new ParedPizarraDer(position = game.at(5, 8)),
    new ParedFrente(position = game.at(6, 8)),
    new ParedFrente(position = game.at(7, 8)),
    new ParedIzq(position = game.at(0, 0)),
    new ParedIzq(position = game.at(0, 1)),
    new ParedIzq(position = game.at(0, 2)),
    new ParedIzq(position = game.at(0, 3)),
    new ParedIzq(position = game.at(0, 4)),
    new ParedIzq(position = game.at(0, 5)),
    new ParedIzq(position = game.at(0, 6)),
    new ParedIzq(position = game.at(0, 7)),
    new ParedIzq(position = game.at(0, 8)),
    new ParedDer(position = game.at(8, 0)),
    new ParedDer(position = game.at(8, 1)),
    new ParedDer(position = game.at(8, 2)),
    new ParedDer(position = game.at(8, 3)),
    new ParedDer(position = game.at(8, 4)),
    new ParedDer(position = game.at(8, 5)),
    new ParedDer(position = game.at(8, 6)),
    new ParedDer(position = game.at(8, 7)),
    new ParedDer(position = game.at(8, 8)),
    puertaPasilloDesdeLabo,
    rasta,
    mati,
    computadoraLabo,
    new ComputadoraLaboIzq(position = game.at(1, 2)),
    new ComputadoraLaboIzq(position = game.at(1, 4)),
    new ComputadoraLaboDer(position = game.at(7, 2)),
    new ComputadoraLaboDer(position = game.at(7, 4)),
    new ComputadoraLaboTop(position = game.at(2, 8)),
    new ComputadoraLabo(position = game.at(6, 7)),
    new ComputadoraLaboTop(position = game.at(6, 8)),
    new Silla(position = game.at(6, 7)),
    new SillaIzq(position = game.at(2, 2)),
    new SillaIzq(position = game.at(2, 4)),
    new SillaDer(position = game.at(6, 2)),
    new SillaDer(position = game.at(6, 4)),
    new SillaDer(position = game.at(1, 6))
  ]

  override method configurar() {
    game.title("Labo")
  }
}