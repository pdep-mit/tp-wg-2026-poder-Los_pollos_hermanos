import wollok.game.*
import objetos.*
import personajes.*
import habitaciones.*
import pasilloBedelia.*

object puertaBedeliaDesdeBuffet1 inherits Puerta(position = game.at(7, 7)) {
  override method image() = "x64sprites/mapa/puerta-am-izq.png"
  override method destino() = salaPasilloBedelia
  override method posicionLlegada() = game.at(3, 1)
}
object puertaBedeliaDesdeBuffet2 inherits Puerta(position = game.at(8, 7)) {
  override method image() = "x64sprites/mapa/puerta-am-der.png"
  override method destino() = salaPasilloBedelia
  override method posicionLlegada() = game.at(3, 1)
}

object salaBuffet inherits Sala {
  override method fondo() = "x64sprites/mapa/baldosa.png"
  override method posicionInicial() = game.at(3, 3)
  override method ancho() = 16
  override method alto() = 8
  override method objetos() = [
    new ObjetoDecorativoSolido(position = game.at(1, 7), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 7), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(3, 7), image = "x64sprites/mapa/pared-cartelera-kiosco-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(4, 7), image = "x64sprites/mapa/pared-cartelera-kiosco-der.png"),
    new ObjetoDecorativoSolido(position = game.at(5, 7), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 7), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(9, 7), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(10, 7), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(11, 7), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(12, 7), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(13, 7), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(14, 7), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 0), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 1), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 2), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 3), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 4), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 5), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 6), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 7), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 8), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(15, 0), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(15, 1), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(15, 2), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(15, 3), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(15, 4), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(15, 5), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(15, 6), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(15, 7), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(15, 8), image = "x64sprites/mapa/pared-lado-der.png"),
    puertaBedeliaDesdeBuffet1,
    puertaBedeliaDesdeBuffet2,
    new ObjetoDecorativoSolido(position = game.at(2, 0), image = "x64sprites/mapa/mesa-vertical-abajo.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 1), image = "x64sprites/mapa/mesa-vertical-medio.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 2), image = "x64sprites/mapa/mesa-vertical-medio.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 3), image = "x64sprites/mapa/mesa-vertical-medio.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 4), image = "x64sprites/mapa/mesa-vertical-medio.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 5), image = "x64sprites/mapa/mesa-arriba-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(3, 5), image = "x64sprites/mapa/mesa-medio.png"),
    new ObjetoDecorativoSolido(position = game.at(5, 5), image = "x64sprites/mapa/mesa-medio.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 5), image = "x64sprites/mapa/mesa-abajo-der.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 6), image = "x64sprites/mapa/mesa-vertical-medio.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 1), image = "x64sprites/mapa/mesa-vertical-abajo.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 2), image = "x64sprites/mapa/mesa-vertical-medio.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 3), image = "x64sprites/mapa/mesa-vertical-arriba.png"),
    new ObjetoDecorativoSolido(position = game.at(8, 1), image = "x64sprites/mapa/mesa-vertical-abajo.png"),
    new ObjetoDecorativoSolido(position = game.at(8, 2), image = "x64sprites/mapa/mesa-vertical-medio.png"),
    new ObjetoDecorativoSolido(position = game.at(8, 3), image = "x64sprites/mapa/mesa-vertical-arriba.png"),
    new ObjetoDecorativoSolido(position = game.at(10, 1), image = "x64sprites/mapa/mesa-vertical-abajo.png"),
    new ObjetoDecorativoSolido(position = game.at(10, 2), image = "x64sprites/mapa/mesa-vertical-medio.png"),
    new ObjetoDecorativoSolido(position = game.at(10, 3), image = "x64sprites/mapa/mesa-vertical-arriba.png"),
    new ObjetoDecorativoSolido(position = game.at(12, 1), image = "x64sprites/mapa/mesa-vertical-abajo.png"),
    new ObjetoDecorativoSolido(position = game.at(12, 2), image = "x64sprites/mapa/mesa-vertical-medio.png"),
    new ObjetoDecorativoSolido(position = game.at(12, 3), image = "x64sprites/mapa/mesa-vertical-arriba.png"),
    new ObjetoDecorativoSolido(position = game.at(9, 6), image = "x64sprites/mapa/mesa-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(10, 6), image = "x64sprites/mapa/mesa-medio.png"),
    new ObjetoDecorativoSolido(position = game.at(11, 6), image = "x64sprites/mapa/mesa-medio.png"),
    new ObjetoDecorativoSolido(position = game.at(12, 6), image = "x64sprites/mapa/mesa-medio.png"),
    new ObjetoDecorativoSolido(position = game.at(13, 6), image = "x64sprites/mapa/mesa-medio.png"),
    new ObjetoDecorativoSolido(position = game.at(14, 6), image = "x64sprites/mapa/mesa-der.png"),
    new ObjetoDecorativoSolido(position = game.at(12, 6), image = "x64sprites/mapa/termo1.png"),
    new ObjetoDecorativoSolido(position = game.at(12, 7), image = "x64sprites/mapa/termo2.png"),
    kiosquera,
    yerba,
    kiosqueraMesa,
    facu
  ]

  override method configurar() {
    game.title("Buffet")
  }
}