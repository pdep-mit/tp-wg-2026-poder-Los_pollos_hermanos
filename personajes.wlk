import wollok.game.*


object alumno {
  var property position = game.at(1, 1)
  const mochila = []

  method image() = "alumno.png"

  method hablar(mensaje) { game.say(self, mensaje) } //ahora habla (supuestamente)

  method guardar(objeto) { mochila.add(objeto) }

  method tiene(objeto) = mochila.contains(objeto) 

  method mochilaVacia() = mochila.isEmpty()

  method validarQueTiene(objeto) {
    if (!self.tiene(objeto))
      self.error("No tenés ese objeto en la mochila")
  }


  //Primero chequea si la mochila esta vacia y despues consulta. Lo pasa como BLOQUE si esta condición no se cumple
  method consultarMochila(consulta) {
    if(self.mochilaVacia()) 
      self.hablar("No tengo nada en la mochi")
    else 
      self.hablar(consulta.apply())
    
  }


}

  




		
	
  
object rasta {
  var property position = game.at(0,0)
  method image() = "charizard.png"

}
/*
object companieroClase{

}

object computadora{

}*/
