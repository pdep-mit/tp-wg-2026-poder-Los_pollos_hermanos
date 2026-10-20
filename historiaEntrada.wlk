import wollok.game.*
import personajes.*
import entrada.*
import objetosUtiles.*

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
}

//Estado 3:
object objetivoLimpiarEntrada{
    // var papelesJuntados = 0

    method interactuarConPortero() {
      game.say(portero, "Juntame los 5 papeles del piso y te doy la llave")
    }

    method interactuarConTecnico(){
        game.say(tecnico, "Hasta que no me consigas la llvae, no puedo hacer nada")
    }

    method interactuarConAscensor(){
        game.say(wachington, "Soy de Sistemas, no de mecanica...")
    }

}


/* OPINION DE UN EXPERTO: heredar! 

class Objetivo {
  method descripcion()

  // respuestas por defecto: solo se redefine lo que cambia en cada estado
  method interactuarConPortero() { game.say(portero, "...") }
  method interactuarConTecnico() { game.say(tecnico, "...") }
  method interactuarConAscensor() { game.say(wachington, "Soy de sistemas, no de mecánica...") }
  method interactuarConBasura() { game.say(wachington, "...") }
  method interactuarConTacho() { game.say(wachington, "...") }
}

object objetivoConseguirLlave inherits Objetivo {
  override method descripcion() = "CONSEGUIR UNA LLAVE INGLESA"

  override method interactuarConPortero() {
    game.say(portero, "Ah, sí… La llave inglesa… Ayudame a limpiar un poco y te la doy…")
    wachington.pasarA(objetivoLimpiarEntrada)
  }
  override method interactuarConTecnico() {
    game.say(tecnico, "Hasta que no me consigas la llave, no puedo hacer nada")
  }
  // ascensor, basura y tacho: heredan el comportamiento por defecto
}

object portero inherits Interactuable {
  var property position = game.at(2, 5)
  method image() = "x64sprites/personajes/portero/portero-der.png"
  override method interactuar() { wachington.objetivo().interactuarConPortero() }
}



*/
