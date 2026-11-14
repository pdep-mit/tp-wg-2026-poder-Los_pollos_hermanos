import wollok.game.*
import objetosUtiles.*
import objetosDecorados.*
import objetosParedes.*
import personajes.*
import habitaciones.*
import pasillo.*
import historiaEntrada.*

//ACCESOS UTILES
object ascensor {
  var property position = game.at(4, 9)
  method image() = "x64sprites/mapa/ascensor.png"
  method esSolido() = true
  method esInteractuable() = true

  method interactuar() {
    //habitacionActual.irA(salaPasillo, game.at(14, 0))
    wachington.objetivo().interactuarConAscensor()
  }
}


//ACCESOS INUTILES
object puertaBaño inherits AccesoBloqueado(position = game.at(2, 9), imagen = "x64sprites/mapa/puerta-banio.png", mensaje = "No tengo tiempo ¡Debo llegar a la clase!") {}
object puertaAMMedio inherits AccesoBloqueado(position = game.at(7, 9), imagen = "x64sprites/mapa/puerta-am-medio.png", mensaje = "No tengo tiempo ¡Debo llegar a la clase!") {}
object puertaAMIzq inherits AccesoBloqueado(position = game.at(6, 9), imagen = "x64sprites/mapa/puerta-am-izq.png", mensaje = "No tengo tiempo ¡Debo llegar a la clase!") {}
object puertaAMDer inherits AccesoBloqueado(position = game.at(8, 9), imagen = "x64sprites/mapa/puerta-am-der.png", mensaje = "No tengo tiempo ¡Debo llegar a la clase!") {}

object puertaSalidaMedio inherits AccesoBloqueado(position = game.at(7, 0), imagen = "x64sprites/mapa/puerta-salida-medio.png", mensaje = "No tengo tiempo ¡Debo llegar a la clase!") {
  override method esSolido() = false
}
object puertaSalidaIzq inherits AccesoBloqueado(position = game.at(6, 0), imagen = "x64sprites/mapa/puerta-salida-izq.png", mensaje = "No tengo tiempo ¡Debo llegar a la clase!") {
  override method esSolido() = false
}
object puertaSalidaDer inherits AccesoBloqueado(position = game.at(8, 0), imagen = "x64sprites/mapa/puerta-salida-der.png", mensaje = "No tengo tiempo ¡Debo llegar a la clase!") {
  override method esSolido() = false
}

object escalerasIzq inherits AccesoBloqueado(position = game.at(11, 9), imagen = "x64sprites/mapa/escaleras-izq.png", mensaje = "Si voy por las escaleras no voy a llegar más. ¡Tengo que subir por el ascensor!") {}
object escalerasDer inherits AccesoBloqueado(position = game.at(12, 9), imagen = "x64sprites/mapa/escaleras-der.png", mensaje = "Si voy por las escaleras no voy a llegar más. ¡Tengo que subir por el ascensor!") {}

object salaEntrada inherits Sala {
  override method fondo() = "x64sprites/mapa/baldosa.png"
  override method posicionInicial() = game.at(7, 0)
  override method ancho() = 15
  override method alto() = 10
  override method crearObjetos() = [
    self.paredesFrente(1, 10),
    self.paredesFrente(13, 14),
    self.paredesIzq(0, 9),
    self.paredesDer(0, 9),
    [
    portero,
    tecnico,
    ascensor,
    puertaAMMedio,
    puertaAMIzq,
    puertaAMDer,
    puertaBaño,
    puertaSalidaMedio,
    puertaSalidaIzq,
    puertaSalidaDer,
    escalerasIzq,
    escalerasDer,
    suciedadPapeles1,
    suciedadPapeles2,
    suciedadPapeles3,
    suciedadPapeles4,
    suciedadPapeles5,
    tachoBasura,
    new MesaVerticalPapeles(position = game.at(2, 3)),
    new MesaArribaVertical(position = game.at(2, 4)),
    new MesaAbajoVertical(position = game.at(2, 2)),
    new CartelUTNIzq(position = game.at(10, 4)),
    new CartelUTNDer(position = game.at(11, 4))
    ]
  ].flatten()

  override method configurar() {
    game.title("Entrada")
  }
}