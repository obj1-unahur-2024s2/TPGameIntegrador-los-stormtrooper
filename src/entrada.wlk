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
    fantasmas
*/

object entrada {
  const property image = "fondoEntradaV8.png" 
  var property position = game.origin()
  
  const musicaAmbiente = ambiente1

  method reproducirMusica() {
    musicaAmbiente.sonar()
    musicaAmbiente.loop()
  }

  method iniciar() {    
    //----------------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionEntrada)
    //tituloJuego.activarMenu(false)
    self.reproducirMusica()
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
    habitacion.ubicarEnTablero(txtEspejo, 2, 10)
    habitacion.ubicarEnTablero(txtJarron, 4, 10)
    habitacion.ubicarEnTablero(txtSillaRota, 8, 7)

    //Items en Inventario
    barraItems.verificar()

    //fantasmas
    //game.addVisual(fantasmaDiagonaEntrada1)
    //game.addVisual(fantasmaDiagonaEntrada2)
    //game.addVisual(fantasmaDiagonaEntrada3)

    //game.addVisual(fantasmaDiagonaEntradaOP1)
    
    //habitacion.ubicarEnTablero(corazonvida1, 0, 10)
    /*
    const x = 1.randomUpTo(10).truncate(0)
    const y = 1.randomUpTo(10).truncate(0)
    //const enemigo = new FantasmaDiagonal(position= game.at(x, y), velocidad = 500)
        //position = game.at(2,5), velocidad = 500
    

    (1..10).forEach{  value => 
            game.schedule(1000, {
                const enemigo  = new FantasmaDiagonal(position= game.at(x, y)   , velocidad = 500 + value)
                const enemigo2 = new FantasmaDiagonal(position= game.at(5,value), velocidad = 500 + value)
            }) 
    }
    */
  }

}
