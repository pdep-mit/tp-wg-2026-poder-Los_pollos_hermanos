import wollok.game.*
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

  override method interactuarConBedelia() { game.say(bedelia, "¿Yerba? No tenemos") }
  override method interactuarConKiosquera() { game.say(kiosquera, "Noo, yerba no vendemos, hijo") }
  override method interactuarConFacu() {
    game.say(facu, "¿Yerba? Obvio, te presto. Agarrala")
    wachington.objetivo(objetivoTomarYerba)
  }
}

// Estado 21
object objetivoTomarYerba inherits Objetivo {
  override method descripcion() = "TOMAR LA YERBA"
  override method mensajeBloqueo() = "¡Necesito yerba primero!"

  override method interactuarConKiosquera() { game.say(kiosquera, "Noo, yerba no vendemos, hijo") }
  override method interactuarConFacu() { game.say(facu, "¿Necesitas un termo? En bedelía te prestan, seguro") }
  override method interactuarConYerba() {
    game.say(wachington, "...")
    wachington.recoger(yerba)
    wachington.objetivo(objetivoBuscarTermo)
  }
}

// Estados 24 y 25
object objetivoComprarBizcochitos inherits Objetivo {
  override method descripcion() = "COMPRAR BIZCOCHITOS"
  override method salasPermitidas() = [salaPasilloBedelia, salaBuffet]
  override method mensajeBloqueo() = "¡No puedo volver sin el termo!"

  override method interactuarConBedelia() { game.say(bedelia, "¡Tengo hambre!") }
  override method interactuarConKiosquera() {
    game.say(kiosquera, "¿Bizcochitos? Sii, son 1500 pesos")
    wachington.guardar(bizcochitos)
    wachington.objetivo(objetivoEntregarBizcochitos)
  }
}