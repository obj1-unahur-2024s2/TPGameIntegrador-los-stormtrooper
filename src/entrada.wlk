import objetos.*
import titulo.*
import personaje.*
import textos.*


object entrada {
  
  method iniciarEntrada() {
    //definicion del tablero
    game.title("Pepita")
	  game.height(10)
	  game.width(10)
    game.cellSize(32)
    game.boardGround("fondo.png")
    
    //objetos en pantalla
    game.addVisual(puerta)
	  game.addVisualCharacter(personaje)
    game.addVisual(llave1)
    
    //configuracion de teclas de movimiento
    personaje.configurarTeclas()
    
    //colicion con la llave:
    game.whenCollideDo(personaje, { elemento => elemento.interaccion()})


  }
}
