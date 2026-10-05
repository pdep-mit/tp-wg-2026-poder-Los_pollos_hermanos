import wollok.game.*


object alumno {
  var property position = game.at(1, 1)
 // const mochila = []
 	var property tieneAccesoAlRepo = false 

  method image() = "alumno.png"

  method estaAlLadoDe(otro) = self.position().distance(otro.position()) == 1 // Chequea si esta al lado de otro personaje. 
  // Uno porque asi da el calculo que hace distance si esta al lado (no sirve si esta en diagonal)

  method hablarCon(personaje) {
    if (self.estaAlLadoDe(personaje))
      game.say(personaje, personaje.dialogo())
    else
      game.say(self, "Acá no hay nadie con quien hablar...")
  }

  method hablar(mensaje) { game.say(self, mensaje) } //ahora habla (supuestamente)
/*
  method guardar(objeto) { mochila.add(objeto) }

  method tiene(objeto) = mochila.contains(objeto) 

  method mochilaVacia() = mochila.isEmpty()

  method validarQueTiene(objeto) {
    if (!self.tiene(objeto))
      self.error("No tenés ese objeto en la mochila")
  }

  //Primero chequea si la mochila esta vacia y despues consulta. Lo pasa como BLOQUE si esta condición no se cumple
  //Falta el metodo que reciba el bloque y consulte a la mochila(lista)
  method consultarMochila(consulta) {
    if(self.mochilaVacia()) 
      self.hablar("No tengo nada en la mochi")
    else 
      self.hablar(consulta.apply())
    }
*/

}


object rasta {
  var property position = game.at(0,0)
  method image() = "charizard.png"
  method hablar(mensaje) { game.say(self, mensaje) } 

  m



}

object companieroClase{

  method hablar(mensaje) { game.say(self, mensaje) } 

}

object computadora{

}
