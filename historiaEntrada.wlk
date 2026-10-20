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

object objetivoArreglarAscensor{
    method interactuarConPortero(){
        game.say(portero, "esta roto el ascensor? pedile ayuda al tecnico")
    }
    method interactuarConTecnico() {
    game.say(tecnico, "Necesito una llave inglesa para arreglarlo.")
    wachington.objetivo(objetivoConseguirLlave)
  }
    method interactuarConAscensor(){
        game.say(wachington, "soy de sistemas, no de mecanica...")
    }
}

object objetivoConseguirLlave {
  method interactuarConPortero() {}
  method interactuarConTecnico() {}
  method interactuarConAscensor() {}
}
