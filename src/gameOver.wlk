import barraItems.*
import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import wollok.game.*
import tablero.*
import fantasma.*

object gameOver {
  const property image = "fondoGameOver.png" 
  var property position = game.origin()

  method iniciar() {    
    //----------------------------------------------------------------propiedades de tablero
    habitacion.borrarTodo(self)
    game.removeVisual(corazon1)// borra ultimo corazon
    game.addVisual(self)//muestra game over
  }

    
}
