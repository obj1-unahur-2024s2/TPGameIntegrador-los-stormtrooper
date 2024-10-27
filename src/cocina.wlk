import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import entrada.*
import wollok.game.*

object cocina {
  var property image = "fondoCocina.png" 
  var property position = game.origin()

  method iniciar() {
    //------------------------------------------------------propiedades de tablero
    self.borraTodo()
    game.addVisual(self)

    game.addVisual(ubicacionCocina)
    game.schedule(2000, { => game.removeVisual(ubicacionCocina)})// despues de 2s elimina el texto1

    //------------------------------------------------------estado del personaje
    personaje.inicioDePartida(false)
    personaje.ubicacion(6)
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
    personaje.irA(game.at(2,2))
    // va a cambiar








    //--puertas
    game.addVisual(puertaAComedor)
    puertaAComedor.ubicarEn(game.at(2,1))

    //puerta sotano











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