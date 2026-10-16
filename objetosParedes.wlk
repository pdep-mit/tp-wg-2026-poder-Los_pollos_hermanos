import wollok.game.*

class ParedFrente {
  const property position
  method image() = "x64sprites/mapa/pared-frente.png"
  method esSolido() = true
  method esInteractuable() = false
}
class ParedIzq {
  const property position
  method image() = "x64sprites/mapa/pared-lado-izq.png"
  method esSolido() = true
  method esInteractuable() = false
}
class ParedDer {
  const property position
  method image() = "x64sprites/mapa/pared-lado-der.png"
  method esSolido() = true
  method esInteractuable() = false
}
class ParedCarteleraVacia {
  const property position
  method image() = "x64sprites/mapa/pared-cartelera-vacia-medio.png"
  method esSolido() = true
  method esInteractuable() = false
}
class ParedCarteleraLlena {
  const property position
  method image() = "x64sprites/mapa/pared-cartelera-medio.png"
  method esSolido() = true
  method esInteractuable() = false
}
class ParedCarteleraIzq {
  const property position
  method image() = "x64sprites/mapa/pared-cartelera-izq.png"
  method esSolido() = true
  method esInteractuable() = false
}
class ParedCarteleraDer {
  const property position
  method image() = "x64sprites/mapa/pared-cartelera-der.png"
  method esSolido() = true
  method esInteractuable() = false
}