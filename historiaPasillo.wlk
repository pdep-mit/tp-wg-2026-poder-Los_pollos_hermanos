import wollok.game.*
import personajes.*
import objetos.*
import mochila.*
import historiaEntrada.*
import historiaAula.*
import historiaLabo.*
import aula.*
import labo.*
import pasillo.*
import pasilloBedelia.*
import objetivos.*

// Estado 8
object objetivoIrAlAula inherits Objetivo {
  override method descripcion() = "LLEGAR AL AULA"
  override method salasPermitidas() = [salaAula]
  override method mensajeBloqueo() = "Debo llegar al aula, estoy llegando tarde"

  override method interactuarConHanz() { game.say(hanz, "¿El aula? A mi derecha, negro") }
  override method alEntrarAlAula() { wachington.objetivo(objetivoPonerseAlDia) }
}

// Estado 12
object objetivoIrAlLabo inherits ObjetivoCuestionario {
  override method descripcion() = "IR AL LABORATORIO"
  override method salasPermitidas() = [salaPasillo, salaLabo]
  override method mensajeBloqueo() = "Debo llegar al labo, estoy llegando tarde"

  override method interactuarConHanz() { game.say(hanz, "¿El labo? A mi izquierda, negro") }
  override method interactuarConLaptop() { game.say(wachington, "¡Listo! Ahora al labo") }
  override method alEntrarAlLabo() { wachington.objetivo(objetivoResolverTp) }
}

// Estados 28/29
object objetivoCargarTermo inherits Objetivo {
  override method descripcion() = "CARGAR EL TERMO"
  override method salasPermitidas() = [salaPasillo, salaPasilloBedelia]
  override method mensajeBloqueo() = "¡Tengo que cargar el termo primero!"

  override method interactuarConHanz() { game.say(hanz, "¿Necesitas ayuda con el mate, negro?") }
  override method interactuarConTaragui() {
    game.say(wachington, "¡Menos mal el agua está caliente!")
    mochila.cambiar(termoVacio, termoLleno)
    wachington.objetivo(objetivoArmarMate)
  }
}

// Estado 30
object objetivoArmarMate inherits Objetivo {
  override method descripcion() = "ARMAR EL MATE"
  override method mensajeBloqueo() = "¡Tengo que armarle el mate al Rasta!"

  override method interactuarConHanz() {
    game.say(hanz, "¿Es para el Rasta? ¡Dejame darte una mano!")
    mochila.combinar([yerba, termoLleno, mate], mateArmado)
    wachington.objetivo(objetivoEntregarMate)
  }
}
