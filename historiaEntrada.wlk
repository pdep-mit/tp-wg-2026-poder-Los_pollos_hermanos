import wollok.game.*
import personajes.*
import entrada.*
import objetosUtiles.*
import mochila.*
import habitaciones.*
import pasillo.*

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

object objetivoEntregarLlave {
  
}
