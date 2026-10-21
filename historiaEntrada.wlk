import wollok.game.*
import personajes.*
import entrada.*
import objetosUtiles.*
import mochila.*
import habitaciones.*
import pasillo.*


/*
//ESTADO 0: recien llegamos a la facu
object objetivoLlegarAlAula{
    method interactuarConPortero(){
        game.say(portero, "Bienvenido a la facultad")
    }
    method interactuarConTecnico(){
        game.say(tecnico, "Necesitas algo?")
    }
    method interactuarConAscensor(){
        game.say(ascensor, "Dice FUERA DE SERVICIO")
        wachington.objetivo(objetivoArreglarAscensor)
    }
    method interactuarConPapel(papel){
        game.say(wachington, "...")
    }
    method interactuarConTacho() {
        game.say(wachington, "Un tacho común y corriente.")
    }
}

//Estado 1: el objetivo ahora es arreglar el ascensor
object objetivoArreglarAscensor{
    method interactuarConPortero(){
        game.say(portero, "esta roto el ascensor? pedile ayuda al tecnico")
    }
    method interactuarConTecnico() {
    game.say(tecnico, "Necesito una llave inglesa para arreglarlo.")
    wachington.objetivo(objetivoConseguirLlave)
    }
    method interactuarConAscensor(){
        game.say(wachington, "Soy de sistemas, no de mecanica...")
    }
    method interactuarConPapel(papel){
        game.say(wachington, "...")
    }
    method interactuarConTacho() {
        game.say(wachington, "Un tacho común y corriente.")
    }
}

//Estado 2: conseguir la llaveee
object objetivoConseguirLlave {
  method interactuarConPortero() {
    game.say(portero, "Ah, si… La llave inglesa… Ayudame a limpiar un poco y te la doy…")
    wachington.objetivo(objetivoLimpiarEntrada)
  }
  method interactuarConTecnico() {
    game.say(tecnico, "Hasta que no me consigas la llave, no puedo hacer nada")
  }
  method interactuarConAscensor() {
    game.say(wachington, "Soy de Sistemas, no de mecanica...")
  }
  method interactuarConPapel(papel) {
    game.say(wachington, "...")
  }
  method interactuarConTacho() {
    game.say(wachington, "Un tacho común y corriente.")
  }
}

//Estado 3: tenemos q juntar los papeles 
object objetivoLimpiarEntrada{
    method papeles() = [suciedadPapeles1, suciedadPapeles2, suciedadPapeles3, suciedadPapeles4, suciedadPapeles5]
    method juntoTodosLosPapeles() = mochila.tieneTodos(self.papeles())

    method interactuarConPapel(papel) {
      wachington.recoger(papel)
      if (self.juntoTodosLosPapeles()) {
        game.say(wachington, "¡Listo! Ahora a tirarlos al tacho")
        wachington.objetivo(objetivoTirarBasuraAlTacho)
      }
    }
    method interactuarConTacho() {
      game.say(wachington, "Acá puedo dejar los papeles cuando termine de juntarlos")
      
    }
    method interactuarConPortero() {
      game.say(portero, "Juntame los 5 papeles del piso y te doy la llave")
    }

    method interactuarConTecnico(){
        game.say(tecnico, "Hasta que no me consigas la llave, no puedo hacer nada")
    }

    method interactuarConAscensor(){
        game.say(wachington, "Soy de Sistemas, no de mecanica...")
    }
}

//Estado 4: ya tenemos los papeles, ahora hay q tirarlos 
object objetivoTirarBasuraAlTacho{
  method interactuarConPortero() {
    game.say(portero, "Tiralos al tacho y te doy la llave")
  }
  method interactuarConTecnico() {
    game.say(tecnico, "Hasta que no me consigas la llave, no puedo hacer nada")
  }
   method interactuarConAscensor() {
    game.say(wachington, "Soy de sistemas, no de mecánica...")
  }

  method interactuarConTacho() {
    mochila.sacarTodos(objetivoLimpiarEntrada.papeles())
    game.say(wachington, "Listoooo, papeles tirados. Ahora a pedirle la llave al portero.")
    wachington.objetivo(objetivoBuscarLlave)
  }
}

//Estado 5: el portero nos tiene q dar la llave 
object objetivoBuscarLlave{
   method interactuarConPortero() {
    game.say(portero, "Que bien, un laburo menos. Como soy un hombre de palabra, tomá, aca tenes la llave inglesa")
    wachington.guardar(llaveInglesa)
    wachington.objetivo(objetivoEntregarLlave) 
  }

  method interactuarConTecnico() {
    game.say(tecnico, "Hasta que no me consigas la llave, no puedo hacer nada")
  }

  method interactuarConAscensor(){
    game.say(wachington, "Soy de sistemas, no de mecanica")
  }

  method interactuarConTacho() {
    game.say(wachington, "Ya está todo limpio")
  }
}

//Estado 6: tenemos q darle la llave al tecnico
object objetivoEntregarLlave {
   method interactuarConPortero() {
    game.say(portero, "¿Qué clase de apellido es Wachington...?")
  }
  method interactuarConTecnico() {
    game.say(tecnico, "¡De una! Enseguida ajusto los cables y el motor.")
    wachington.sacar(llaveInglesa) // Le das la llave al técnico
    wachington.objetivo(objetivoSubirAscensor) // Pasa al Estado 7
  }
  method interactuarConAscensor() {
    game.say(wachington, "Soy de sistemas, no de mecánica...")
  }
  method interactuarConTacho() {
    game.say(wachington, "Ya está limpio.")
  }
  method interactuarConPapel(papel) {}
}
*/

