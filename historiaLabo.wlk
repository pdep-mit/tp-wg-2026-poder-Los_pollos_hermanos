import wollok.game.*
import personajes.*
import objetos.*
import mochila.*
import historiaEntrada.*
import historiaAula.*
import labo.*
import objetivos.*
import pantallas.*
import dialogos.*

// Estado 13
object objetivoResolverTp inherits Objetivo {
  override method descripcion() = "RESOLVER EL TP"
  override method mensajeBloqueo() = "¡Tengo que resolver el TP primero!"

  override method interactuarConMati() {
    dialogo.decir(mati, "Uhh… Estas re tarde, se va a enojar el Rasta ¡Un mate lo calmaría!", "sonido/mati-7.mp3")
    wachington.objetivo(objetivoEncontrarMate)
  }
}

// Estado 31
object objetivoEntregarMate inherits Objetivo {
  override method descripcion() = "ENTREGAR EL MATE ARMADO"
  override method salasPermitidas() = [salaLabo]
  override method mensajeBloqueo() = "¡Tengo que llevarle el mate al Rasta!"

  override method interactuarConHanz() { dialogo.decir(hanz, "Suerte con el TP, negro", "sonido/hanz-4.mp3") }
  override method interactuarConMati() { dialogo.decir(mati, "¡Llevale el mate al Rasta!", "sonido/mati-2.mp3") }
  override method interactuarConRasta() {
    dialogo.decir(rasta, "Hmmm… Te la dejo pasar solo porque no está lavado… Tomá la clave de acceso…", "sonido/rasta2.mp3")
    mochila.cambiar(mateArmado, claveDeAcceso)
    wachington.objetivo(objetivoHacerTp)
  }
}

// Estados 32 a 35 comparten el bloqueo y el reto de Rasta
class ObjetivoTpEnCurso inherits Objetivo {
  override method mensajeBloqueo() = "Tengo que completar el TP"
  override method interactuarConRasta() { dialogo.decir(rasta, "¡No te veo trabajando, Wachington!", "sonido/rasta4.mp3") }
}

// Estado 32
object objetivoHacerTp inherits ObjetivoTpEnCurso {
  override method descripcion() = "HACER EL TP"
  override method interactuarConRasta() { dialogo.decir(rasta, "Tenés habilitado el TP ¡Y que sea rápido!", "sonido/rasta3.mp3") }
  override method interactuarConMati() { dialogo.decir(mati, "Menos mal que se calmó… Ya estaba hablando de boxear gente de nuevo", "sonido/mati-5.mp3") }
  override method interactuarConPcLabo() {
    dialogo.mostrar(wachington, "No tengo ni idea de como encarar esto…")
    wachington.objetivo(objetivoBuscarAyuda)
  }
}

// Estado 33
object objetivoBuscarAyuda inherits ObjetivoTpEnCurso {
  override method descripcion() = "BUSCAR AYUDA"
  override method interactuarConPcLabo() { dialogo.mostrar(wachington, "Mati debe saber que hacer…") }
  override method interactuarConMati() {
    dialogo.decir(mati, "En 'wollok.org' está toda la guía de lenguaje… ¡Ayudate con eso!", "sonido/mati-4.mp3")
    wachington.objetivo(objetivoRealizarTp)
  }
}

// Estado 34
object objetivoRealizarTp inherits ObjetivoTpEnCurso {
  override method descripcion() = "REALIZAR TP"
  override method interactuarConMati() { dialogo.decir(mati, "¡Apurate!", "sonido/mati-3.mp3") }
  override method interactuarConPcLabo() {
    dialogo.mostrar(wachington, "¡Ahora sí! ¡Justo a tiempo!")
    wachington.objetivo(objetivoNotificarRasta)
  }
}

// Estado 35
object objetivoNotificarRasta inherits ObjetivoTpEnCurso {
  override method descripcion() = "NOTIFICAR AL RASTA"
  override method mensajeBloqueo() = "Tengo que avisarle al Rasta que terminé"

  override method interactuarConMati() { dialogo.decir(mati, "¿Terminaste?", "sonido/mati-1.mp3") }
  override method interactuarConPcLabo() { dialogo.mostrar(wachington, "...") }
  override method interactuarConRasta() {
    dialogo.mostrar(wachington, "¡Ya está! ¡Aprobame RASTA!")
    wachington.objetivo(objetivoJuegoTerminado)
    game.schedule(3000, { pantallaFinal.mostrar() })
  }
}

object objetivoJuegoTerminado inherits Objetivo {
  override method descripcion() = "JUEGO TERMINADO"
}