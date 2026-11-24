import wollok.game.*
import dialogos.*
import personajes.*
import habitaciones.*

class ObjetoDecorativo {
  const property position
  method interactuar(){}
  const property image
}

class ObjetoDecorativoSolido inherits ObjetoDecorativo {
  method esSolido() = true
}

class ObjetoDecorativoNoSolido inherits ObjetoDecorativo {
  method esSolido() = false
}

// DECORADOS (cada clase fija su imagen, solo se les pasa la posicion)
class ComputadoraDecorativa inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/pc.png") {}
class CajaHerramientas inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/caja-herramientas.png") {}
class CartelUTNIzq inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/cartel-utn-izq.png") {}
class CartelUTNDer inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/cartel-utn-der.png") {}
class Mesa inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/mesa-medio.png") {}
class MesaIzquierda inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/mesa-izq.png") {}
class MesaDerecha inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/mesa-der.png") {}
class MesaVertical inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/mesa-vertical-medio.png") {}
class MesaVerticalPapeles inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/mesa-vertical-medio-papeles.png") {}
class MesaArribaVertical inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/mesa-vertical-arriba.png") {}
class MesaAbajoVertical inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/mesa-vertical-abajo.png") {}
class MesaArribaEIzq inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/mesa-arriba-izq.png") {}
class MesaAbajoEDer inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/mesa-abajo-der.png") {}
class FlechaDer inherits ObjetoDecorativoNoSolido(image = "x64sprites/mapa/flecha-der.png") {}
class TaraguiPared inherits ObjetoDecorativoNoSolido(image = "x64sprites/mapa/taragui-pared.png") {}
class CartelAgua inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/piso-mojado.png") {}
class Aguita inherits ObjetoDecorativoNoSolido(image = "x64sprites/mapa/aguita.png") {}
class Escritorio inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/escritorio.png") {}
class EscritorioVertical inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/escritorio-vertical.png") {}
class EscritorioVerticalPC inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/escritorio-vertical-pc.png") {}
class EscritorioCerrado inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/escritorio-cerrado.png") {}
class EscritorioCerradoLleno inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/escritorio-cerrado-lleno.png") {}
class EscritorioDenise inherits ObjetoDecorativoSolido(image = "x64sprites/personajes/denise/denise-silla-der-2.png") {}
class EscritorioJulian inherits ObjetoDecorativoSolido(image = "x64sprites/personajes/julian/julian-silla-izq-2.png") {}
class EscritorioAgus inherits ObjetoDecorativoSolido(image = "x64sprites/personajes/agus/agus-silla-der-2.png") {}
class Silla inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/silla-vacia.png") {}
class SillaIzq inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/silla-izq.png") {}
class SillaDer inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/silla-der.png") {}
class ComputadoraLabo inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/escritorio-pc-1.png") {}
class ComputadoraLaboTop inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/escritorio-pc-2.png") {}
class ComputadoraLaboIzq inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/escritorio-vertical-pc-izq.png") {}
class ComputadoraLaboDer inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/escritorio-vertical-pc-der.png") {}
class PuertaDecor inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/puerta-medio.png") {}
class Termo1 inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/termo1.png") {}
class Termo2 inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/termo2.png") {}

// PAREDES
class ParedFrente inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/pared-frente.png") {}
class ParedIzq inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/pared-lado-izq.png") {}
class ParedDer inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/pared-lado-der.png") {}
class ParedCarteleraVacia inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/pared-cartelera-vacia-medio.png") {}
class ParedCarteleraLlena inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/pared-cartelera-medio.png") {}
class ParedCarteleraIzq inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/pared-cartelera-izq.png") {}
class ParedCarteleraDer inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/pared-cartelera-der.png") {}
class ParedPizarraMedio inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/pared-frente-pizarra.png") {}
class ParedPizarraMedioEscrito inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/pared-frente-pizarra-escrito.png") {}
class ParedPizarraIzq inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/pared-frente-pizarra-izq.png") {}
class ParedPizarraDer inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/pared-frente-pizarra-der.png") {}
class ParedBedelia inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/pared-bedelia.png") {}
class ParedCarteleraKioscoIzq inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/pared-cartelera-kiosco-izq.png") {}
class ParedCarteleraKioscoDer inherits ObjetoDecorativoSolido(image = "x64sprites/mapa/pared-cartelera-kiosco-der.png") {}

class Interactuable {
  var property position
  method image()
  method esSolido() = true
  method interactuar(){
    self.reaccionarA(wachington.objetivo())
  }

  method reaccionarA(objetivo){}
  method hablar(mensaje){
    dialogo.mostrar(self, mensaje)
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
  override method interactuar() { dialogo.mostrar(wachington, mensaje) }
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
  override method interactuar() { 
    if (wachington.estaEncimaDe(self)) { wachington.objetivo().interactuarConPapel(self) }
  }
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