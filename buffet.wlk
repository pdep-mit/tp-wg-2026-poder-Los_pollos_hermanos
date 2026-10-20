import wollok.game.*
import objetosUtiles.*
import objetosDecorados.*
import objetosParedes.*
import personajes.*
import habitaciones.*
import pasilloBedelia.*

object puertaBedeliaDesdeBuffet1 {
  var property position = game.at(7,7)
  method image() = "x64sprites/mapa/puerta-am-izq.png"
  method esSolido() = true
  method esInteractuable() = true

  method interactuar() {
    habitacionActual.irA(salaPasilloBedelia, game.at(3, 1))
  }
}
object puertaBedeliaDesdeBuffet2 {
  var property position = game.at(8,7)
  method image() = "x64sprites/mapa/puerta-am-der.png"
  method esSolido() = true
  method esInteractuable() = true

  method interactuar() {
    habitacionActual.irA(salaPasilloBedelia, game.at(3, 1))
  }
}

object salaBuffet inherits Sala {
  override method fondo() = "x64sprites/mapa/baldosa.png"
  override method posicionInicial() = game.at(3, 3)
  override method ancho() = 16
  override method alto() = 8
  override method objetos() = [
    new ParedFrente(position = game.at(1, 7)),
    new ParedFrente(position = game.at(2, 7)),
    new ParedCarteleraKioscoIzq(position = game.at(3, 7)),
    new ParedCarteleraKioscoDer(position = game.at(4, 7)),
    new ParedFrente(position = game.at(5, 7)),
    new ParedFrente(position = game.at(6, 7)),
    new ParedFrente(position = game.at(9, 7)),
    new ParedFrente(position = game.at(10, 7)),
    new ParedFrente(position = game.at(11, 7)),
    new ParedFrente(position = game.at(12, 7)),
    new ParedFrente(position = game.at(13, 7)),
    new ParedFrente(position = game.at(14, 7)),
    new ParedIzq(position = game.at(0, 0)),
    new ParedIzq(position = game.at(0, 1)),
    new ParedIzq(position = game.at(0, 2)),
    new ParedIzq(position = game.at(0, 3)),
    new ParedIzq(position = game.at(0, 4)),
    new ParedIzq(position = game.at(0, 5)),
    new ParedIzq(position = game.at(0, 6)),
    new ParedIzq(position = game.at(0, 7)),
    new ParedIzq(position = game.at(0, 8)),
    new ParedDer(position = game.at(15, 0)),
    new ParedDer(position = game.at(15, 1)),
    new ParedDer(position = game.at(15, 2)),
    new ParedDer(position = game.at(15, 3)),
    new ParedDer(position = game.at(15, 4)),
    new ParedDer(position = game.at(15, 5)),
    new ParedDer(position = game.at(15, 6)),
    new ParedDer(position = game.at(15, 7)),
    new ParedDer(position = game.at(15, 8)),
    puertaBedeliaDesdeBuffet1,
    puertaBedeliaDesdeBuffet2,
    new MesaAbajoVertical(position = game.at(2, 0)),
    new MesaVertical(position = game.at(2, 1)),
    new MesaVertical(position = game.at(2, 2)),
    new MesaVertical(position = game.at(2, 3)),
    new MesaVertical(position = game.at(2, 4)),
    new MesaArribaEIzq(position = game.at(2, 5)),
    new Mesa(position = game.at(3, 5)),
    new Mesa(position = game.at(5, 5)),
    new MesaAbajoEDer(position = game.at(6, 5)),
    new MesaVertical(position = game.at(6, 6)),
    new MesaAbajoVertical(position = game.at(6, 1)),
    new MesaVertical(position = game.at(6, 2)),
    new MesaArribaVertical(position = game.at(6, 3)),
    new MesaAbajoVertical(position = game.at(8, 1)),
    new MesaVertical(position = game.at(8, 2)),
    new MesaArribaVertical(position = game.at(8, 3)),
    new MesaAbajoVertical(position = game.at(10, 1)),
    new MesaVertical(position = game.at(10, 2)),
    new MesaArribaVertical(position = game.at(10, 3)),
    new MesaAbajoVertical(position = game.at(12, 1)),
    new MesaVertical(position = game.at(12, 2)),
    new MesaArribaVertical(position = game.at(12, 3)),
    new MesaIzquierda(position = game.at(9, 6)),
    new Mesa(position = game.at(10, 6)),
    new Mesa(position = game.at(11, 6)),
    new Mesa(position = game.at(12, 6)),
    new Mesa(position = game.at(13, 6)),
    new MesaDerecha(position = game.at(14, 6)),
    new Termo1(position = game.at(12, 6)),
    new Termo2(position = game.at(12, 7)),
    new Kiosquera(position = game.at(4, 6)),
    yerba,
    kiosqueraMesa,
    facu
  ]

  override method configurar() {
    game.title("Buffet")
  }
}