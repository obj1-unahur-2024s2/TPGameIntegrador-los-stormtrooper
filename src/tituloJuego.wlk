import gameOver.*
import barraItems.*
import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import wollok.game.*
import tablero.*
import fantasma.*
import entrada.*

object tituloJuego {
  const property image = "tituloJuegoV2.png" 
  var property position = game.origin()
  var property activarMenu = true //activa o desactiva los botones del menu

  method iniciar() {    
    activarMenu = true
    habitacion.borrarTodo(self)
    game.addVisual(self)
    gameOver.activo(false)//del menu gameover
    personaje.personajeVida(3)

    keyboard.num(1).onPressDo({if(activarMenu){self.intro()}})
    //keyboard.num(2).onPressDo({self.ModoDificil()})//modo dificil
    keyboard.num(3).onPressDo({if(activarMenu){game.stop()}})

  }

  method interaccion() {  }
  method modoNormal() {  }
  method ModoDificil() {  }

  method intro() {
    habitacion.borrarTodo(self)
    game.addVisual(introImage)
    keyboard.num(1).onPressDo({if(activarMenu){
      habitacion.borrarTodo(introImage)
      activarMenu = false
      entrada.iniciar()
      }})
  }

}

object introImage {
  const property image = "introduccionV2.png"
  const property position = game.origin() 
  method interaccion() {  }
}