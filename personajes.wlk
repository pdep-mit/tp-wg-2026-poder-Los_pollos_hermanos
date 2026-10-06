import wollok.game.*


object alumno {
  var property position = game.at(1, 1)
 // const mochila = []
 	var property tieneAccesoAlRepo = false 

  method image() = "x64sprites/personajes/denise/denise-frente.png"


  // Movilidad
  method puedeMoverseA(destino) =
      !game.getObjectsIn(destino).any({ objeto => objeto.esSolido() })

  method moverA(destino) {
      if (self.puedeMoverseA(destino))
        self.position(destino)
  }


  method estaAlLadoDe(otro) = self.position().distance(otro.position()) == 1 // Chequea si esta al lado de otro personaje. 
  // Uno porque asi da el calculo que hace distance si esta al lado (no sirve si esta en diagonal)

   method interactuar() {
      const cercanos = game.allVisuals().filter({ obj => self.estaAlLadoDe(obj) })
      
      if (cercanos.isEmpty()) {
          game.say(self, "Acá no hay nadie con quien hablar...")
      } else {
          cercanos.first().dialogo()
      }
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
  method image() = "x64sprites/personajes/rasta/rasta-frente.png"
  method hablar(mensaje) { game.say(self, mensaje) } 

  method dialogo(){
    if(alumno.tieneAccesoAlRepo()){
      game.say(self, "Ya tenes acceso al Repo, no pierdas tiempo y termina el TP")
    }
    else {
      game.say(self, "Dame un segundo y te habilito el TP")
      alumno.tieneAccesoAlRepo(true) //piece of shit 
      //game.say(self, "Listooo")
    }
  }



}

object companieroClase{
  var property position = game.at(4, 5)
  method image() = "x64sprites/personajes/wachington/wachington-frente.png" 
  method hablar(mensaje) { game.say(self, mensaje) } 
  method dialogo(){
    if(alumno.tieneAccesoAlRepo()){
      game.say(self, "esta complicado el TP?? jaja")
    }
    else {
      game.say(self, "Che, anda pedirle a Rasta que te de el TP")
    }
  }

}

object computadora{

}

