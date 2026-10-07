import wollok.game.*


object alumno {
  var property position = game.at(1, 1)
  method image() = "x64sprites/personajes/denise/denise-frente.png"
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


class ComputadoraDecorativa {
  const property position
  method image() = "x64sprites/mapa/pc.png"
  method esSolido() = true
  method esInteractuable() = false
}

class Mesa {
  const property position
  method image() = "x64sprites/mapa/mesa-medio.png"
  method esSolido() = true
  method esInteractuable() = false
}


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
