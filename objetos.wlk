import wollok.game.*
import personajes.*

//METER PAPELITOS EN LA MOCHILA Y DSPS EN EL TACHO PARA OBTENER LLAVE INGLESA
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

//CARGAR AGUA EN EL TERMO
object taraguiPiso {
  const property position = game.at(4, 4)
  method image() = "x64sprites/mapa/taragui-piso.png"
  method esSolido() = true
  method esInteractuable() = true
}


//INTERACTUAR CON COMPUTADORA
object computadora {
  var property position = game.at(1, 8)
  method image() = "x64sprites/mapa/pc.png"
  method esSolido() = true
  method esInteractuable() = true
  
  method hablar(mensaje) { game.say(self, mensaje) }

  method interactuar() { 
    self.hablar(tp.estado().mensajeCompu())
    tp.estado().avanzarConCompu()
  }
}

//NO-INTERACTUABLES
class ParedFrente {
  const property position
  method image() = "x64sprites/mapa/pared-frente.png"
  method esSolido() = true
  method esInteractuable() = false
}
class ParedIzq {
  const property position
  method image() = "x64sprites/mapa/pared-lado-izq.png"
  method esSolido() = true
  method esInteractuable() = false
}
class ParedDer {
  const property position
  method image() = "x64sprites/mapa/pared-lado-der.png"
  method esSolido() = true
  method esInteractuable() = false
}
class CarteleraVacia {
  const property position
  method image() = "x64sprites/mapa/pared-cartelera-vacia-medio.png"
  method esSolido() = true
  method esInteractuable() = false
}
class CarteleraLlena {
  const property position
  method image() = "x64sprites/mapa/pared-cartelera-medio.png"
  method esSolido() = true
  method esInteractuable() = false
}
class CarteleraIzq {
  const property position
  method image() = "x64sprites/mapa/pared-cartelera-izq.png"
  method esSolido() = true
  method esInteractuable() = false
}
class CarteleraDer {
  const property position
  method image() = "x64sprites/mapa/pared-cartelera-der.png"
  method esSolido() = true
  method esInteractuable() = false
}
class ComputadoraDecorativa {
  const property position
  method image() = "x64sprites/mapa/pc.png"
  method esSolido() = true
  method esInteractuable() = false
}
class CajaHerramientas {
  const property position
  method image() = "x64sprites/mapa/caja-herramientas.png"
  method esSolido() = true
  method esInteractuable() = false
}
class CartelUTNIzq {
  const property position
  method image() = "x64sprites/mapa/cartel-utn-izq.png"
  method esSolido() = true
  method esInteractuable() = false
}
class CartelUTNDer {
  const property position
  method image() = "x64sprites/mapa/cartel-utn-der.png"
  method esSolido() = true
  method esInteractuable() = false
}
class Mesa {
  const property position
  method image() = "x64sprites/mapa/mesa-medio.png"
  method esSolido() = true
  method esInteractuable() = false
}
class MesaIzquierda {
  const property position
  method image() = "x64sprites/mapa/mesa-costado-izq.png"
  method esSolido() = true
  method esInteractuable() = false
}

class MesaDerecha {
  const property position
  method image() = "x64sprites/mapa/mesa-costado-der.png"
  method esSolido() = true
  method esInteractuable() = false
}

class MesaHorizontal {
  const property position
  method image() = "x64sprites/mapa/mesa-horizontal-medio.png"
  method esSolido() = true
  method esInteractuable() = false
}
class MesaHorizontalPapeles {
  const property position
  method image() = "x64sprites/mapa/mesa-horizontal-medio-papeles.png"
  method esSolido() = true
  method esInteractuable() = false
}

class MesaArribaHorizontal {
  const property position
  method image() = "x64sprites/mapa/mesa-horizontal-arriba.png"
  method esSolido() = true
  method esInteractuable() = false
}

class MesaAbajoHorizontal {
  const property position
  method image() = "x64sprites/mapa/mesa-horizontal-abajo.png"
  method esSolido() = true
  method esInteractuable() = false
}

class Flecha {
  const property position
  method image() = "x64sprites/mapa/flecha.png"
  method esSolido() = false
  method esInteractuable() = false
}

class TaraguiPared {
  const property position
  method image() = "x64sprites/mapa/taragui-pared.png"
  method esSolido() = false
  method esInteractuable() = false
}
class CartelAgua {
  const property position
  method image() = "x64sprites/mapa/piso-mojado.png"
  method esSolido() = true
  method esInteractuable() = false
}
class Aguita {
  const property position
  method image() = "x64sprites/mapa/aguita.png"
  method esSolido() = false
  method esInteractuable() = false
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
