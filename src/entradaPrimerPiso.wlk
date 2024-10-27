import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import entrada.*
import wollok.game.*
import terraza.*

object entradaPrimerPiso {
  var property image = "fondoEntrada1PV2.png" 
  var property position = game.origin()

  method iniciar() {
    //------------------------------------------------------propiedades de tablero
    self.borraTodo()
    game.addVisual(self)

    game.addVisual(ubicacionPrimerPiso)
    game.schedule(2000, { => game.removeVisual(ubicacionPrimerPiso)})// despues de 2s elimina el texto1

    //------------------------------------------------------estado del personaje
    personaje.inicioDePartida(false)

    //------------------------------------------------------ubicacion objetos
    //--personaje

    //--Ubicacion del personaje segun el lugar
    if(personaje.ubicacion() ==0){// desde entrada
      game.addVisualCharacter(personaje)
      personaje.irA(game.at(4,3))
      }
    else{// desdes terraza
      game.addVisualCharacter(personaje)
      personaje.irA(game.at(2,5))
      }
      
    //identificador de ubicacion del personaje 
    personaje.ubicacion(3)
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
    game.addVisual(escaleraAEntrada)
    escaleraAEntrada.ubicarEn(game.at(5,2))//4.7

    game.addVisual(puertaATerraza)
    puertaATerraza.ubicarEn(game.at(1,5))//4.7

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