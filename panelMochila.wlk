import wollok.game.*
import personajes.*
import mochila.*
import movimientos.*


object panelMochila {
  var abierto = false
  var pestania = pestaniaMision
  const visuales = [] 

  method estaAbierto() = abierto

  method alternar() {
    if (abierto) self.cerrar() else self.abrir()
  }

  method abrir() {
    abierto = true
    self.dibujar()
  }

  method cerrar() {
    abierto = false
    self.borrar()
  }

  
  method mostrar(nuevaPestania) {
    if (abierto) {
      pestania = nuevaPestania
      self.borrar()
      self.dibujar()
    }
  }

 // Para que el panel tape casi toda la sala
  method izquierda() = 1
  method derecha() = tablero.ancho() - 2
  method arriba() = tablero.alto() - 2
  method centro() = (self.izquierda() + self.derecha()).div(2)
  method ancho() = self.derecha() - self.izquierda() + 1

  method dibujar() {
    (self.izquierda() .. self.derecha()).forEach({ x =>
      (0 .. self.arriba()).forEach({ y => self.agregar(new FondoPanel(position = game.at(x, y))) })
    })
    self.escribir(self.centro(), self.arriba(), "MOCHILA  (B: cerrar)")
    self.escribir(self.centro(), self.arriba() - 1, self.etiqueta(pestaniaMision) + "     " + self.etiqueta(pestaniaObjetos))
    pestania.dibujarEn(self)
  }

  // La pestaña activa se marca con flechitas
  method etiqueta(unaPestania) =
    if (unaPestania == pestania) "> " + unaPestania.titulo() + " <" else unaPestania.titulo()

  method escribir(x, y, texto) { self.agregar(new TextoPanel(position = game.at(x, y), texto = texto)) }

  method agregar(visual) {
    visuales.add(visual)
    game.addVisual(visual)
  }

  method borrar() {
    visuales.forEach({ visual => game.removeVisual(visual) })
    visuales.clear()
  }
}

object pestaniaMision {
  method titulo() = "[1] Misión"

  method dibujarEn(panel) {
    panel.escribir(panel.centro(), panel.arriba() - 2, "OBJETIVO ACTUAL")
    panel.escribir(panel.centro(), panel.arriba() - 3, wachington.objetivo().descripcion())
  }
}

object pestaniaObjetos {
  method titulo() = "[2] Objetos"

  method dibujarEn(panel) {
    if (mochila.estaVacia()) {
      panel.escribir(panel.centro(), panel.arriba() - 2, "La mochila está vacía")
    } else {
      const objetos = mochila.objetos()
      (0 .. objetos.size() - 1).forEach({ i => self.dibujarObjeto(panel, objetos.get(i), i) })
    }
  }

  // Cuantos objetos entran por fila depende del ancho de la sala (uno cada 2 celdas)
  method porFila(panel) = (panel.ancho() + 1).div(2)

  // Icono arriba y nombre abajo
  method dibujarObjeto(panel, objeto, indice) {
    const x = panel.izquierda() + 2 * (indice % self.porFila(panel))
    const y = panel.arriba() - 2 - 2 * indice.div(self.porFila(panel))
    panel.agregar(new IconoPanel(position = game.at(x, y), objeto = objeto))
    panel.escribir(x, y - 1, objeto.nombre())
  }
}

class FondoPanel {
  const property position
  method image() = "x64sprites/mapa/fondo-mochila.png"
  method esSolido() = false
  method interactuar() {}
}

class TextoPanel {
  const property position
  const texto
  method text() = texto
  method textColor() = "FFFFFFFF"
  method esSolido() = false
  method interactuar() {}

}

class IconoPanel {
  const property position
  const objeto
  method image() = objeto.image()
  method esSolido() = false
  method interactuar() {}
}
