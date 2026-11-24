import wollok.game.*
import personajes.*
import dialogos.*

// para los diálogos default
class Objetivo {
  method descripcion()

  method interactuarConPortero() { dialogo.mostrar(portero, "Bienvenido a la facultad") }
  method interactuarConTecnico() { dialogo.mostrar(tecnico, "Hasta que no me consigas la llave, no puedo hacer nada") }
  method interactuarConAscensor() { dialogo.mostrar(wachington, "Soy de sistemas, no de mecánica...") }
  method interactuarConPapel(papel) { dialogo.mostrar(wachington, "Que gente sucia tira la basura en cualquier lado") }
  method interactuarConTacho() { dialogo.mostrar(wachington, "Un tacho común y corriente") }
  
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
      dialogo.mostrar(wachington, self.mensajeBloqueo())
    }
  }

  method interactuarConHanz() { dialogo.mostrar(hanz, "¿Ya cursaste operativos? La que te espera…") }
  method interactuarConTaragui() { dialogo.mostrar(wachington, "No encuentro una forma de que esto me sea util") }

  method interactuarConMatos() { dialogo.decir(matos, "¿Sabías que algunos de los personajes de este juego son reales?", "sonido/matos1.mp3")}
  method interactuarConAgus() { dialogo.mostrar(agusSilla, "¡El TP de hoy es una papa!") }
  method interactuarConDenise() { dialogo.mostrar(deniseSilla, "¡El TP de hoy es super estresante!") }
  method interactuarConJulian() { dialogo.mostrar(julianSilla, "¡¿Había TP hoy?!") }
  method interactuarConMate() { dialogo.mostrar(wachington, "¿Un mate? ¿Para qué lo quiero?") }
  method interactuarConLaptop() { dialogo.mostrar(wachington, "...") }

  method interactuarConRasta() { dialogo.decir(rasta, "¿Te parece llegar a esta hora?", "sonido/rasta1.mp3")}
  method interactuarConMati() { dialogo.mostrar(mati, "¿Sabes hacer mate al menos?") }
  method interactuarConPcLabo() { dialogo.mostrar(wachington, "Si el Rasta no me habilita el TP, no voy a poder hacerlo…") }

  method interactuarConBedelia() { dialogo.mostrar(bedelia, "...") }

  method interactuarConKiosquera() { dialogo.mostrar(kiosquera, "Noo, eso no lo vendemos, hijo") }
  method interactuarConFacu() { dialogo.decir(facu, "Si necesitas ayuda con tu mate… ¡Pedile a Hanz!", "sonido/audio-facu-1.mp3") }
  method interactuarConYerba() { dialogo.mostrar(wachington, "Es de Facu, debería pedir permiso primero…") }
}