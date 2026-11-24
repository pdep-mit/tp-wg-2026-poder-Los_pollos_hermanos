import wollok.game.*
import personajes.*
import dialogos.*

// para los diálogos default
class Objetivo {
  method descripcion()

  method interactuarConPortero() { game.say(portero, "Bienvenido a la facultad") }
  method interactuarConTecnico() { game.say(tecnico, "Hasta que no me consigas la llave, no puedo hacer nada") }
  method interactuarConAscensor() { game.say(wachington, "Soy de sistemas, no de mecánica...") }
  method interactuarConPapel(papel) { game.say(wachington, "Que gente sucia tira la basura en cualquier lado") }
  method interactuarConTacho() { game.say(wachington, "Un tacho común y corriente") }
  
  // para las puertas
  method salasPermitidas() = []
  method mensajeBloqueo() = "Todavía no puedo ir para ahí"
  // la sala avisa a donde se entro (ver Sala.recibir)
  method alEntrarAlAula() {}
  method alEntrarAlLabo() {}

  method pasarPor(puerta) {
    const sala = puerta.destino()
    if (self.salasPermitidas().contains(sala)) {
      puerta.pasar()
      sala.recibir(self)
    } else {
      game.say(wachington, self.mensajeBloqueo())
    }
  }

  method interactuarConHanz() { game.say(hanz, "¿Ya cursaste operativos? La que te espera…") }
  method interactuarConTaragui() { game.say(wachington, "No encuentro una forma de que esto me sea util") }

  method interactuarConMatos() { dialogo.decir(matos, "¿Sabías que algunos de los personajes de este juego son reales?", "sonido/matos1.mp3")}
  method interactuarConAgus() { game.say(agusSilla, "¡El TP de hoy es una papa!") }
  method interactuarConDenise() { game.say(deniseSilla, "¡El TP de hoy es super estresante!") }
  method interactuarConJulian() { game.say(julianSilla, "¡¿Había TP hoy?!") }
  method interactuarConMate() { game.say(wachington, "¿Un mate? ¿Para qué lo quiero?") }
  method interactuarConLaptop() { game.say(wachington, "...") }

  method interactuarConRasta() { dialogo.decir(rasta, "¿Te parece llegar a esta hora?", "sonido/rasta1.mp3")}
  method interactuarConMati() { game.say(mati, "¿Sabes hacer mate al menos?") }
  method interactuarConPcLabo() { game.say(wachington, "Si el Rasta no me habilita el TP, no voy a poder hacerlo…") }

  method interactuarConBedelia() { game.say(bedelia, "...") }

  method interactuarConKiosquera() { game.say(kiosquera, "Noo, eso no lo vendemos, hijo") }
  method interactuarConFacu() { game.say(facu, "Si necesitas ayuda con tu mate… ¡Pedile a Hanz!") }
  method interactuarConYerba() { game.say(wachington, "Es de Facu, debería pedir permiso primero…") }
}