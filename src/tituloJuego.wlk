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

  method iniciar() {    
    game.addVisual(self)

    keyboard.num(1).onPressDo({self.intro()})
    //keyboard.num(1).onPressDo({entrada.iniciar()})
    keyboard.num(2).onPressDo({self.ModoDificil()})//modo dificil
    keyboard.num(3).onPressDo({game.stop()})
    //game.whenKeyPressedDo(event, action)
  }

  method interaccion() {  }

  method modoNormal() {  }
  method ModoDificil() {  }

  method intro() {
    game.addVisual(introImage)
    keyboard.num(1).onPressDo({entrada.iniciar()})
  }
}

object introImage {
  const property image = "introduccionV2.png"
  const property position = game.origin() 
  method interaccion() {  }
}