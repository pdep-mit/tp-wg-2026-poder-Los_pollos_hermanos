import personajes.*
import wollok.game.*
import movimientos.*
import objetos.*
import habitaciones.*
import salas.pasillo.*

object entrada inherits Sala {
    override method ancho() = 15
    override method alto() = 10
const contenido = [ 
    //paredes
    new ParedFrente(position = game.at(1, 9)),
    new ParedFrente(position = game.at(2, 9)),
    new ParedFrente(position = game.at(3, 9)),
    new ParedFrente(position = game.at(4, 9)),
    new ParedFrente(position = game.at(5, 9)),
    new ParedFrente(position = game.at(6, 9)),
    new ParedFrente(position = game.at(7, 9)),
    new ParedFrente(position = game.at(8, 9)),
    new ParedFrente(position = game.at(9, 9)),
    new ParedFrente(position = game.at(10, 9)),
    new ParedFrente(position = game.at(13, 9)),
    new ParedFrente(position = game.at(14, 9)),

    new ParedIzq(position = game.at(0, 0)),
    new ParedIzq(position = game.at(0, 1)),
    new ParedIzq(position = game.at(0, 2)),
    new ParedIzq(position = game.at(0, 3)),
    new ParedIzq(position = game.at(0, 4)),
    new ParedIzq(position = game.at(0, 5)),
    new ParedIzq(position = game.at(0, 6)),
    new ParedIzq(position = game.at(0, 7)),
    new ParedIzq(position = game.at(0, 8)),
    new ParedIzq(position = game.at(0, 9)),

    new ParedDer(position = game.at(14, 0)),
    new ParedDer(position = game.at(14, 1)),
    new ParedDer(position = game.at(14, 2)),
    new ParedDer(position = game.at(14, 3)),
    new ParedDer(position = game.at(14, 4)),
    new ParedDer(position = game.at(14, 5)),
    new ParedDer(position = game.at(14, 6)),
    new ParedDer(position = game.at(14, 7)),
    new ParedDer(position = game.at(14, 8)),
    new ParedDer(position = game.at(14, 9)),

    //Personajes/Interactuables
    portero,
    tecnico,
    ascensor,

    //Areas no accesibles
    puertaAMMedio,
    puertaAMIzq,
    puertaAMDer,
    puertaBaño,
    puertaSalidaMedio,
    puertaSalidaIzq,
    puertaSalidaDer,
    escalerasIzq,
    escalerasDer,

    //Tacho de basura con papeles
    suciedadPapeles1,
    suciedadPapeles2,
    suciedadPapeles3,
    suciedadPapeles4,
    suciedadPapeles5,
    tachoBasura,

    //No interactuables
    new MesaHorizontalPapeles(position = game.at(2, 3)),
    new MesaArribaHorizontal(position = game.at(2, 4)),
    new MesaAbajoHorizontal(position = game.at(2, 2)),
    new CartelUTNIzq(position = game.at(10, 4)),
    new CartelUTNDer(position = game.at(11, 4)),

    new Puerta(position = game.at(5, 9), destino = pasillo)
]

  override method fondo() = "x64sprites/mapa/baldosa.png"
  override method posicionInicial() = game.at(8, 4)
  override method objetos() = contenido
}