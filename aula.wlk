import wollok.game.*
import objetos.*
import personajes.*
import habitaciones.*
import pasillo.*

object puertaPasilloDesdeAula inherits Puerta(position = game.at(8, 5)) {
  override method image() = "x64sprites/mapa/puerta-der.png"
  override method destino() = salaPasillo
  override method posicionLlegada() = game.at(1, 2)
}

object salaAula inherits Sala {
  override method fondo() = "x64sprites/mapa/baldosa.png"
  override method posicionInicial() = game.at(3, 3)
  override method ancho() = 9
  override method alto() = 9
  override method recibir(objetivo) { objetivo.alEntrarAlAula() }
  override method objetos() = [
new ObjetoDecorativoSolido(position = game.at(1, 8), image = "x64sprites/mapa/pared-frente-pizarra-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 8), image = "x64sprites/mapa/pared-frente-pizarra.png"),
    new ObjetoDecorativoSolido(position = game.at(3, 8), image = "x64sprites/mapa/pared-frente-pizarra.png"),
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
    new ObjetoDecorativoSolido(position = game.at(8, 6), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(8, 7), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(8, 8), image = "x64sprites/mapa/pared-lado-der.png"),
    puertaPasilloDesdeAula,
    new ObjetoDecorativoSolido(position = game.at(2, 3), image = "x64sprites/mapa/escritorio.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 5), image = "x64sprites/mapa/escritorio-cerrado.png"),
    new ObjetoDecorativoSolido(position = game.at(4, 1), image = "x64sprites/mapa/escritorio-cerrado.png"),
    new ObjetoDecorativoSolido(position = game.at(4, 5), image = "x64sprites/mapa/escritorio-cerrado.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 1), image = "x64sprites/mapa/escritorio-cerrado.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 3), image = "x64sprites/mapa/escritorio-cerrado.png"),
    new ObjetoDecorativoSolido(position = game.at(4, 3), image = "x64sprites/personajes/denise/denise-silla-der-2.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 1), image = "x64sprites/personajes/julian/julian-silla-izq-2.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 5), image = "x64sprites/personajes/agus/agus-silla-der-2.png"),
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