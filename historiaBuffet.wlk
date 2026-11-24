import wollok.game.*
import dialogos.*
import personajes.*
import objetos.*
import mochila.*
import historiaEntrada.*
import historiaBedelia.*
import pasillo.*
import pasilloBedelia.*
import buffet.*
import objetivos.*

// Estados 17 a 20
object objetivoBuscarYerba inherits Objetivo {
  override method descripcion() = "BUSCAR YERBA"
  override method salasPermitidas() = [salaPasillo, salaPasilloBedelia, salaBuffet]
  override method mensajeBloqueo() = "No creo encontrar yerba por acá…"

  override method interactuarConBedelia() { dialogo.mostrar(bedelia, "¿Yerba? No tenemos") }
  override method interactuarConKiosquera() { dialogo.mostrar(kiosquera, "Noo, yerba no vendemos, hijo") }
  override method interactuarConFacu() {
    dialogo.decir(facu, "¿Yerba? Obvio, te presto. Agarrala", "sonido/audio-facu-2.mp3")
    wachington.objetivo(objetivoTomarYerba)
  }
}

// Estado 21
object objetivoTomarYerba inherits Objetivo {
  override method descripcion() = "TOMAR LA YERBA"
  override method mensajeBloqueo() = "¡Necesito yerba primero!"

  override method interactuarConKiosquera() { dialogo.mostrar(kiosquera, "Noo, yerba no vendemos, hijo") }
  override method interactuarConFacu() { dialogo.decir(facu, "¿Necesitas un termo? En bedelía te prestan, seguro", "sonido/audio-facu-3.mp3") }
  override method interactuarConYerba() {
    dialogo.mostrar(wachington, "...")
    wachington.recoger(yerba)
    wachington.objetivo(objetivoBuscarTermo)
  }
}

// Estados 24 y 25
object objetivoComprarBizcochitos inherits Objetivo {
  override method descripcion() = "COMPRAR BIZCOCHITOS"
  override method salasPermitidas() = [salaPasilloBedelia, salaBuffet]
  override method mensajeBloqueo() = "¡No puedo volver sin el termo!"

  override method interactuarConBedelia() { dialogo.mostrar(bedelia, "¡Tengo hambre!") }
  override method interactuarConKiosquera() {
    dialogo.mostrar(kiosquera, "¿Bizcochitos? Sii, son 1500 pesos")
    wachington.guardar(bizcochitos)
    wachington.objetivo(objetivoEntregarBizcochitos)
  }
}