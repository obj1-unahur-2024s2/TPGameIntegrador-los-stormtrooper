import entradaPrimerPiso.*
import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import entrada.*
import wollok.game.*

object terraza {
  var property image = "fondoTerraza.png" 
  var property position = game.origin()

  method iniciar() {
    //------------------------------------------------------propiedades de tablero
    self.borraTodo()
    game.addVisual(self)

    game.addVisual(ubicacionTerraza)
    game.schedule(2000, { => game.removeVisual(ubicacionTerraza)})// despues de 2s elimina el texto1

    //------------------------------------------------------estado del personaje
    personaje.inicioDePartida(false)
    personaje.ubicacion(4)
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

    //------------------------------------------------------ubicacion objetos
    //--personaje
    game.addVisualCharacter(personaje)
    personaje.irA(game.at(7,5))
    

    //--puertas
    game.addVisual(puertaAPrimerPiso)
    puertaAPrimerPiso.ubicarEn(game.at(8,5))


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