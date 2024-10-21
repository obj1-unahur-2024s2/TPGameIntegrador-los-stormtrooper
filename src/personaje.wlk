

object personaje {
  var property position = game.origin()
  var property image = "personaje.png"

    method configurarTeclas() {
		//var property tiempo = 500

		//Left
		keyboard.a().onPressDo({ 
			if(0 < self.position().x())
				self.position(self.position().left(1))
			})
		//right
		keyboard.d().onPressDo({
			if(game.width()-1 > self.position().x()) 
			 	self.position(self.position().right(1))
			 })
		//down
		keyboard.s().onPressDo({ 
			if(0 < self.position().y())
				self.position(self.position().down(1))
			})
		//up
		keyboard.w().onPressDo({
			if(game.height()-1 > self.position().y()) 
			 	self.position(self.position().up(1))
			 })
	}
    /*method agarrar(algo) {
      game.whenCollideDo(self, { algo => self.hablar(algo) })
      //game.onCollideDo(pepita, { algo => algo.teEncontro(pepita)})
    }*/
    //method hablar(algo) = "hola" + algo.nombre()
    //method prueba() = "hola"

	//method howAreYou() = "I am Wolloktastik!"

  	method irA(nuevaPosicion) {
		self.position(nuevaPosicion)
		//personaje.irA(game.at(1, 0)) ejemplo de llamada
	}
}