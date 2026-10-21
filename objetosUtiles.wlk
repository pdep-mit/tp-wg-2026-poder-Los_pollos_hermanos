import wollok.game.*
import personajes.*

//ENTRADA
object tachoBasura {
  var property position = game.at(13, 6)
  method image() = "x64sprites/mapa/tacho-basura.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
// Papeles recogibles. Son objects (no new) para que sean siempre los mismos
// y la mochila pueda recordar cuales ya se juntaron
class PapelDelPiso {
  const property position
  const imagen
  method image() = imagen
  method esSolido() = false
  method esInteractuable() = true

  method interactuar() { wachington.objetivo().interactuarConPapel(self) }
}

object suciedadPapeles1 inherits PapelDelPiso(position = game.at(6, 5), imagen = "x64sprites/mapa/suciedad-papeles-1.png") {}
object suciedadPapeles2 inherits PapelDelPiso(position = game.at(9, 6), imagen = "x64sprites/mapa/suciedad-papeles-1.png") {}
object suciedadPapeles3 inherits PapelDelPiso(position = game.at(13, 7), imagen = "x64sprites/mapa/suciedad-papeles-2.png") {}
object suciedadPapeles4 inherits PapelDelPiso(position = game.at(4, 1), imagen = "x64sprites/mapa/suciedad-papeles-2.png") {}
object suciedadPapeles5 inherits PapelDelPiso(position = game.at(3, 7), imagen = "x64sprites/mapa/suciedad-papeles-3.png") {}

//PASILLO
object taraguiPiso {
  const property position = game.at(4, 4)
  method image() = "x64sprites/mapa/taragui-piso.png"
  method esSolido() = true
  method esInteractuable() = true
}

//AULA
object mate {
  const property position = game.at(2, 3)
  method image() = "x64sprites/mapa/mate.png"
  method esSolido() = true
  method esInteractuable() = true
}
object escritorioLaptop {
  const property position = game.at(7, 7)
  method image() = "x64sprites/mapa/escritorio-laptop.png"
  method esSolido() = true
  method esInteractuable() = false
}

//LABO
object computadoraLabo {
  const property position = game.at(2, 7)
  method image() = "x64sprites/mapa/escritorio-pc-1.png"
  method esSolido() = true
  method esInteractuable() = true
}

object computadora {
  var property position = game.at(1, 8)
  method image() = "x64sprites/mapa/escritorio-pc-1.png"
  method esSolido() = true
  method esInteractuable() = true
  
  method hablar(mensaje) { game.say(self, mensaje) }

  method interactuar() { 
    self.hablar(tp.estado().mensajeCompu())
    tp.estado().avanzarConCompu()
  }
}

//BUFFET
object yerba {
  var property position = game.at(11, 6)
  method image() = "x64sprites/mapa/yerba.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}

//ESTADOS
object tp {
  var property estado = sinTp
}


object sinTp {
  method mensajeRasta() = "Dame un segundo y te habilito el TP"
  method mensajeCompa() = "Anda a pedirle a rasta que te de el TP"
  method mensajeCompu() = "???"

  method avanzarConRasta() {
    tp.estado(tpIncompleto)
    wachington.guardar(tp)
  }
  method avanzarConCompu() {}
}


object tpIncompleto {
  method mensajeRasta() = "Ya tenés acceso al repo. No pierdas tiempo y terminá el TP"
  method mensajeCompa() = "Esta complicado el TP?? jaja"
  method mensajeCompu() = "Completado"

  method avanzarConRasta() {}
  method avanzarConCompu() { tp.estado(tpCompleto) }
}


object tpCompleto {
  method mensajeRasta() = "Listooo"
  method mensajeCompa() = "Entregalo"
  method mensajeCompu() = "..."

  method avanzarConRasta() { tp.estado(tpEntregado) }
  method avanzarConCompu() {}
}


object tpEntregado {
  method mensajeRasta() = "Ahora anda a buscarme un mate al buffet para que lo pueda corregir"
  method mensajeCompa() = "..."
  method mensajeCompu() = "..."

  method avanzarConRasta() {}
  method avanzarConCompu() {}
}
