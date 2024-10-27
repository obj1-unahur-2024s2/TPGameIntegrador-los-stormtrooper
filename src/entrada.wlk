import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import wollok.game.*

object entrada {
  var property image = "fondoEntradaV2.png" 
  var property position = game.origin()
  
  method iniciar() {    
    //----------------------------------------------------------------propiedades de tablero
    self.borraTodo()//inicializa el tablero
    game.addVisual(self)
    
    //--texto indicador de lugar--
    game.addVisual(ubicacionEntrada)
    game.schedule(2000, { => game.removeVisual(ubicacionEntrada)})

    //----------------------------------------------------------------Ubicaciones
    //--Ubicacion del personaje segun de donde viene--
	  if(personaje.inicioDePartida()){// ubicacion inicial
      game.addVisualCharacter(personaje)
      personaje.irA(game.at(5,1))
      }
    else if(personaje.ubicacion() ==1){// volver de la cocina
      game.addVisualCharacter(personaje)
      personaje.irA(game.at(2,5))
      }
    else if(personaje.ubicacion() ==2){// volver de musica
      game.addVisualCharacter(personaje)
      personaje.irA(game.at(7,5))
      }
    else if(personaje.ubicacion() ==3){// volver de 1er piso
      game.addVisualCharacter(personaje)
      personaje.irA(game.at(5,5))
      }
    //identificador de ubicacion del personaje 
    personaje.ubicacion(0)
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

    //--Puertas
    game.addVisual(puertaAComedor)
    puertaAComedor.ubicarEn(game.at(1,5))//(x,y) 0 a 9

    game.addVisual(puertaAMusica)
    puertaAMusica.ubicarEn(game.at(8,5))
    //Escalera
    game.addVisual(escaleraAPrimerPiso)
    escaleraAPrimerPiso.ubicarEn(game.at(4,6))

    //--Items

    //--elimina el obj si ya fue obtenido--
    if(!llave1.enInventario())
      game.addVisual(llave1)
      llave1.ubicarEn(game.at(1,8))
    
    //texto prueba
    game.addVisual(prueba1)
    prueba1.ubicarEn(game.at(8,1))
    
    //--colicion con los objetos--
    //game.whenCollideDo(personaje, { elemento => elemento.interaccion()})
  }

  //--limpia la pantalla.--
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
