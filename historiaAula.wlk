import wollok.game.*
import personajes.*
import objetos.*
import mochila.*
import historiaEntrada.*
import historiaPasillo.*
import historiaBuffet.*
import aula.*
import pasillo.*
import objetivos.*
import dialogos.*

// Matos y el bloqueo de salida son iguales en los estados 10, 11 y 12
class ObjetivoCuestionario inherits Objetivo {
  override method mensajeBloqueo() = "¡Tengo que responder el cuestionario primero!"
  override method interactuarConMatos() {
    dialogo.decir(matos, "En el Labo vas a poder hacer el TP ¡pero respondé el cuestionario primero!", "sonido/matos3.mp3")
  }
}

// Estado 9
object objetivoPonerseAlDia inherits Objetivo {
  override method descripcion() = "PONERSE AL DÍA"
  override method mensajeBloqueo() = "¡Tengo que ponerme al día primero!"

  override method interactuarConMatos() {
    dialogo.decir(matos, "Yo ya dí la actividad… Si querés acceder al repositorio del TP, respondé bien el cuestionario…", "sonido/matos2.mp3")
    wachington.objetivo(objetivoConseguirRespuestas)
  }
  override method interactuarConAgus() { game.say(agusSilla, "¡Consultale a la profe que hay que hacer!") }
  override method interactuarConDenise() { game.say(deniseSilla, "¡Ay! ¿Recién llegas? ¡Habla con Matos!") }
  override method interactuarConJulian() { game.say(julianSilla, "Estas tarde wachin, anda a hablar con la profe") }
}

// Estado 10: hay que hablar con los tres
object objetivoConseguirRespuestas inherits ObjetivoCuestionario {
  const hablaron = #{}

  override method descripcion() = "CONSEGUIR LAS RESPUESTAS"

  override method interactuarConLaptop() { game.say(wachington, "Quizá los chicos me puedan decir las respuestas…") }
  override method interactuarConAgus() { self.escuchar(agusSilla, "¿El cuestionario? La primer pregunta es la B") }
  override method interactuarConDenise() { self.escuchar(deniseSilla, "¿El cuestionario? La última pregunta es la D") }
  override method interactuarConJulian() { self.escuchar(julianSilla, "¿El cuestionario? La segunda pregunta es la A") }

  method escuchar(chico, respuesta) {
    game.say(chico, respuesta)
    hablaron.add(chico)
    if (hablaron.size() == 3) {
      wachington.objetivo(objetivoResponderCuestionario)
    }
  }
}

// Estado 11
object objetivoResponderCuestionario inherits ObjetivoCuestionario {
  override method descripcion() = "RESPONDER EL CUESTIONARIO"

  override method interactuarConLaptop() {
    game.say(wachington, "¡Listo! Ahora al labo")
    wachington.objetivo(objetivoIrAlLabo)
  }
}

// Estados 14 a 16
object objetivoEncontrarMate inherits Objetivo {
  override method descripcion() = "ENCONTRAR UN MATE"
  override method salasPermitidas() = [salaPasillo, salaAula]
  override method mensajeBloqueo() = "No creo encontrar un mate por acá…"

  override method interactuarConMate() {
    game.say(wachington, "¡Un mate! ¡Eso quiero!")
    wachington.recoger(mate)
    wachington.objetivo(objetivoBuscarYerba)
  }
}