import wollok.game.*
import objetosUtiles.*
import objetosDecorados.*
import objetosParedes.*
import personajes.*
import habitaciones.*
import pasillo.*

object puertaPasilloDesdeAula {
  var property position = game.at(8, 5)
  method image() = "x64sprites/mapa/puerta-der.png"
  method esSolido() = true
  method esInteractuable() = true

  method interactuar() {
    habitacionActual.irA(salaPasillo, game.at(1, 2))
  }
}

object salaAula inherits Sala {
  override method fondo() = "x64sprites/mapa/baldosa.png"
  override method posicionInicial() = game.at(3, 3)
  override method ancho() = 9
  override method alto() = 9
  override method objetos() = [
    new ParedPizarraIzq(position = game.at(1, 8)),
    new ParedPizarraMedio(position = game.at(2, 8)),
    new ParedPizarraMedio(position = game.at(3, 8)),
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
    new ParedDer(position = game.at(8, 6)),
    new ParedDer(position = game.at(8, 7)),
    new ParedDer(position = game.at(8, 8)),
    puertaPasilloDesdeAula,
    new Escritorio(position = game.at(2, 3)),
    new EscritorioCerrado(position = game.at(2, 5)),
    new EscritorioCerrado(position = game.at(4, 1)),
    new EscritorioCerrado(position = game.at(4, 5)),
    new EscritorioCerrado(position = game.at(6, 1)),
    new EscritorioCerrado(position = game.at(6, 3)),
    new EscritorioDenise(position = game.at(4, 3)),
    new EscritorioJulian(position = game.at(2, 1)),
    new EscritorioAgus(position = game.at(6, 5)),
    escritorioLaptop,
    matos,
    julianSilla,
    deniseSilla,
    agusSilla,
    mate
  ]

  override method configurar() {
    game.title("Aula")
  }
}