import wollok.game.*

/*object juego{
  method iniciar(){
    
  }
}*/ 
object alumno {
  var property position = game.center()
  method image() = "assets/alumno.png"
}

/* method configurarJuego(juegoTomYJerry){
		game.addVisualCharacter(self)
		game.onCollideDo(self, {raton => 
			self.atrapado(raton, juegoTomYJerry)
		})
	} 
  */
object rasta {
  var property position = game.at(8,8)
  method image() = "assets/rasta.png"

}
/*
object companieroClase{

}

object computadora{

}*/
