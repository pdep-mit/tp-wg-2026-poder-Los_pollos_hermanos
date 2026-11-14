import wollok.game.*
import objetos.*
import personajes.*
import habitaciones.*
import pasillo.*

object puertaPasilloDesdeLabo inherits Puerta(position = game.at(4, 0)) {
  override method image() = "x64sprites/mapa/puerta-salida.png"
  override method destino() = salaPasillo
  override method posicionLlegada() = game.at(12, 4)
}

object salaLabo inherits Sala {
  override method fondo() = "x64sprites/mapa/baldosa.png"
  override method posicionInicial() = game.at(3, 3)
  override method ancho() = 9
  override method alto() = 9
  override method recibir(objetivo) { objetivo.alEntrarAlLabo() }
  override method objetos() = [
    new ObjetoDecorativoSolido(position = game.at(1, 8), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 8), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(3, 8), image = "x64sprites/mapa/pared-frente-pizarra-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(4, 8), image = "x64sprites/mapa/pared-frente-pizarra-escrito.png"),
    new ObjetoDecorativoSolido(position = game.at(5, 8), image = "x64sprites/mapa/pared-frente-pizarra-der.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 8), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(7, 8), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 0), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 1), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 2), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 3), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 4), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 5), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 6), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 7), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 8), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(8, 0), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(8, 1), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(8, 2), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(8, 3), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(8, 4), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(8, 5), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(8, 6), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(8, 7), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(8, 8), image = "x64sprites/mapa/pared-lado-der.png"),
    puertaPasilloDesdeLabo,
    rasta,
    mati,
    computadoraLabo,
    new ObjetoDecorativoSolido(position = game.at(1, 2), image = "x64sprites/mapa/escritorio-vertical-pc-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(1, 4), image = "x64sprites/mapa/escritorio-vertical-pc-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(7, 2), image = "x64sprites/mapa/escritorio-vertical-pc-der.png"),
    new ObjetoDecorativoSolido(position = game.at(7, 4), image = "x64sprites/mapa/escritorio-vertical-pc-der.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 8), image = "x64sprites/mapa/escritorio-pc-2.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 7), image = "x64sprites/mapa/escritorio-pc-1.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 8), image = "x64sprites/mapa/escritorio-pc-2.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 7), image = "x64sprites/mapa/silla-vacia.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 2), image = "x64sprites/mapa/silla-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 4), image = "x64sprites/mapa/silla-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 2), image = "x64sprites/mapa/silla-der.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 4), image = "x64sprites/mapa/silla-der.png"),
    new ObjetoDecorativoSolido(position = game.at(1, 6), image = "x64sprites/mapa/silla-der.png")
  ]

  override method configurar() {
    game.title("Labo")
  }
}