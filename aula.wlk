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
  override method crearObjetos() = [
    [
    new ParedPizarraIzq(position = game.at(1, 8)),
    new ParedPizarraMedio(position = game.at(2, 8)),
    new ParedPizarraMedio(position = game.at(3, 8)),
    new ParedPizarraMedioEscrito(position = game.at(4, 8)),
    new ParedPizarraDer(position = game.at(5, 8))
    ],
    self.paredesFrente(6, 7),
    self.paredesIzq(0, 8),
    self.paredesDer(0, 4),
    self.paredesDer(6, 8),
    [
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
  ].flatten()

  override method configurar() {
    game.title("Aula")
  }
}