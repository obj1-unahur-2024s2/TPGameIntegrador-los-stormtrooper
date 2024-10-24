import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import entrada.*
import wollok.game.*

object comedor {
  var property image = "fondoComedor.png" 
  var property position = game.origin()

  method iniciar() {
    //-------------------------------------propiedades de tablero
    self.borraTodo()
    game.addVisual(self)

    game.addVisual(ubicacionComedor)
    game.schedule(2000, { => game.removeVisual(ubicacionComedor)})// despues de 2s elimina el texto1
   
    //------------------------------------estado del personaje
    personaje.inicioDePartida(false)
    personaje.ubicacion(1)


    //-------------------------------------Ubicaciones
    //--personaje
    game.addVisualCharacter(personaje)
    personaje.irA(game.at(7,5))

    //--puertas
    game.addVisual(puertaAEntrada)
    puertaAEntrada.ubicarEn(game.at(8,5))

    //--Items

  }

  method borraTodo() {
    //fondo
    game.removeVisual(self)
    //personaje, items
    game.removeVisual(personaje)
    game.removeVisual(llave1)
    //puertas
    game.removeVisual(puertaAComedor)
    game.removeVisual(puertaAEntrada)
    game.removeVisual(puertaAMusica)
    game.removeVisual(escaleraAPrimerPiso)

  }

}