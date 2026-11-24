import wollok.game.*
import personajes.*
import entrada.*
import objetos.*
import mochila.*
import habitaciones.*
import pasillo.*
import objetivos.*
import historiaPasillo.*

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
    game.say(tecnico, "¿Necesitas ayuda para arreglar el ascensor? Para eso necesito una llave inglesa")
    wachington.objetivo(objetivoConseguirLlave)
  }
}

//Estado 2: hay q darle la llave al tecnico
object objetivoConseguirLlave inherits Objetivo {
  override method descripcion() = "CONSEGUIR UNA LLAVE INGLESA"
  override method interactuarConPortero() {
    game.say(portero, "Ah, sí… La llave inglesa… Ayudame a limpiar un poco y te la doy")
    wachington.objetivo(objetivoLimpiarEntrada)
  }
}

//Estado 3 : limpiamos el piso para q nos den la llave 
object objetivoLimpiarEntrada inherits Objetivo{
  override method descripcion() = "LIMPIAR LA ENTRADA"

  method papeles() = papelesDelPiso.todos()
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

//Estado 4:
object objetivoTirarBasuraAlTacho inherits Objetivo{
   override method descripcion() = "TIRAR LOS PAPELES"
  override method interactuarConPortero() {
    game.say(portero, "Tiralos al tacho y te doy la llave...")
  }

  override method interactuarConTacho() {
    mochila.sacarTodos(papelesDelPiso.todos())
    game.say(wachington, "Ya esta, voy a pedirle la llave al portero")
    wachington.objetivo(objetivoBuscarLlave)
  }
}


//Estado 5 
object objetivoBuscarLlave inherits Objetivo{
  override method descripcion()= "BUSCAR LA LLAVE INGLESA"

    override method interactuarConPortero() {
    game.say(portero, "Como soy un hombre de palabra, tomá, aca tenes la llave inglesa")
    wachington.guardar(llaveInglesa)
    wachington.objetivo(objetivoEntregarLlave)
  }
}

//Estado 6 
object objetivoEntregarLlave inherits Objetivo{
 override method descripcion() = "ENTREGAR LA LLAVE INGLESA"
  override method interactuarConPortero() {
    game.say(portero, "¿Qué clase de apellido es Wachington...?")
  }
  override method interactuarConTecnico() {
    game.say(tecnico, "Joya, enseguida lo arreglo")
    wachington.sacar(llaveInglesa)
    wachington.objetivo(objetivoSubirAscensor)
  }
}

//Estado 7: 
object objetivoSubirAscensor inherits Objetivo{
  override method descripcion() = "SUBIR POR EL ASCENSOR"

  override method interactuarConPortero() {
    game.say(portero, "¿Qué clase de apellido es Wachington...?")
  }

  override method interactuarConTecnico() {
    game.say(tecnico, "Ahi lo arregle, ya podés subir al 4to piso.")
  }
  override method interactuarConAscensor() {
    wachington.objetivo(objetivoIrAlAula)
    habitacionActual.irA(salaPasillo, game.at(14, 0))
  }

}