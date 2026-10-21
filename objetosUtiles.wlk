import wollok.game.*
import personajes.*
import habitaciones.*

// comparte mucho con Npc !!
class Util {
  var property position
  method image()
  method esSolido() = true
  method esInteractuable() = true
  method interactuar()
}

class Puerta inherits Util {
  method destino()
  method posicionLlegada()

  method pasar() { habitacionActual.irA(self.destino(), self.posicionLlegada()) }
  override method interactuar() { wachington.objetivo().pasarPor(self) }
}

class AccesoBloqueado inherits Util {
  const imagen
  const mensaje
  override method image() = imagen
  override method interactuar() { game.say(wachington, mensaje) }
}

//ENTRADA
object tachoBasura inherits Util(position = game.at(13, 6)) {
  override method image() = "x64sprites/mapa/tacho-basura.png"
  override method interactuar() { wachington.objetivo().interactuarConTacho() }
}

// Papeles recogibles. Son objects (no new) para que sean siempre los mismos
// y la mochila pueda recordar cuales ya se juntaron
class PapelDelPiso inherits Util {
  const imagen
  override method image() = imagen
  override method esSolido() = false
  override method interactuar() { wachington.objetivo().interactuarConPapel(self) }
  method nombre() = "Papel"
}

object suciedadPapeles1 inherits PapelDelPiso(position = game.at(6, 5), imagen = "x64sprites/mapa/suciedad-papeles-1.png") {}
object suciedadPapeles2 inherits PapelDelPiso(position = game.at(9, 6), imagen = "x64sprites/mapa/suciedad-papeles-1.png") {}
object suciedadPapeles3 inherits PapelDelPiso(position = game.at(13, 7), imagen = "x64sprites/mapa/suciedad-papeles-2.png") {}
object suciedadPapeles4 inherits PapelDelPiso(position = game.at(4, 1), imagen = "x64sprites/mapa/suciedad-papeles-2.png") {}
object suciedadPapeles5 inherits PapelDelPiso(position = game.at(3, 7), imagen = "x64sprites/mapa/suciedad-papeles-3.png") {}

//PASILLO
object taraguiPiso inherits Util(position = game.at(4, 4)) {
  override method image() = "x64sprites/mapa/taragui-piso.png"
  override method interactuar() { wachington.objetivo().interactuarConTaragui() }
}

//AULA
object mate inherits Util(position = game.at(2, 3)) {
  override method image() = "x64sprites/mapa/mate.png"
  override method interactuar() { wachington.objetivo().interactuarConMate() }
  method nombre() = "Mate"
}

object escritorioLaptop inherits Util(position = game.at(7, 7)) {
  override method image() = "x64sprites/mapa/escritorio-laptop.png"
  override method interactuar() { wachington.objetivo().interactuarConLaptop() }
}

//LABO
object computadoraLabo inherits Util(position = game.at(2, 7)) {
  override method image() = "x64sprites/mapa/escritorio-pc-1.png"
  override method interactuar() { wachington.objetivo().interactuarConPcLabo() }
}

//BUFFET
object yerba inherits Util(position = game.at(11, 6)) {
  override method image() = "x64sprites/mapa/yerba.png"
  override method interactuar() { wachington.objetivo().interactuarConYerba() }
  method nombre() = "Yerba"
}

//MOCHILA

class Item{
  const property nombre
  const property image   
}

object llaveInglesa inherits Item(nombre = "Llave inglesa", image = "x64sprites/mapa/llave-inglesa.png") {}
object termoVacio inherits Item(nombre = "Termo vacío", image = "x64sprites/mapa/termo.png") {}
object termoLleno inherits Item(nombre = "Termo lleno", image = "x64sprites/mapa/termo.png") {}
object bizcochitos inherits Item(nombre = "Bizcochitos", image = "x64sprites/mapa/bizcochitos.png") {}
object mateArmado inherits Item(nombre = "Mate armado", image = "x64sprites/mapa/mate.png") {}
object claveDeAcceso inherits Item(nombre = "Clave de acceso", image = "x64sprites/mapa/pendrive-tp.png") {}