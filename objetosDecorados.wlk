import wollok.game.*

class ComputadoraDecorativa {
  const property position
  method image() = "x64sprites/mapa/pc.png"
  method esSolido() = true
  method esInteractuable() = false
}
class CajaHerramientas {
  const property position
  method image() = "x64sprites/mapa/caja-herramientas.png"
  method esSolido() = true
  method esInteractuable() = false
}
class CartelUTNIzq {
  const property position
  method image() = "x64sprites/mapa/cartel-utn-izq.png"
  method esSolido() = true
  method esInteractuable() = false
}
class CartelUTNDer {
  const property position
  method image() = "x64sprites/mapa/cartel-utn-der.png"
  method esSolido() = true
  method esInteractuable() = false
}
class Mesa {
  const property position
  method image() = "x64sprites/mapa/mesa-medio.png"
  method esSolido() = true
  method esInteractuable() = false
}
class MesaIzquierda {
  const property position
  method image() = "x64sprites/mapa/mesa-costado-izq.png"
  method esSolido() = true
  method esInteractuable() = false
}

class MesaDerecha {
  const property position
  method image() = "x64sprites/mapa/mesa-costado-der.png"
  method esSolido() = true
  method esInteractuable() = false
}

class MesaHorizontal {
  const property position
  method image() = "x64sprites/mapa/mesa-horizontal-medio.png"
  method esSolido() = true
  method esInteractuable() = false
}
class MesaHorizontalPapeles {
  const property position
  method image() = "x64sprites/mapa/mesa-horizontal-medio-papeles.png"
  method esSolido() = true
  method esInteractuable() = false
}

class MesaArribaHorizontal {
  const property position
  method image() = "x64sprites/mapa/mesa-horizontal-arriba.png"
  method esSolido() = true
  method esInteractuable() = false
}

class MesaAbajoHorizontal {
  const property position
  method image() = "x64sprites/mapa/mesa-horizontal-abajo.png"
  method esSolido() = true
  method esInteractuable() = false
}

class Flecha {
  const property position
  method image() = "x64sprites/mapa/flecha.png"
  method esSolido() = false
  method esInteractuable() = false
}

class TaraguiPared {
  const property position
  method image() = "x64sprites/mapa/taragui-pared.png"
  method esSolido() = false
  method esInteractuable() = false
}
class CartelAgua {
  const property position
  method image() = "x64sprites/mapa/piso-mojado.png"
  method esSolido() = true
  method esInteractuable() = false
}
class Aguita {
  const property position
  method image() = "x64sprites/mapa/aguita.png"
  method esSolido() = false
  method esInteractuable() = false
}

class EscritorioCerrado {
  const property position
  method image() = "x64sprites/mapa/escritorio-cerrado.png"
  method esSolido() = true
  method esInteractuable() = false
}
class EscritorioCerradoLleno {
  const property position
  method image() = "x64sprites/mapa/escritorio-cerrado-lleno.png"
  method esSolido() = true
  method esInteractuable() = false
}
class EscritorioDenise {
  const property position
  method image() = "x64sprites/personajes/denise/denise-silla-der-2.png"
  method esSolido() = true
  method esInteractuable() = false
}
class EscritorioJulian {
  const property position
  method image() = "x64sprites/personajes/julian/julian-silla-izq-2.png"
  method esSolido() = true
  method esInteractuable() = false
}
class EscritorioAgus {
  const property position
  method image() = "x64sprites/personajes/agus/agus-silla-der-2.png"
  method esSolido() = true
  method esInteractuable() = false
}
class EscritorioMatos {
  const property position
  method image() = "x64sprites/mapa/escritorio-laptop.png"
  method esSolido() = true
  method esInteractuable() = false
}