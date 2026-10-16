import wollok.game.*
import objetosUtiles.*
import objetosDecorados.*


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

object hanz {
  var property position = game.at(5, 4)
  method image() = "x64sprites/personajes/hanz/hanz-frente.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}
object conserje {
  var property position = game.at(9, 1)
  method image() = "x64sprites/personajes/conserje/conserje-izq.png"
  method esSolido() = true
  method esInteractuable() = true

  // method hablar(mensaje) { game.say(self, mensaje) } 

  // method interactuar() { self.hablar(tp.estado().mensajeCompa()) }
}