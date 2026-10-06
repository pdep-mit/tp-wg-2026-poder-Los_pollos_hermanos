import wollok.game.*


object alumno {
  var property position = game.at(1, 1)

  method image() = "x64sprites/personajes/denise/denise-frente.png"

  method esSolido() = true

  const mochila = []

  method estaAlLadoDe(otro) = self.position().distance(otro.position()) == 1 // Chequea si esta al lado de otro personaje. 
  // Uno porque asi da el calculo que hace distance si esta al lado (no sirve si esta en diagonal)

   method interactuar() {
      const cercanos = game.allVisuals().filter({ obj => self.estaAlLadoDe(obj) }) //revisar
      
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

  method hablar(mensaje) { game.say(self, mensaje) } 

  method interactuar() { tp.estado().contestaRasta() }

}


object companieroClase {
  var property position = game.at(4, 5)

  method image() = "x64sprites/personajes/wachington/wachington-frente.png"

  method esSolido() = true // Para que el personaje pueda chocar

  method hablar(mensaje) { game.say(self, mensaje) } 

  method interactuar() { tp.estado().contestaCompa() }

}


object computadora {
  var property position = game.at(2, 9)

  method image() = "x64sprites/mapa/pc.png"

  method esSolido() = true
  
  method hablar(mensaje) { game.say(self, mensaje) }

  method interactuar() { tp.estado().contestaCompu() }

}


object tp {
  var property estado = sinTp
}


object sinTp {
  method contestaRasta() {
    rasta.hablar("Dame un segundo y te habilito el TP")
    tp.estado(tpIncompleto)
    alumno.guardar(tpIncompleto)
  }

  method contestaCompa() {
    companieroClase.hablar("Anda a pedirle a rasta que te de el TP")
  }

  method contestaCompu() {
    computadora.hablar("??")
  }
}


object tpIncompleto {
  method contestaRasta() {
    rasta.hablar("Ya tenés acceso al repo. No pierdas tiempo y terminá el TP")
  }

    method contestaCompa() {
    companieroClase.hablar("Esta complicado el TP?? jaja")
  }

    method contestaCompu() {
    computadora.hablar("Completado")
    tp.estado(tpCompleto)
  }
}


object tpCompleto {
    method contestaRasta() {
    rasta.hablar("Listooo")
  }

    method contestaCompa() {
    companieroClase.hablar("Entregalo")
  }

    method contestaCompu() {
    computadora.hablar("...")
  }
}
