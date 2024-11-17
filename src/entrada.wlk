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
import ritual.*

/*--INDICE--
-inicio de panel
-ubicar al personaje segun las puertas
-identificador de habitacion

-Objetos que se muestran en pantalla-
    puertas
    limites
    items
    textos
    inventario
    fantasmas
*/

object entrada {
  const property image = "fondoEntradaV8.png" 
  var property position = game.origin()

  method iniciar() {    
    //----------------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionEntrada)
    tituloJuego.activarMenu(false)
    //----------------------------------------------------------------Ubicaciones
    //--Ubicacion del personaje segun de donde viene--
	  if(personaje.inicioDePartida())// ubicacion inicial
      habitacion.ubicarPersonaje(5, 1)
    else if(personaje.ubicacion() =="comedor")// volver del comedor
      habitacion.ubicarPersonaje(2, 4)
    else if(personaje.ubicacion() =="musica")// volver de musica
      habitacion.ubicarPersonaje(9, 4)
    else if(personaje.ubicacion() =="primerPiso")// volver de 1er piso
      habitacion.ubicarPersonaje(6, 6)
    //identificador de ubicacion del personaje 
    personaje.ubicacion("entrada")

    //game.addVisual(agis)
    //agis.animar()

    //--Puertas
    habitacion.ubicarEnTablero(puertaAComedor, 1, 4)
    habitacion.ubicarEnTablero(puertaAMusica, 10, 4)
    habitacion.ubicarEnTablero(escaleraAPrimerPiso, 5, 7)
    
    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 11)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 0)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 11, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 0, 0)//x min Izquierda
    //--Items
    habitacion.ubicarUnKeyItem(itemNota3P2, 3, 9)
    if(itemNota3.enInventario())
      habitacion.ubicarEnTablero(txtClavePolvo2, 3, 9)
    
    //Textos
    habitacion.ubicarEnTablero(txtNadaImportante, 3, 1)
    habitacion.ubicarEnTablero(txtNadaSilla, 7, 9)

    //Items en Inventario
    barraItems.verificar()

    //fantasmas
    game.addVisual(fantasmaDiagonaEntrada1)
    game.addVisual(fantasmaDiagonaEntrada2)
    game.addVisual(fantasmaDiagonaEntrada3)

    //game.addVisual(fantasmaDiagonaEntradaOP1)
    
    //habitacion.ubicarEnTablero(corazonvida1, 0, 10)
  }

}
