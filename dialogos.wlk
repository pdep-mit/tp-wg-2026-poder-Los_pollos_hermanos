import wollok.game.*

object dialogo {
  var vozActual = null
  var visible = false
  var texto = ""
  const lineasActuales = []
  const visuales = []

  method estaVisible() = visible
  method textoActual() = texto

  method mostrar(personaje, mensaje) {
    self.callar()
    self.borrar()
    texto = mensaje
    visible = true
    self.dibujar()
  }

  method decir(personaje, mensaje, audio) {
    self.mostrar(personaje, mensaje)
    vozActual = game.sound(audio)
    vozActual.play()
  }

  method ocultar() {
    visible = false
    self.borrar()
    self.callar()
  }

  method armarLineas(mensaje) {
    lineasActuales.clear()
    const palabras = mensaje.split(" ")
    var linea = ""
    palabras.forEach({ palabra =>
      if (linea.isEmpty()) {
        linea = palabra
      } else if (linea.size() + palabra.size() + 1 <= 80) {
        linea = linea + " " + palabra
      } else {
        lineasActuales.add(linea)
        linea = palabra
      }
    })
    if (!linea.isEmpty()) lineasActuales.add(linea)
  }

  method centro() = game.width().div(2)

  method dibujar() {
    self.armarLineas(texto)
    const altoPanel = lineasActuales.size() + 2
    (0 .. game.width() - 1).forEach({ x =>
      (0 .. altoPanel - 1).forEach({ y =>
        self.agregar(new FondoDialogo(position = game.at(x, y)))
      })
    })
    self.agregar(new TextoDialogo(position = game.at(self.centro(), altoPanel - 1), texto = "DIALOGO  (E: cerrar)"))
    (0 .. lineasActuales.size() - 1).forEach({ indice =>
      self.agregar(new TextoDialogo(
        position = game.at(self.centro(), lineasActuales.size() - indice),
        texto = lineasActuales.get(indice)
      ))
    })
  }

  method agregar(visual) {
    visuales.add(visual)
    game.addVisual(visual)
  }

  method borrar() {
    visuales.forEach({ visual => game.removeVisual(visual) })
    visuales.clear()
  }

  method callar() {
    if (vozActual != null) {
      vozActual.stop()
      vozActual = null
    }
  }
}

class FondoDialogo {
  const property position
  method image() = "x64sprites/mapa/fondo-mochila.png"
  method esSolido() = false
  method interactuar() {}
}

class TextoDialogo {
  const property position
  const texto
  method text() = texto
  method textColor() = "FFFFFFFF"
  method esSolido() = false
  method interactuar() {}
}
