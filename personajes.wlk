import wollok.game.*
import objetosUtiles.*
import objetosDecorados.*
import historiaEntrada.*
import mochila.*

//PERSONAJES INTERACTUABLES
object wachington {
  var property position = game.at(7, 0)
  var property imagen = "x64sprites/personajes/wachington/wachington-frente.png"
  method image() = imagen
  method esSolido() = true
  var property objetivo = objetivoLlegarAlAula


  method estaAlLadoDe(otro) = self.position().distance(otro.position()) == 1 // Chequea si esta al lado de otro personaje. 
  // Uno porque asi da el calculo que hace distance si esta al lado (no sirve si esta en diagonal)

   method interactuar() {
      const cercanos = game.allVisuals().filter({ obj => self.estaAlLadoDe(obj) && obj.esInteractuable()})
      
      if (cercanos.isEmpty()) {
          game.say(self, "Acá no hay nadie con quien hablar...")
      } else {
          cercanos.first().interactuar()
      }
  }

  method guardar(objeto) { mochila.guardar(objeto) }

  
  method recoger(objeto) {
    mochila.guardar(objeto)
    game.removeVisual(objeto)
  }
  method tiene(objeto) = mochila.tiene(objeto)
  method sacar(objeto) { mochila.sacar(objeto) }
}

class Npc {
  var property position
  method image()
  method esSolido() = true
  method esInteractuable() = true

  method hablar(mensaje) { game.say(self, mensaje) }

  method interactuar() { self.dialogar(wachington.objetivo()) }

  method dialogar(objetivo)
}

object rasta inherits Npc(position = game.at(4, 7)) {
  override method image() = "x64sprites/personajes/rasta/rasta-frente.png"
  override method dialogar(objetivo) { objetivo.interactuarConRasta() }
}

object hanz inherits Npc(position = game.at(5, 4)) {
  override method image() = "x64sprites/personajes/hanz/hanz-frente.png"
  override method dialogar(objetivo) { objetivo.interactuarConHanz() }
}

object matos inherits Npc(position = game.at(1, 7)) {
  override method image() = "x64sprites/personajes/matos/matos-frente.png"
  override method dialogar(objetivo) { objetivo.interactuarConMatos() }
}

object mati inherits Npc(position = game.at(6, 5)) {
  override method image() = "x64sprites/personajes/mati/mati-izq.png"
  override method dialogar(objetivo) { objetivo.interactuarConMati() }
}

object portero inherits Npc(position = game.at(2, 5)) {
  override method image() = "x64sprites/personajes/portero/portero-der.png"
  override method dialogar(objetivo) { objetivo.interactuarConPortero() }
}

object tecnico inherits Npc(position = game.at(12, 2)) {
  override method image() = "x64sprites/personajes/tecnico/tecnico-izq.png"
  override method dialogar(objetivo) { objetivo.interactuarConTecnico() }
}

object facu inherits Npc(position = game.at(13, 5)) {
  override method image() = "x64sprites/personajes/facu/facu-frente.png"
  override method dialogar(objetivo) { objetivo.interactuarConFacu() }
}

// esta atras del mostrador: no se llega a ella, solo se la ve
object kiosquera inherits Npc(position = game.at(4, 6)) {
  override method image() = "x64sprites/personajes/kiosquera/kiosquera-frente.png"
  override method esInteractuable() = false
  override method dialogar(objetivo) {}
}

// interactuar con el mostrador
object kiosqueraMesa inherits Npc(position = game.at(4, 5)) {
  override method image() = "x64sprites/mapa/mesa-medio.png"
  override method dialogar(objetivo) { objetivo.interactuarConKiosquera() }
}

object bedelia inherits Npc(position = game.at(7, 3)) {
  override method image() = "x64sprites/mapa/pared-bedelia.png"
  override method dialogar(objetivo) { objetivo.interactuarConBedelia() }
}

object agusSilla inherits Npc(position = game.at(6, 4)) {
  override method image() = "x64sprites/personajes/agus/agus-silla-der-1.png"
  override method dialogar(objetivo) { objetivo.interactuarConAgus() }
}

object deniseSilla inherits Npc(position = game.at(4, 2)) {
  override method image() = "x64sprites/personajes/denise/denise-silla-der-1.png"
  override method dialogar(objetivo) { objetivo.interactuarConDenise() }
}

object julianSilla inherits Npc(position = game.at(2, 0)) {
  override method image() = "x64sprites/personajes/julian/julian-silla-izq-1.png"
  override method dialogar(objetivo) { objetivo.interactuarConJulian() }
}

// porque siempre dice lo mismo
object conserje inherits Npc(position = game.at(9, 1)) {
  override method image() = "x64sprites/personajes/conserje/conserje-izq.png"
  override method dialogar(objetivo) {}
  override method interactuar() { self.hablar("Cuidado donde pisas, está todo mojado") }
}