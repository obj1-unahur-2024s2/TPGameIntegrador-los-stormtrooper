
import wollok.game.*
object personaje {
  var property position = game.origin()
  var property image = "idle1Der.png"
  var property inicioDePartida = true
  var property ubicacion = 0
  var property estado = true
  var property flip = true

    method configurarTeclas() {
		//var property tiempo = 500

		//Left
		keyboard.a().onPressDo({ 
			if(1 < self.position().x())
				self.position(self.position().left(1))
				flip = false
			})
		//right
		keyboard.d().onPressDo({
			if(game.width()-2 > self.position().x()) 
			 	self.position(self.position().right(1))
				flip = true
			 })
		//down
		keyboard.s().onPressDo({ 
			if(1 < self.position().y())
				self.position(self.position().down(1))
			})
		//up
		keyboard.w().onPressDo({
			if(game.height()-2 > self.position().y()) 
			 	self.position(self.position().up(1))
			 })
	}

  	method irA(nuevaPosicion) {
		self.position(nuevaPosicion)
	}
	
	method animacion() {
	  game.onTick(250,"idleState",{=> self.cambioFlip()})
	}
	
	method cambioFlip() {
	  if(flip){
		if(estado){
			image = "idle2Der.png"
			estado = !estado
			}
		else{
			image = "idle1Der.png"
			estado = !estado
			}
	  }
	  else
	  	if(estado){
	  		image = "idle2Izq.png"
			estado = !estado
	  	}
	  	else{
			image = "idle1Izq.png"
			estado = !estado
	    }
	}
	/*
	method idleDerecha() {
	  if(estado){
	  	image = "idle2Der.png"
		estado = !estado
	  	}
	  else{
		image = "idle1Der.png"
		estado = !estado
	    }
	}
		method idleIzquierda() {
	  if(estado){
	  	image = "idle2Izq.png"
		estado = !estado
	  	}
	  else{
		image = "idle1Izq.png"
		estado = !estado
	    }
	}/*
	method animacion() {
	  if(keyboard.a())
	  	self.idleDerecha()
	  else if(keyboard.d())
	  	self.idleIzquierda()
	}
	method flip() {
		keyboard.a().onPressDo({game.onTick(500,"idleStateDer",{=> self.idleDerecha()})})
		keyboard.d().onPressDo({game.onTick(500,"idleStateIzq",{=> self.idleIzquierda()})})
	}	*/

	
}