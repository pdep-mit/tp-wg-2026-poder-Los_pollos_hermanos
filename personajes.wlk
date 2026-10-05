import wollok.game.*

/*object juego{
  method iniciar(){
    
  }
}*/ 
object alumno {
  var property position = game.center()
  method image() = "alumno.png"
}

/* method configurarJuego(juegoTomYJerry){
		game.addVisualCharacter(self)
		game.onCollideDo(self, {raton => 
			self.atrapado(raton, juegoTomYJerry)
		})
	} 
  */
object rasta {
  var property position = game.at(0,0)
  method image() = "charizard.png"

}
/*
object companieroClase{

}

object computadora{

}*/
