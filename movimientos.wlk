import wollok.game.*

// El tablero conoce sus propias reglas: qué posiciones existen y cuáles están ocupadas.
object tablero {

  // Las posiciones válidas van de 0 a (tamaño - 1) en cada eje
  method estaDentro(posicion) =
    posicion.x().between(0, game.width() - 1) && posicion.y().between(0, game.height() - 1)

 