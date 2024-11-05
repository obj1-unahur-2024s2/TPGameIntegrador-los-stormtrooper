import entrada.*
import objetos.*

import wollok.game.*
object personaje {
  	var property position = game.origin()
  	var property image = "idle1Der.png"
  	var property inicioDePartida = true
  	var property ubicacion = "vacio"
  	var property estado = true
  	var property flip = true

	//--Control del personaje
	method configurarTeclas() {
		//var property tiempo = 500

		//Left
		keyboard.a().onPressDo({ 
			if(topeIzq.position().x()+1 < self.position().x() )//puertaAComedor.position().x()+1  //&& 1 < self.position().x()
				self.position(self.position().left(1))
				flip = false
			})
		//right
		keyboard.d().onPressDo({
			if(topeDer.position().x()-1 > self.position().x()) //no se //game.width()-2 > self.position().x()  && 
			 	self.position(self.position().right(1))
				flip = true
			 })
		//down
		keyboard.s().onPressDo({ 
			if(topeAbajo.position().y()+1 < self.position().y())//1 < self.position().y() && 
				self.position(self.position().down(1))
			})
		//up
		keyboard.w().onPressDo({
			if(topeArriba.position().y()-1 > self.position().y()) //no se /*game.height()-2 > self.position().y() && */
			 	self.position(self.position().up(1))
			 })
	}

	//--Reubicador de personaje
  	method irA(nuevaPosicion) {
		self.position(nuevaPosicion)
	}
	//--Animador de personaje
	method animacion() {
	  game.onTick(200,"idleState",{=> self.cambioFlip()})
	}
	
	method imagenIdle(unaImagen) {
		image = unaImagen
		estado = !estado
}
	method cambioFlip() {
	  if(flip){
		if(estado)
			self.imagenIdle("idle2Der.png")
		else
			self.imagenIdle("idle1Der.png")
	  }
	  else{
	  	if(estado)
	  		self.imagenIdle("idle2Izq.png")
	  	else
			self.imagenIdle("idle1Izq.png")
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