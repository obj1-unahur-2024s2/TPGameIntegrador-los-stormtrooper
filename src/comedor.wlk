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
    personaje.inicioDePartida(false)//

    //-------------------------------------Ubicaciones
    //--Ubicacion del personaje segun ekl lugar
    if(personaje.ubicacion() ==0){// desde la entrada
      game.addVisualCharacter(personaje)
      personaje.irA(game.at(7,5))
      }
    else{//desde cocina
      game.addVisualCharacter(personaje)
      personaje.irA(game.at(2,7))
      }

    //identificador de ubicacion del personaje 
    personaje.ubicacion(1)
    /*
    Habitaciones:
    0 = Entrada
    1 = Comedor
    2 = Musica
    3 = 1do piso
    4 = Terraza
    5 = Biblioteca
    6 = cocina
    */

    //--puertas
    game.addVisual(puertaAEntrada)
    puertaAEntrada.ubicarEn(game.at(8,5))

    game.addVisual(puertaACocina)
    puertaACocina.ubicarEn(game.at(2,8))

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
    game.removeVisual(puertaACocina)
    game.removeVisual(puertaATerraza)
    game.removeVisual(puertaAPrimerPiso)
    game.removeVisual(escaleraAEntrada)
  }
}