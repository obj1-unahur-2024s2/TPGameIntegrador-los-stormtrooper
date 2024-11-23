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
  //var property activarSubMenu = false
  
  method iniciar() {  
    habitacion.borrarEscena()
    game.addVisual(self)
    
    personaje.personajeVida(4)
    personaje.inicioDePartida(true)
    barraItems.ResetItemsDeInventario()
    activarMenu = true
    
    //boton-1
    keyboard.num(1).onPressDo({if(activarMenu){
      game.sound("xfxSelect.mp3").play()
      activarMenu = false
      //activarSubMenu = true
      self.modoNormal()
      //self.intro()
    }})
    //boton-2
    keyboard.num(2).onPressDo({if(activarMenu){
      game.sound("xfxSelect.mp3").play()
      activarMenu = false
      //activarSubMenu = true
      self.modoDificil()
      //self.intro()
    }})

    //boton-3
    keyboard.num(3).onPressDo({if(activarMenu){game.stop()}})
  }

  method interaccion() {  }//nada
  
  //--modo normal
  method modoNormal() { 
    personaje.dificultad(1)
    //game.schedule(1000, {=>self.intro()})
    game.schedule(500, {=>intro.iniciar()})
    //self.intro()
   }

  //--modo dificil
  method modoDificil() {
    personaje.dificultad(2)
    game.schedule(500, {=>intro.iniciar()})
    //game.schedule(1000, {=>self.intro()})
    //self.intro()
  }

  /*
  method intro() {
    habitacion.borrarEscena()
    game.addVisual(introImage)
    keyboard.num(1).onPressDo({if(activarSubMenu){
      habitacion.borrarEscena()
      activarSubMenu = false
      game.schedule(1000, {=>entrada.iniciar()})
      //entrada.iniciar()
      //jardin.iniciar()
      }})
  }
  */
}
/*
object introImage {
  const property image = "introduccionV3.png"
  const property position = game.origin() 
}*/

