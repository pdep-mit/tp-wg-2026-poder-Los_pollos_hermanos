import wollok.game.*
import objetosUtiles.*
import objetosDecorados.*
import objetosParedes.*
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
    self.paredesFrente(1, 2),
    [
    new ParedPizarraIzq(position = game.at(3, 8)),
    new ParedPizarraMedioEscrito(position = game.at(4, 8)),
    new ParedPizarraDer(position = game.at(5, 8))
    ],
    self.paredesFrente(6, 7),
    self.paredesIzq(0, 8),
    self.paredesDer(0, 8),
    [
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
  ].flatten()

  override method configurar() {
    game.title("Labo")
  }
}