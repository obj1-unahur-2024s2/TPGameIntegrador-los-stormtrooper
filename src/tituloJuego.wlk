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
import jardin.*
import intro.*


object tituloJuego {
  const property image = "tituloJuegoV2.png" 
  var property position = game.origin()
  var property activarMenu = true //activa o desactiva los botones del menu
  
  method iniciar() {  
    //tituloMusic.play()
    habitacion.borrarEscena()
    game.addVisual(self)
    
    personaje.personajeVida(3)
    personaje.inicioDePartida(true)
    barraItems.ResetItemsDeInventario()
    activarMenu = true
    
    keyboard.num(1).onPressDo({if(activarMenu){self.intro()}})
    keyboard.num(2).onPressDo({self.ModoDificil()})//modo dificil
    keyboard.num(3).onPressDo({if(activarMenu){game.stop()}})
  }

  method interaccion() {  }
  method modoNormal() {  }
  method ModoDificil() {  }

  method intro() {
    habitacion.borrarEscena()
    game.addVisual(introImage)
    //tituloM.sonar()//
    keyboard.num(1).onPressDo({if(activarMenu){
      //tituloM.stop()
      habitacion.borrarEscena()
      activarMenu = false
      
      entrada.iniciar()
      //jardin.iniciar()
      }})
  }
}

object introImage {
  const property image = "introduccionV2.png"
  const property position = game.origin() 
/*
  const musicaAmbiente = tituloM

  method reproducirMusica() {
    musicaAmbiente.sonar()
    musicaAmbiente.loop()
  }
  method stop() {
    musicaAmbiente.stop()
  }
  method interaccion() {  }*/
}
object sonidoprueba {
  const sonido = game.sound("titulo.mp3")
  
  method sonar() {
    sonido.play()
  }
  method pausa() {
    sonido.pause()
  }
  method loop() {
    sonido.shouldLoop(true)
  }
  method stop() {
    sonido.stop()
  }
    method reproducirMusica() {
    self.sonar()
    self.loop()
  }
}
object tituloMusic {

  method play(){
    game.sound("titulo.mp3").play()
  }
}
