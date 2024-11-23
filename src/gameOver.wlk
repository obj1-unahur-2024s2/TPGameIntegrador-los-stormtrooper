import entrada.*
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
import musicaSonido.*

object gameOver {
  const property image = "gameOverV3.png" 
  var property position = game.origin()
  var property activo = false //activa o desactiva los botones del menu

  const musicaAmbiente = gameOverM

  method reproducirMusica() {
    musicaAmbiente.sonar()
    musicaAmbiente.loop()
  }

  method pararTodasLAsMusicas() {
    if(ambiente1.played())
        ambiente1.stop()
    else if (ambiente2.played())
      ambiente2.stop()
    else
      salaRitual.stop()
  }

  method iniciar() {    
    //----------------------------------------------------------------propiedades de tablero
    habitacion.borrarEscena()
    self.pararTodasLAsMusicas()
    game.schedule(1500, {=> 
      self.reproducirMusica()
    })
    
    game.removeVisual(corazon1)// borra ultimo corazon
    game.addVisual(self)//muestra game over
    activo = true

    habitacion.cerrarPuertasAbiertas()
    habitacion.borrarListaconPuertas()
    tituloJuego.activarMenu(false)
    personaje.personajeVida(4)
    personaje.inicioDePartida(true)
    barraItems.ResetItemsDeInventario()

    keyboard.num(4).onPressDo({if(activo){
      musicaAmbiente.stop()
      activo = false
      tituloJuego.iniciar()
      }})
    //keyboard.num(1).onPressDo({tituloJuego.iniciar()})
    //keyboard.num(2).onPressDo({self.ModoDificil()})//modo dificil
    keyboard.num(5).onPressDo({if(activo){
      activo = false
      musicaAmbiente.stop()
      game.stop()
      }})
  }
    
}
