import wollok.game.*
import objetosUtiles.*
import objetosDecorados.*
import objetosParedes.*
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
  ].flatten()

  override method configurar() {
    game.title("Aula")
  }
}