import wollok.game.*

object musica {
  var sonido = null
  var pausada = false
  
  method iniciar() {
    if (sonido == null) self.crear()
  }
  
  method crear() {
    sonido = game.sound("sonido/musica-fondo.mp3")
    sonido.shouldLoop(true)
    sonido.play()
  }
  
  // se llama dsp de cada game.clear(), por si el sonido quedó cortado
  method asegurar() {
    if ((sonido != null) && (!pausada)) {
      sonido.stop()
      self.crear()
    }
  }
  
  method pausar() {
    pausada = true
    if (sonido != null) sonido.pause()
  }
  
  method reanudar() {
    pausada = false
    if (sonido != null) sonido.resume()
  }
}