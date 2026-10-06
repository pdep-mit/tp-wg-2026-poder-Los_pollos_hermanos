import wollok.game.*

// El tablero conoce sus propias reglas: qué posiciones existen y cuáles están ocupadas.
object tablero {

  // Las posiciones válidas van de 0 a (tamaño - 1) en cada eje
  method estaDentro(posicion) =
    posicion.x().between(0, game.width() - 1) && posicion.y().between(0, game.height() - 1)

  method hayObstaculoEn(posicion) =
    game.getObjectsIn(posicion).any({ objeto => objeto.esSolido() }) // getObjects devuelve TODOS los onjetos de cierta posición

  // Orden importante: si no está dentro, ni siquiera se consulta por obstáculos
  method puedeOcuparse(posicion) =
    self.estaDentro(posicion) && !self.hayObstaculoEn(posicion)
}

