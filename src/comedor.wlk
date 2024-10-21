import objetos.*
import titulo.*
import personaje.*
import textos.*
import entrada.*

object comedor {
  
  method iniciarEntrada() {
    //self.limpiarPantalla()
    game.clear()
    //game.start()

    game.height(5)
	  game.width(5)
    game.cellSize(32)
    game.boardGround("fondoComedor5x5.png")

    game.addVisualCharacter(personaje)
    personaje.irA(game.at(0,0))
    personaje.configurarTeclas()
    
    game.addVisual(puerta)
    puerta.ubicarEn(game.at(2,2))

  }
  method limpiarPantalla() {
    game.clear()
  }
}