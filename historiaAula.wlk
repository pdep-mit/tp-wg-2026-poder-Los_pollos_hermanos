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
    dialogo.decir(matos, "En el Labo vas a poder hacer el TP ¡pero respondé el cuestionario primero!", "sonido/matos-3.mp3")
  }
}

// Estado 9
object objetivoPonerseAlDia inherits Objetivo {
  override method descripcion() = "PONERSE AL DÍA"
  override method mensajeBloqueo() = "¡Tengo que ponerme al día primero!"

  override method interactuarConMatos() {
    dialogo.decir(matos, "Yo ya dí la actividad… Si querés acceder al repositorio del TP, respondé bien el cuestionario…", "sonido/matos-2.mp3")
    wachington.objetivo(objetivoConseguirRespuestas)
  }
  override method interactuarConAgus() { dialogo.decir(agusSilla, "¡Consultale a la profe que hay que hacer!", "sonido/agus-3.mp3") }
  override method interactuarConDenise() { dialogo.mostrar(deniseSilla, "¡Ay! ¿Recién llegas? ¡Habla con Matos!") }
  override method interactuarConJulian() { dialogo.decir(julianSilla, "Estas tarde wachin, anda a hablar con la profe", "sonido/julian-1.mp3") }
}

// Estado 10: hay que hablar con los tres
object objetivoConseguirRespuestas inherits ObjetivoCuestionario {
  const hablaron = #{}

  override method descripcion() = "CONSEGUIR LAS RESPUESTAS"

  override method interactuarConLaptop() { dialogo.mostrar(wachington, "Quizá los chicos me puedan decir las respuestas…") }
  override method interactuarConAgus() { self.escuchar(agusSilla, "¿El cuestionario? La primer pregunta es la B", "sonido/agus-2.mp3") }
  override method interactuarConDenise() { self.escuchar(deniseSilla, "¿El cuestionario? La última pregunta es la D", null) }
  override method interactuarConJulian() { self.escuchar(julianSilla, "¿El cuestionario? La segunda pregunta es la A", "sonido/julian-2.mp3") }

  method escuchar(chico, respuesta, audio) {
    if (audio == null) {
      dialogo.mostrar(chico, respuesta)
    } else {
      dialogo.decir(chico, respuesta, audio)
    }
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
    dialogo.mostrar(wachington, "¡Listo! Ahora al labo")
    wachington.objetivo(objetivoIrAlLabo)
  }
}

// Estados 14 a 16
object objetivoEncontrarMate inherits Objetivo {
  override method descripcion() = "ENCONTRAR UN MATE"
  override method salasPermitidas() = [salaPasillo, salaAula]
  override method mensajeBloqueo() = "No creo encontrar un mate por acá…"

  override method interactuarConMate() {
    dialogo.mostrar(wachington, "¡Un mate! ¡Eso quiero!")
    wachington.recoger(mate)
    wachington.objetivo(objetivoBuscarYerba)
  }
}