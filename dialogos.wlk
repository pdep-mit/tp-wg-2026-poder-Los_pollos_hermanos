import wollok.game.*

object dialogo {
  var vozActual = null

  method decir(personaje, texto, audio) {
    self.callar()                    // si hablan dos seguidos, no se pisan
    game.say(personaje, texto)
    vozActual = game.sound(audio)    // un sonido se reproduce una sola vez: siempre uno nuevo
    vozActual.play()
  }

  method callar() {
    if (vozActual != null) {
      vozActual.stop()
      vozActual = null
    }
  }
}