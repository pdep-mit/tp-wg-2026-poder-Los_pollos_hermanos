import wollok.game.*
import objetosUtiles.*
import objetosDecorados.*
import objetosParedes.*
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
    self.paredesFrente(1, 2),
    [
    new ParedCarteleraKioscoIzq(position = game.at(3, 7)),
    new ParedCarteleraKioscoDer(position = game.at(4, 7))
    ],
    self.paredesFrente(5, 6),
    self.paredesFrente(9, 14),
    self.paredesIzq(0, 8),
    self.paredesDer(0, 8),
    [
    puertaBedeliaDesdeBuffet1,
    puertaBedeliaDesdeBuffet2,
    new MesaAbajoVertical(position = game.at(2, 0))
    ],
    self.columna(2, 1, 4, { posicion => new MesaVertical(position = posicion) }),
    [
    new MesaArribaEIzq(position = game.at(2, 5)),
    new Mesa(position = game.at(3, 5)),
    new Mesa(position = game.at(5, 5)),
    new MesaAbajoEDer(position = game.at(6, 5)),
    new MesaVertical(position = game.at(6, 6))
    ],
    [6, 8, 10, 12].flatMap({ x => self.mesaVerticalCorta(x) }),
    [new MesaIzquierda(position = game.at(9, 6))],
    self.fila(6, 10, 13, { posicion => new Mesa(position = posicion) }),
    [
    new MesaDerecha(position = game.at(14, 6)),
    new Termo1(position = game.at(12, 6)),
    new Termo2(position = game.at(12, 7)),
    kiosquera,
    yerba,
    kiosqueraMesa,
    facu
    ]
  ].flatten()

  // Mesa de 3 celdas parada (de y=1 a y=3) en la columna x
  method mesaVerticalCorta(x) = [
    new MesaAbajoVertical(position = game.at(x, 1)),
    new MesaVertical(position = game.at(x, 2)),
    new MesaArribaVertical(position = game.at(x, 3))
  ]

  override method configurar() {
    game.title("Buffet")
  }
}