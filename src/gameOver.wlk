import tituloJuego.*
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
  const property image = "gameOver.png" 
  var property position = game.origin()
  var property activo = false //activa o desactiva los botones del menu

  method iniciar() {    
    //----------------------------------------------------------------propiedades de tablero
    habitacion.borrarTodo(self)
    game.removeVisual(corazon1)// borra ultimo corazon
    game.addVisual(self)//muestra game over
    activo = true
    personaje.personajeVida(3)

    keyboard.num(1).onPressDo({if(activo){tituloJuego.iniciar()}})
    //keyboard.num(1).onPressDo({tituloJuego.iniciar()})
    //keyboard.num(2).onPressDo({self.ModoDificil()})//modo dificil
    keyboard.num(2).onPressDo({if(activo){game.stop()}})
  }

    
}
