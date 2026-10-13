import wollok.game.*
import objetos.*


//PERSONAJES INTERACTUABLES
object alumno {
  var property position = game.at(7, 0)
  var property imagen = "x64sprites/personajes/wachington/wachington-frente.png"
  method image() = imagen
  method esSolido() = true
  const mochila = []

  method estaAlLadoDe(otro) = self.position().distance(otro.position()) == 1 // Chequea si esta al lado de otro personaje. 
  // Uno porque asi da el calculo que hace distance si esta al lado (no sirve si esta en diagonal)

   method interactuar() {
      const cercanos = game.allVisuals().filter({ obj => self.estaAlLadoDe(obj) && obj.esInteractuable()})
      
      if (cercanos.isEmpty()) {
          game.say(self, "Acá no hay nadie con quien hablar...")
      } else {
          cercanos.first().interactuar()
      }
  }

  method guardar(objeto) { mochila.add(objeto) }
  method tiene(objeto) = mochila.contains(objeto) 
}


object rasta {
  var property position = game.at(0,0)
  method image() = "x64sprites/personajes/rasta/rasta-frente.png"
  method esSolido() = true // Para que el personaje pueda chocar
  method esInteractuable() = true

  method hablar(mensaje) { game.say(self, mensaje) } 

  method interactuar() { 
    self.hablar(tp.estado().mensajeRasta()) 
    tp.estado().avanzarConRasta()
  }
}


object companieroClase {
  var property position = game.at(4, 5)
  method image() = "x64sprites/personajes/wachington/wachington-frente.png"
  method esSolido() = true
  method esInteractuable() = true

  method hablar(mensaje) { game.say(self, mensaje) } 

  method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}

object portero {
  var property position = game.at(2, 5)
  method image() = "x64sprites/personajes/portero/portero-der.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}

object tecnico {
  var property position = game.at(12, 2)
  method image() = "x64sprites/personajes/tecnico/tecnico-izq.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}

//OBJETOS INTERACTUABLES
object ascensor {
  var property position = game.at(4, 9)
  method image() = "x64sprites/mapa/ascensor.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}

object puertaBaño {
  var property position = game.at(2, 9)
  method image() = "x64sprites/mapa/puerta-banio.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}

object puertaAMMedio {
  var property position = game.at(7, 9)
  method image() = "x64sprites/mapa/puerta-am-medio.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object puertaAMIzq {
  var property position = game.at(6, 9)
  method image() = "x64sprites/mapa/puerta-am-izq.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object puertaAMDer {
  var property position = game.at(8, 9)
  method image() = "x64sprites/mapa/puerta-am-der.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object puertaSalidaMedio {
  var property position = game.at(7, 0)
  method image() = "x64sprites/mapa/puerta-salida-medio.png"
  method esSolido() = false
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object puertaSalidaIzq {
  var property position = game.at(6, 0)
  method image() = "x64sprites/mapa/puerta-salida-izq.png"
  method esSolido() = false
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object puertaSalidaDer {
  var property position = game.at(8, 0)
  method image() = "x64sprites/mapa/puerta-salida-der.png"
  method esSolido() = false
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object escalerasIzq {
  var property position = game.at(11, 9)
  method image() = "x64sprites/mapa/escaleras-izq.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object escalerasDer {
  var property position = game.at(12, 9)
  method image() = "x64sprites/mapa/escaleras-der.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}