// VERSION 1.1: como los dialogos se repetian mucho entre cada objetivo, creamos una clase Objetivos con los dialogos default.

class Objetivo {
  method descripcion() 
  // dialogos que mas se repiten :
  method interactuarConPortero() { game.say(portero, "Bienvenido a la facultad") }
  method interactuarConTecnico() { game.say(tecnico, "Hasta que no me consigas la llave, no puedo hacer nada") }
  method interactuarConAscensor() { game.say(wachington, "Soy de sistemas, no de mecánica...") } //TODO: modificar si del estaod 0 no sabe todavia q tiene q buscarle la llave inglesa, q siga diciendo fuera de servivio top 10 mejores explicaciones 
  method interactuarConPapel(papel) { game.say(wachington, "Que gente sucia tira la basura en cualquier lado") }
  method interactuarConTacho() { game.say(wachington, "Un tacho común y corriente") }
}

// Estado 0: Recién llegamos y nuestro obejtivo es llegar al aula
object objetivoLlegarAlAula inherits Objetivo {
  override method descripcion() = "LLEGAR AL AULA"
  override method interactuarConTecnico() { 
    game.say(tecnico, "¿Necesitas algo?") 
  }
  override method interactuarConAscensor() {
    game.say(ascensor, "Dice FUERA DE SERVICIO")
    wachington.objetivo(objetivoArreglarAscensor)
  }
}

//Estado 1: necesitamos arreglar el ascensor 
object objetivoArreglarAscensor inherits Objetivo{
  override method descripcion()="ARREGLAR EL ASCENSOR"
  override method interactuarConPortero(){
      game.say(portero, "¿Está roto el ascensor? Pedile ayuda al técnico.")
  }
  override method interactuarConTecnico() {
    game.say(tecnico, "Necesito una llave inglesa para arreglarlo")
    wachington.objetivo(objetivoConseguirLlave)
  }
}

//Estado 2: hay q darle la llave al tecnico
object objetivoConseguirLlave inherits Objetivo {
  override method descripcion() = "CONSEGUIR UNA LLAVE INGLESA"
  override method interactuarConPortero() {
    game.say(portero, "Ah, sí… La llave inglesa… Ayudame a limpiar un poco y te la doy…")
    wachington.objetivo(objetivoLimpiarEntrada)
  }
}

//Estado 3 : limpiamos el piso para q nos den la llave 
object objetivoLimpiarEntrada inherits Objetivo{
  override method descripcion() = "LIMPIAR LA ENTRADA"

  method papeles() = [suciedadPapeles1, suciedadPapeles2, suciedadPapeles3, suciedadPapeles4, suciedadPapeles5]
  method juntoTodosLosPapeles() = mochila.tieneTodos(self.papeles())

  override method interactuarConPortero() {
    game.say(portero, "Juntame los 5 papeles del piso y te doy la llave")
  }

  override method interactuarConTacho() {
    game.say(wachington, "Acá puedo dejar los papeles cuando termine de juntarlos")
  }
  override method interactuarConPapel(papel) {
    wachington.recoger(papel)
    if (self.juntoTodosLosPapeles()) {
      game.say(wachington, "Listooo, ahora a tirarlos al tacho")
      wachington.objetivo(objetivoTirarBasuraAlTacho)
    } 
  }
}

//Estado 4 
object objetivoTirarBasuraAlTacho inherits Objetivo{
  override method descripcion()= "BUSCAR LA LLAVE INGLESA"

    override method interactuarConPortero() {
    game.say(portero, "Como soy un hombre de palabra, tomá, aca tenes la llave inglesa.")
    wachington.guardar(llaveInglesa)
    wachington.objetivo(objetivoEntregarLlave)
  }
}

//Estado 5 
object objetivoEntregarLlave{

}



