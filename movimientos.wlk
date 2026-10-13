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

// Mueve a cualquier objeto que entienda position() y position(nueva)
//Podemos mover cualquier personaje 
//Abstaccion (ponele) de movimientos
object movimiento {

  method mover(personaje, destino) {
    if (tablero.puedeOcuparse(destino))
      personaje.position(destino)
  }

  method arriba(personaje) { 
    personaje.imagen("x64sprites/personajes/wachington/wachington-detras.png")
    self.mover(personaje, personaje.position().up(1)) 
    }
  method abajo(personaje) { 
    personaje.imagen("x64sprites/personajes/wachington/wachington-frente.png")
    self.mover(personaje, personaje.position().down(1)) 
    }
  method izquierda(personaje) { 
    personaje.imagen("x64sprites/personajes/wachington/wachington-izq.png")
    self.mover(personaje, personaje.position().left(1)) 
    }
  method derecha(personaje) { 
    personaje.imagen("x64sprites/personajes/wachington/wachington-der.png")
    self.mover(personaje, personaje.position().right(1)) 
    }
}