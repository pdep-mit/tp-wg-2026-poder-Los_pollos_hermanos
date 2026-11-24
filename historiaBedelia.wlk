import wollok.game.*
import dialogos.*
import personajes.*
import objetos.*
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

  override method interactuarConKiosquera() { dialogo.decir(kiosquera, "Noo, termos no vendemos, hijo", "sonido/kiosquera-3.mp3") }
  override method interactuarConFacu() { dialogo.decir(facu, "¿Necesitas un termo? En bedelía te prestan, seguro", "sonido/audio-facu-3.mp3") }
  override method interactuarConBedelia() {
    dialogo.mostrar(bedelia, "¿Querés un termo? Traeme unos bizcochitos y te lo doy")
    wachington.objetivo(objetivoComprarBizcochitos)
  }
}

// Estados 26 y 27
object objetivoEntregarBizcochitos inherits Objetivo {
  override method descripcion() = "ENTREGAR BIZCOCHITOS"
  override method salasPermitidas() = [salaPasilloBedelia, salaBuffet]
  override method mensajeBloqueo() = "¡No puedo volver sin el termo!"

  override method interactuarConKiosquera() { dialogo.decir(kiosquera, "¿Alguna vez te dijeron que sos medio denso?", "sonido/kiosquera-5.mp3") }
  override method interactuarConBedelia() {
    dialogo.mostrar(bedelia, "¡Gracias! No te olvides de devolverlo después")
    mochila.cambiar(bizcochitos, termoVacio)
    wachington.objetivo(objetivoCargarTermo)
  }
}