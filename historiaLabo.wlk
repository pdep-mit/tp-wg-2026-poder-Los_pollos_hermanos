import wollok.game.*
import personajes.*
import objetos.*
import mochila.*
import historiaEntrada.*
import historiaAula.*
import labo.*
import objetivos.*

// Estado 13
object objetivoResolverTp inherits Objetivo {
  override method descripcion() = "RESOLVER EL TP"
  override method mensajeBloqueo() = "¡Tengo que resolver el TP primero!"

  override method interactuarConMati() {
    game.say(mati, "Uhh… Estas re tarde, se va a enojar el Rasta ¡Un mate lo calmaría!")
    wachington.objetivo(objetivoEncontrarMate)
  }
}

// Estado 31
object objetivoEntregarMate inherits Objetivo {
  override method descripcion() = "ENTREGAR EL MATE ARMADO"
  override method salasPermitidas() = [salaLabo]
  override method mensajeBloqueo() = "¡Tengo que llevarle el mate al Rasta!"

  override method interactuarConHanz() { game.say(hanz, "Suerte con el TP, negro") }
  override method interactuarConMati() { game.say(mati, "¡Llevale el mate al Rasta!") }
  override method interactuarConRasta() {
    game.say(rasta, "Hmmm… Te la dejo pasar solo porque no está lavado… Tomá la clave de acceso…")
    mochila.cambiar(mateArmado, claveDeAcceso)
    wachington.objetivo(objetivoHacerTp)
  }
}

// Estados 32 a 35 comparten el bloqueo y el reto de Rasta
class ObjetivoTpEnCurso inherits Objetivo {
  override method mensajeBloqueo() = "Tengo que completar el TP"
  override method interactuarConRasta() { game.say(rasta, "¡No te veo trabajando, Wachington!") }
}

// Estado 32
object objetivoHacerTp inherits ObjetivoTpEnCurso {
  override method descripcion() = "HACER EL TP"
  override method interactuarConRasta() { game.say(rasta, "Tenés habilitado el TP ¡Y que sea rápido!") }
  override method interactuarConMati() { game.say(mati, "Menos mal que se calmó… Ya estaba hablando de boxear gente de nuevo") }
  override method interactuarConPcLabo() {
    game.say(wachington, "No tengo ni idea de como encarar esto…")
    wachington.objetivo(objetivoBuscarAyuda)
  }
}

// Estado 33
object objetivoBuscarAyuda inherits ObjetivoTpEnCurso {
  override method descripcion() = "BUSCAR AYUDA"
  override method interactuarConPcLabo() { game.say(wachington, "Mati debe saber que hacer…") }
  override method interactuarConMati() {
    game.say(mati, "En 'wollok.org' está toda la guía de lenguaje… ¡Ayudate con eso!")
    wachington.objetivo(objetivoRealizarTp)
  }
}

// Estado 34
object objetivoRealizarTp inherits ObjetivoTpEnCurso {
  override method descripcion() = "REALIZAR TP"
  override method interactuarConMati() { game.say(mati, "¡Apurate!") }
  override method interactuarConPcLabo() {
    game.say(wachington, "¡Ahora sí! ¡Justo a tiempo!")
    wachington.objetivo(objetivoNotificarRasta)
  }
}

// Estado 35
object objetivoNotificarRasta inherits ObjetivoTpEnCurso {
  override method descripcion() = "NOTIFICAR AL RASTA"
  override method mensajeBloqueo() = "Tengo que avisarle al Rasta que terminé"

  override method interactuarConMati() { game.say(mati, "¿Terminaste?") }
  override method interactuarConPcLabo() { game.say(wachington, "...") }
  override method interactuarConRasta() {
    game.say(wachington, "¡Ya está! ¡Aprobame RASTA!")
    wachington.objetivo(objetivoJuegoTerminado)
    game.schedule(3000, { game.stop() })   // provisorio, después pueden poner una pantalla final
  }
}

object objetivoJuegoTerminado inherits Objetivo {
  override method descripcion() = "JUEGO TERMINADO"
}