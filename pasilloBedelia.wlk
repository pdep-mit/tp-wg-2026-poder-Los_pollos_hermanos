import wollok.game.*
import objetos.*
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
  override method objetos() = [
    new ObjetoDecorativoSolido(position = game.at(1, 8), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 8), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(3, 8), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(4, 8), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(5, 8), image = "x64sprites/mapa/puerta-medio.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 8), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 0), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 1), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 2), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 3), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 4), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 7), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 8), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(7, 0), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(7, 1), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(7, 2), image = "x64sprites/mapa/pared-bedelia.png"),
    new ObjetoDecorativoSolido(position = game.at(7, 3), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(7, 4), image = "x64sprites/mapa/pared-bedelia.png"),
    new ObjetoDecorativoSolido(position = game.at(7, 5), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(7, 6), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(7, 7), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(7, 8), image = "x64sprites/mapa/pared-lado-der.png"),
    bedelia,
    puertaPasillo1DesdeBedelia,
    puertaPasillo2DesdeBedelia,
    puertaBuffetDesdeBedelia1,
    puertaBuffetDesdeBedelia2,
    new ObjetoDecorativoNoSolido(position = game.at(5, 7), image = "x64sprites/mapa/aguita.png"),
    new ObjetoDecorativoSolido(position = game.at(5, 7), image = "x64sprites/mapa/piso-mojado.png"),
    new ObjetoDecorativoNoSolido(position = game.at(6, 3), image = "x64sprites/mapa/flecha-der.png")
  ]

  override method configurar() {
    game.title("Pasillo Bedelia")
  }
}