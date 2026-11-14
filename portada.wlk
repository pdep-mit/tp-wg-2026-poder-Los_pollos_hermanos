import wollok.game.*

object portada {
  var visible = true
  var property position = game.at(4, 0)
  
  method image() = "x64sprites/mapa/portada.gif"
  method esSolido() = false
  method interactuar() {}

  method mostrar() {
    visible = true
    game.addVisual(self)
    game.onClickDo({ pos => self.cerrar() })
    keyboard.enter().onPressDo({ self.cerrar() })
    keyboard.space().onPressDo({ self.cerrar() })
  }

  method cerrar() {
    if (visible) {
      visible = false
      game.removeVisual(self)
    }
  }
}