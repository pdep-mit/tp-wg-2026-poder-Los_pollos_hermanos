import wollok.game.*
import personajes.*
import objetosUtiles.*
import mochila.*
import historiaEntrada.*
import historiaBuffet.*
import historiaPasillo.*
import pasilloBedelia.*
import buffet.*
import objetivos.*

// Estados 22 y 23
object objetivoBuscarTermo inherits Objetivo {
  override method descripcion() = "BUSCAR UN TERMO"
  override method salasPermitidas() = [salaPasilloBedelia, salaBuffet]
  override method mensajeBloqueo() = "¡No puedo volver sin el termo!"

  override method interactuarConKiosquera() { game.say(kiosquera, "Noo, termos no vendemos, hijo") }
  override method interactuarConFacu() { game.say(facu, "¿Necesitas un termo? En bedelía te prestan, seguro") }
  override method interactuarConBedelia() {
    game.say(bedelia, "¿Querés un termo? Traeme unos bizcochitos y te lo doy")
    wachington.objetivo(objetivoComprarBizcochitos)
  }
}

// Estados 26 y 27
object objetivoEntregarBizcochitos inherits Objetivo {
  override method descripcion() = "ENTREGAR BIZCOCHITOS"
  override method salasPermitidas() = [salaPasilloBedelia, salaBuffet]
  override method mensajeBloqueo() = "¡No puedo volver sin el termo!"

  override method interactuarConKiosquera() { game.say(kiosquera, "¿Alguna vez te dijeron que sos medio denso?") }
  override method interactuarConBedelia() {
    game.say(bedelia, "¡Gracias! No te olvides de devolverlo después")
    mochila.cambiar(bizcochitos, termoVacio)
    wachington.objetivo(objetivoCargarTermo)
  }
}