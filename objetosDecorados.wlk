import wollok.game.*

class ObjetoDecorativo {
  const property position
  method esInteractuable() = false
}

class ObjetoDecorativoSolido inherits ObjetoDecorativo {
  method esSolido() = true
}

class ObjetoDecorativoNoSolido inherits ObjetoDecorativo {
  method esSolido() = false
}

class ComputadoraDecorativa inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/pc.png"
}
class CajaHerramientas inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/caja-herramientas.png"
}
class CartelUTNIzq inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/cartel-utn-izq.png"
}
class CartelUTNDer inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/cartel-utn-der.png"
}
class Mesa inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/mesa-medio.png"
}
class MesaIzquierda inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/mesa-izq.png"
}
class MesaDerecha inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/mesa-der.png"
}
class MesaVertical inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/mesa-vertical-medio.png"
}
class MesaVerticalPapeles inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/mesa-vertical-medio-papeles.png"
}
class MesaArribaVertical inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/mesa-vertical-arriba.png"
}
class MesaAbajoVertical inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/mesa-vertical-abajo.png"
}
class FlechaDer inherits ObjetoDecorativoNoSolido {
  method image() = "x64sprites/mapa/flecha-der.png"
}
class TaraguiPared inherits ObjetoDecorativoNoSolido {
  method image() = "x64sprites/mapa/taragui-pared.png"
}
class CartelAgua inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/piso-mojado.png"
}
class Aguita inherits ObjetoDecorativoNoSolido {
  method image() = "x64sprites/mapa/aguita.png"
}
class Escritorio inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/escritorio.png"
}
class EscritorioVertical inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/escritorio-vertical.png"
}
class EscritorioVerticalPC inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/escritorio-vertical-pc.png"
}
class EscritorioCerrado inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/escritorio-cerrado.png"
}
class EscritorioCerradoLleno inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/escritorio-cerrado-lleno.png"
}
class EscritorioDenise inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/personajes/denise/denise-silla-der-2.png"
}
class EscritorioJulian inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/personajes/julian/julian-silla-izq-2.png"
}
class EscritorioAgus inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/personajes/agus/agus-silla-der-2.png"
}
class Silla inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/silla-vacia.png"
}
class SillaIzq inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/silla-izq.png"
}
class SillaDer inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/silla-der.png"
}
class ComputadoraLabo inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/escritorio-pc-1.png"
}
class ComputadoraLaboTop inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/escritorio-pc-2.png"
}
class ComputadoraLaboIzq inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/escritorio-vertical-pc-izq.png"
}
class ComputadoraLaboDer inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/escritorio-vertical-pc-der.png"
}
class PuertaDecor inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/puerta-medio.png"
}
class MesaArribaEIzq inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/mesa-arriba-izq.png"
}
class MesaAbajoEDer inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/mesa-abajo-der.png"
}
class Termo1 inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/termo1.png"
}
class Termo2 inherits ObjetoDecorativoSolido {
  method image() = "x64sprites/mapa/termo2.png"
}
