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
object suciedadPapeles1 {
  const property position = game.at(6, 5)
  method image() = "x64sprites/mapa/suciedad-papeles-1.png"
  method esSolido() = false
  method esInteractuable() = true
}
object suciedadPapeles2 {
  const property position = game.at(9, 6)
  method image() = "x64sprites/mapa/suciedad-papeles-1.png"
  method esSolido() = false
  method esInteractuable() = true
}
object suciedadPapeles3 {
  const property position = game.at(13, 8)
  method image() = "x64sprites/mapa/suciedad-papeles-2.png"
  method esSolido() = false
  method esInteractuable() = true
}
object suciedadPapeles4 {
  const property position = game.at(4, 1)
  method image() = "x64sprites/mapa/suciedad-papeles-2.png"
  method esSolido() = false
  method esInteractuable() = true
}
object suciedadPapeles5 {
  const property position = game.at(3, 7)
  method image() = "x64sprites/mapa/suciedad-papeles-3.png"
  method esSolido() = false
  method esInteractuable() = true
}

//PASILLO
object taraguiPiso {
  const property position = game.at(4, 4)
  method image() = "x64sprites/mapa/taragui-piso.png"
  method esSolido() = true
  method esInteractuable() = true
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
    alumno.guardar(tp)
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
