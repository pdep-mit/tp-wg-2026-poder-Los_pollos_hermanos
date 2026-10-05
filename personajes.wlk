import wollok.game.*


object alumno {
  var property position = game.at(1, 1)
  const mochila = []

  method image() = "alumno.png"

  method guardar(objeto) { mochila.add(objeto) }

  method tiene(objeto) = mochila.contains(objeto) //

  method mochilaVacia() = mochila.isEmpty()

  method validarQueTiene(objeto) {
    if (!self.tiene(objeto))
      self.error("No tenés ese objeto en la mochila")
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
