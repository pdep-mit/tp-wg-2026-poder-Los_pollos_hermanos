import wollok.game.*
import personajes.*
import movimientos.*
import objetos.*
import salas.entrada.*
import habitaciones.*


object pasillo inherits Sala {
    override method ancho() = 18
    override method alto() = 6
    const contenido = [
    //paredes
    new ParedFrente(position = game.at(1, 5)),
    new ParedFrente(position = game.at(2, 5)),
    new ParedFrente(position = game.at(3, 5)),
    new ParedFrente(position = game.at(4, 5)),
    new ParedFrente(position = game.at(5, 5)),
    new ParedFrente(position = game.at(6, 5)),
    new CarteleraIzq(position = game.at(7, 5)),
    new CarteleraLlena(position = game.at(8, 5)),
    new CarteleraDer(position = game.at(9, 5)),
    new ParedFrente(position = game.at(10, 5)),
    new ParedFrente(position = game.at(11, 5)),
    new ParedFrente(position = game.at(13, 5)),
    new ParedFrente(position = game.at(14, 5)),
    new ParedFrente(position = game.at(15, 5)),
    new ParedFrente(position = game.at(16, 5)),

    new ParedIzq(position = game.at(0, 0)),
    new ParedIzq(position = game.at(0, 1)),
    new ParedIzq(position = game.at(0, 3)),
    new ParedIzq(position = game.at(0, 4)),
    new ParedIzq(position = game.at(0, 5)),

    new ParedDer(position = game.at(17, 0)),
    new ParedDer(position = game.at(17, 1)),
    new ParedDer(position = game.at(17, 4)),
    new ParedDer(position = game.at(17, 5)),

    //PUERTAS
    puertaAula,
    puertaLabo,
    puertaBedelia1,
    puertaBedelia2,
    escalerasPasillo1,
    escalerasPasillo2,

    //MISC
    new CartelAgua(position = game.at(7, 1)),
    new Aguita(position = game.at(6, 1)),
    new Aguita(position = game.at(8, 1)),
    new Aguita(position = game.at(4, 4)),
    new TaraguiPared(position = game.at(4, 5)),
    

    //INTERACTUABLES
    taraguiPiso

  ]

  override method fondo() = "x64sprites/mapa/baldosa.png"  
  override method posicionInicial() = game.at(1, 2)           
  override method objetos() = contenido
}