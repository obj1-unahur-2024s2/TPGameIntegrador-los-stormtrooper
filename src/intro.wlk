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

object intro {
  const property image = "introduccionV2.png"
  const property position = game.origin() 
  var property menuIntroActivo = false


  method iniciar() {
    menuIntroActivo = true
    habitacion.borrarEscena()
    game.addVisual(self)
    game.sound("titulo.mp3").play()
    //tituloM.sonar()//
    
    keyboard.num(1).onPressDo({
        if(menuIntroActivo){
            //tituloM.stop()
            habitacion.borrarEscena()
            menuIntroActivo = false
            
            entrada.iniciar()
            //jardin.iniciar()
        }})
  }
}



