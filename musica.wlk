import wollok.game.*

object musica {
  var sonido = null

  method iniciar() {
    if (sonido == null) {
      sonido = game.sound("sonido/angry-birds-musica.mp3")
      sonido.shouldLoop(true)
      sonido.play()
      
    }
  }
  method pausar() { if (sonido != null) sonido.pause() }
  method reanudar() { if (sonido != null) sonido.resume() }
}