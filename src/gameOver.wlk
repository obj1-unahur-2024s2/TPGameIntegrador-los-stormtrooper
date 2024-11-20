import entrada.*
import ritual.*
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
  const property image = "gameOver.png" 
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
    //habitacion.borrarTodo(self)
    habitacion.borrarEscena()
    self.pararTodasLAsMusicas()
    self.reproducirMusica()
    game.removeVisual(corazon1)// borra ultimo corazon
    game.addVisual(self)//muestra game over
    activo = true

    habitacion.cerrarPuertasAbiertas()
    habitacion.borrarListaconPuertas()

    personaje.personajeVida(3)
    personaje.inicioDePartida(true)
    barraItems.ResetItemsDeInventario()

    keyboard.num(1).onPressDo({if(activo){
      musicaAmbiente.stop()
      activo = false
      entrada.iniciar()
      }})
    //keyboard.num(1).onPressDo({tituloJuego.iniciar()})
    //keyboard.num(2).onPressDo({self.ModoDificil()})//modo dificil
    keyboard.num(2).onPressDo({if(activo){
      musicaAmbiente.stop()
      game.stop()
      }})
  }

    
}
