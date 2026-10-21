import wollok.game.*
import personajes.*
import habitaciones.*

class Interactuable {
  var property position
  method image()
  method esSolido() = true
  method esInteractuable() = true
  method interactuar(){
    self.reaccionarA(wachington.objetivo())
  }

  method reaccionarA(objetivo){}
  method hablar(mensaje){
    game.say(self, mensaje)
  }
}

class Puerta inherits Interactuable {
  method destino()
  method posicionLlegada()

  method pasar() { habitacionActual.irA(self.destino(), self.posicionLlegada()) }
  override method reaccionarA(objetivo) { objetivo.pasarPor(self) }}

class AccesoBloqueado inherits Interactuable {
  const imagen
  var property mensaje = "No tengo tiempo ¡Debo llegar a la clase!"

  override method image() = imagen
  override method interactuar() { game.say(wachington, mensaje) }
}

class EscaleraEntrada inherits AccesoBloqueado {
  override method mensaje() = "Si voy por las escaleras no voy a llegar más. ¡Tengo que subir por el ascensor!"
}

//ENTRADA
object tachoBasura inherits Interactuable(position = game.at(13, 6)) {
  override method image() = "x64sprites/mapa/tacho-basura.png"
  override method reaccionarA(objetivo) { objetivo.interactuarConTacho() }}

// Papeles recogibles. Son objects (no new) para que sean siempre los mismos
// y la mochila pueda recordar cuales ya se juntaron
class PapelDelPiso inherits Interactuable {
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

object papelesDelPiso{
  method todos()=[suciedadPapeles1, suciedadPapeles2, suciedadPapeles3, suciedadPapeles4, suciedadPapeles5]
}

//PASILLO
object taraguiPiso inherits Interactuable(position = game.at(4, 4)) {
  override method image() = "x64sprites/mapa/taragui-piso.png"
  override method reaccionarA(objetivo) { objetivo.interactuarConTaragui() }  method nombre() = "Yerba"
}

//AULA
object mate inherits Interactuable(position = game.at(2, 3)) {
  override method image() = "x64sprites/mapa/mate.png"
  override method reaccionarA(objetivo) { objetivo.interactuarConMate() }
  method nombre() = "Mate"
}

object escritorioLaptop inherits Interactuable(position = game.at(7, 7)) {
  override method image() = "x64sprites/mapa/escritorio-laptop.png"
  override method reaccionarA(objetivo) { objetivo.interactuarConLaptop() }}

//LABO
object computadoraLabo inherits Interactuable(position = game.at(2, 7)) {
  override method image() = "x64sprites/mapa/escritorio-pc-1.png"
  override method reaccionarA(objetivo) { objetivo.interactuarConPcLabo() }}

//BUFFET
object yerba inherits Interactuable(position = game.at(11, 6)) {
  override method image() = "x64sprites/mapa/yerba.png"
  override method reaccionarA(objetivo) { objetivo.interactuarConYerba() }
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