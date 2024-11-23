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
import musicaSonido.*

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
      fantasmas */

object entrada {
  const property image = "fondoEntradaV8.png" 
  var property position = game.origin()
  
  //--musica--
  const musicaAmbiente = ambiente1
  method reproducirMusica() {
    musicaAmbiente.sonar()
    musicaAmbiente.loop()
  }

  method iniciar() {    
    //----------------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionEntrada)
    self.reproducirMusica()
    //----------------------------------------------------------------Ubicaciones

    //--Puertas
    habitacion.ubicarEnTablero(puertaAComedor, 1, 4)
    habitacion.ubicarEnTablero(puertaAMusica, 10, 4)
    habitacion.ubicarEnTablero(escaleraAPrimerPiso, 5, 7)
    
    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 11)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 0)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 11, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 0, 0)//x min Izquierda

    //Textos
    habitacion.ubicarEnTablero(objNadaImportante, 3, 1)
    habitacion.ubicarEnTablero(objNadaSilla, 7, 9)
    habitacion.ubicarEnTablero(objEspejo, 2, 10)
    habitacion.ubicarEnTablero(objJarron, 4, 10)
    habitacion.ubicarEnTablero(objSillaRota, 8, 7)

    //--Items en Inventario
    barraItems.refreshListaDeItems()

    //--Items
    self.ubicacionDeLosItemsSegunElModo()
    //habitacion.ubicarUnKeyItem(itemNota3P2, 3, 9)
    
    //--Texto especial de ayuda--
    //if(itemNota3.enInventario())
      //habitacion.ubicarEnTablero(objClavePolvo2, 3, 9)
    

    //--fantasmas
    game.addVisual(fantasmaDiagonaEntrada1)
    self.enModoDificil()
    
    /*
    game.schedule(500, {=>
      game.addVisual(fantasmaDiagonaEntrada1)
      game.addVisual(fantasmaDiagonaEntrada2)
    })
    */
    //game.addVisual(fantasmaDiagonaEntrada3)
    
    
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
  }

  method enModoDificil() {
    if(personaje.dificultad()==2){
      //game.addVisual(fantasmaPerseguidorEntrada1)
      game.addVisual(fantasmaDiagonaEntrada2)
    }
  }

  method ubicacionDeLosItemsSegunElModo() {
    if(personaje.dificultad()==1){
      habitacion.ubicarUnKeyItem(itemNota3P2, 3, 9)
      
      if(itemNota3.enInventario())
        habitacion.ubicarEnTablero(objClavePolvo2, 3, 9)      
    }
    else{
      habitacion.ubicarUnKeyItem(itemNota3P2, 8, 2)
      
      if(itemNota3.enInventario())
        habitacion.ubicarEnTablero(objClavePolvo2, 8, 2)  
    }
  }

}
