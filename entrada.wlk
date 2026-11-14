import wollok.game.*
import objetos.*
import personajes.*
import habitaciones.*
import pasillo.*
import historiaEntrada.*

//ACCESOS UTILES
object ascensor inherits Interactuable(position = game.at(4, 9)) {
  override method image() = "x64sprites/mapa/ascensor.png"
  override method reaccionarA(objetivo) { objetivo.interactuarConAscensor() }
}


//ACCESOS INUTILES
object puertaBaño inherits AccesoBloqueado(position = game.at(2, 9), imagen = "x64sprites/mapa/puerta-banio.png") {}
object puertaAMMedio inherits AccesoBloqueado(position = game.at(7, 9), imagen = "x64sprites/mapa/puerta-am-medio.png") {}
object puertaAMIzq inherits AccesoBloqueado(position = game.at(6, 9), imagen = "x64sprites/mapa/puerta-am-izq.png") {}
object puertaAMDer inherits AccesoBloqueado(position = game.at(8, 9), imagen = "x64sprites/mapa/puerta-am-der.png") {}
object puertaSalidaMedio inherits AccesoBloqueado(position = game.at(7, 0), imagen = "x64sprites/mapa/puerta-salida-medio.png") {
  override method esSolido() = false
}
object puertaSalidaIzq inherits AccesoBloqueado(position = game.at(6, 0), imagen = "x64sprites/mapa/puerta-salida-izq.png") {
  override method esSolido() = false
}
object puertaSalidaDer inherits AccesoBloqueado(position = game.at(8, 0), imagen = "x64sprites/mapa/puerta-salida-der.png") {
  override method esSolido() = false
}
object escalerasIzq inherits EscaleraEntrada(position = game.at(11, 9), imagen = "x64sprites/mapa/escaleras-izq.png") {}
object escalerasDer inherits EscaleraEntrada(position = game.at(12, 9), imagen = "x64sprites/mapa/escaleras-der.png") {}
object salaEntrada inherits Sala {
  override method fondo() = "x64sprites/mapa/baldosa.png"
  override method posicionInicial() = game.at(7, 0)
  override method ancho() = 15
  override method alto() = 10
  override method objetos() = [
    new ObjetoDecorativoSolido(position = game.at(1, 9), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 9), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(3, 9), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(4, 9), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(5, 9), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(6, 9), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(7, 9), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(8, 9), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(9, 9), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(10, 9), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(13, 9), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(14, 9), image = "x64sprites/mapa/pared-frente.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 0), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 1), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 2), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 3), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 4), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 5), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 6), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 7), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 8), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(0, 9), image = "x64sprites/mapa/pared-lado-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(14, 0), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(14, 1), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(14, 2), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(14, 3), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(14, 4), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(14, 5), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(14, 6), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(14, 7), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(14, 8), image = "x64sprites/mapa/pared-lado-der.png"),
    new ObjetoDecorativoSolido(position = game.at(14, 9), image = "x64sprites/mapa/pared-lado-der.png"),
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
    new ObjetoDecorativoSolido(position = game.at(2, 3), image = "x64sprites/mapa/mesa-vertical-medio-papeles.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 4), image = "x64sprites/mapa/mesa-vertical-arriba.png"),
    new ObjetoDecorativoSolido(position = game.at(2, 2), image = "x64sprites/mapa/mesa-vertical-abajo.png"),
    new ObjetoDecorativoSolido(position = game.at(10, 4), image = "x64sprites/mapa/cartel-utn-izq.png"),
    new ObjetoDecorativoSolido(position = game.at(11, 4), image = "x64sprites/mapa/cartel-utn-der.png")
  ]

  override method configurar() {
    game.title("Entrada")
  }
}