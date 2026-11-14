import wollok.game.*
import objetosUtiles.*
import objetosDecorados.*
import objetosParedes.*
import personajes.*
import habitaciones.*
import pasillo.*
import buffet.*

object puertaPasillo1DesdeBedelia inherits Puerta(position = game.at(0, 5)) {
  override method image() = "x64sprites/mapa/puerta-izq.png"
  override method destino() = salaPasillo
  override method posicionLlegada() = game.at(16, 2)
}
object puertaPasillo2DesdeBedelia inherits Puerta(position = game.at(0, 6)) {
  override method image() = "x64sprites/mapa/puerta-izq.png"
  override method destino() = salaPasillo
  override method posicionLlegada() = game.at(16, 2)
}
object puertaBuffetDesdeBedelia1 inherits Puerta(position = game.at(3, 0)) {
  override method image() = "x64sprites/mapa/puerta-salida-izq.png"
  override method esSolido() = false
  override method destino() = salaBuffet
  override method posicionLlegada() = game.at(7, 6)
}
object puertaBuffetDesdeBedelia2 inherits Puerta(position = game.at(4, 0)) {
  override method image() = "x64sprites/mapa/puerta-salida-der.png"
  override method esSolido() = false
  override method destino() = salaBuffet
  override method posicionLlegada() = game.at(7, 6)
}

object salaPasilloBedelia inherits Sala {
  override method fondo() = "x64sprites/mapa/baldosa.png"
  override method posicionInicial() = game.at(3, 3)
  override method ancho() = 8
  override method alto() = 9
  override method crearObjetos() = [
    self.paredesFrente(1, 4),
    [new PuertaDecor(position = game.at(5, 8))],
    self.paredesFrente(6, 6),
    self.paredesIzq(0, 4),
    self.paredesIzq(7, 8),
    self.paredesDer(0, 1),
    [new ParedBedelia(position = game.at(7, 2))],
    self.paredesDer(3, 3),
    [new ParedBedelia(position = game.at(7, 4))],
    self.paredesDer(5, 8),
    [
    bedelia,
    puertaPasillo1DesdeBedelia,
    puertaPasillo2DesdeBedelia,
    puertaBuffetDesdeBedelia1,
    puertaBuffetDesdeBedelia2,
    new Aguita(position = game.at(5, 7)),
    new CartelAgua(position = game.at(5, 7)),
    new FlechaDer(position = game.at(6, 3))
    ]
  ].flatten()

  override method configurar() {
    game.title("Pasillo Bedelia")
  }
}