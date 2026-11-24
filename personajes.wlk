import wollok.game.*
import dialogos.*
import objetos.*
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

  method estaEncimaDe(otro) = self.position() == otro.position()

  method interactuar() {
      const cercanos = game.allVisuals().filter({ obj => obj != self && (self.estaAlLadoDe(obj) || self.estaEncimaDe(obj))})
      if(cercanos.isEmpty()){
        dialogo.mostrar(self, "Acá no hay nadie con quien hablar...")
      }
      else{
      cercanos.forEach({obj => obj.interactuar()})
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

class Npc inherits Interactuable {
   override method reaccionarA(objetivo) { 
    self.dialogar(objetivo) 
  }
  method dialogar(objetivo)
}

// para que gire según de donde le hablo
class NpcGiratorio inherits Npc  {
  const carpeta                 
  var direccion = "frente" // dirección inicial

  override method image() =
    "x64sprites/personajes/" + carpeta + "/" + carpeta + "-" + direccion + ".png"

  method mirarA(otro) {
    const dx = otro.position().x() - self.position().x()
    const dy = otro.position().y() - self.position().y()

    // si la diferencia horizontal es mayor a la vertical el NpcGiratorio  mira a la izquierda o derecha
    if (dx.abs() > dy.abs()) { 
      direccion = if (dx > 0) "der" else "izq" 
    } else if (dy != 0) { // sino mira arriba o abajo
      direccion = if (dy > 0) "detras" else "frente"
    }
  }

  override method interactuar() {
    self.mirarA(wachington)
    super()
  }
}

object rasta inherits NpcGiratorio (position = game.at(4, 7), carpeta = "rasta") {
  override method dialogar(objetivo) { objetivo.interactuarConRasta() }
}

object hanz inherits NpcGiratorio (position = game.at(5, 4), carpeta = "hanz") {
  override method dialogar(objetivo) { objetivo.interactuarConHanz() }
}

object matos inherits NpcGiratorio (position = game.at(1, 7), carpeta = "matos") {
  override method dialogar(objetivo) { objetivo.interactuarConMatos() }
}

object mati inherits NpcGiratorio (position = game.at(6, 5), carpeta = "mati", direccion = "izq") {
  override method dialogar(objetivo) { objetivo.interactuarConMati() }
}

object portero inherits NpcGiratorio (position = game.at(2, 5), carpeta = "portero", direccion = "der") {
  override method dialogar(objetivo) { objetivo.interactuarConPortero() }
}

object tecnico inherits NpcGiratorio (position = game.at(12, 2), carpeta = "tecnico", direccion = "izq") {
  override method dialogar(objetivo) { objetivo.interactuarConTecnico() }
}

object facu inherits NpcGiratorio (position = game.at(13, 5), carpeta = "facu") {
  override method dialogar(objetivo) { objetivo.interactuarConFacu() }
}

// esta atras del mostrador: no se llega a ella, solo se la ve
object kiosquera inherits Npc (position = game.at(4, 6)) {
  override method image() = "x64sprites/personajes/kiosquera/kiosquera-frente.png"
  override method dialogar(objetivo) {}
}

// interactuar con el mostrador
object kiosqueraMesa inherits Npc (position = game.at(4, 5)) {
  override method image() = "x64sprites/mapa/mesa-medio.png"
  override method dialogar(objetivo) { objetivo.interactuarConKiosquera() }
}

object bedelia inherits Npc (position = game.at(7, 3)) {
  override method image() = "x64sprites/mapa/pared-bedelia.png"
  override method dialogar(objetivo) { objetivo.interactuarConBedelia() }
}

object agusSilla inherits Npc (position = game.at(6, 4)) {
  override method image() = "x64sprites/personajes/agus/agus-silla-der-1.png"
  override method dialogar(objetivo) { objetivo.interactuarConAgus() }
}

object deniseSilla inherits Npc (position = game.at(4, 2)) {
  override method image() = "x64sprites/personajes/denise/denise-silla-der-1.png"
  override method dialogar(objetivo) { objetivo.interactuarConDenise() }
}

object julianSilla inherits Npc (position = game.at(2, 0)) {
  override method image() = "x64sprites/personajes/julian/julian-silla-izq-1.png"
  override method dialogar(objetivo) { objetivo.interactuarConJulian() }
}

// porque siempre dice lo mismo
object conserje inherits NpcGiratorio (position = game.at(9, 1), carpeta = "conserje", direccion = "izq") {
  override method dialogar(objetivo) {}
  override method interactuar() { 
    super()
    dialogo.decir(self, "Cuidado donde pisas, está todo mojado", "sonido/conserje.mp3") }
}