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
import musicaSonido.*
import intro.*

object tituloJuego {
  const property image = "tituloJuegoV3.png" 
  var property position = game.origin()
  
  var property activarMenu = true //activa o desactiva los botones del menu
  var property activarSubMenu = false
  
  method iniciar() {  
    habitacion.borrarEscena()
    game.addVisual(self)
    
    personaje.personajeVida(3)
    personaje.inicioDePartida(true)
    barraItems.ResetItemsDeInventario()
    activarMenu = true
    
    keyboard.num(1).onPressDo({if(activarMenu){
      game.sound("xfxSelect.mp3").play()
      activarMenu = false
      activarSubMenu = true
      self.intro()
    }})
    keyboard.num(2).onPressDo({self.ModoDificil()})//modo dificil
    keyboard.num(3).onPressDo({if(activarMenu){game.stop()}})
  }

  method interaccion() {  }
  method modoNormal() {  }
  method ModoDificil() {  }

  method intro() {
    habitacion.borrarEscena()
    game.addVisual(introImage)
    keyboard.num(1).onPressDo({if(activarSubMenu){
      habitacion.borrarEscena()
      activarSubMenu = false
      entrada.iniciar()
      //jardin.iniciar()
      }})
  }
}

object introImage {
  const property image = "introduccionV3.png"
  const property position = game.origin() 
}

