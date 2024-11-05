import barraItems.*
import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import wollok.game.*
import tablero.*

object entrada {
  const property image = "fondoEntradaV8.png" 
  var property position = game.origin()

  method iniciar() {    
    //----------------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionEntrada)
    
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

    //Textos
    habitacion.ubicarEnTablero(txtNadaImportante, 3, 1)

    //Items en Inventario
    barraItems.verificar()
            
    const ancho = game.width()-2
		const largo = game.height()-2    
		//(0 .. ancho-1).forEach { n => new Arbusto(position = new Position(x = n, y = 1)).dibujar() } // bordeAbajo
		//(0 .. ancho-1).forEach { n => new Arbusto(position = new Position(x =n, y = largo)).dibujar() } // bordeArriba 
		//(0 .. largo).forEach { n => new Arbusto(position = new Position(x =2, y = n)).dibujar() } // bordeIzq 
		//(0 .. largo).forEach { n => new Arbusto(position = new Position(x =ancho, y = n)).dibujar() } // bordeDer
  }

}
class Arbusto {
	var property position
	
	method dibujar() {
		game.addVisual(self)
	}

	method image() = "key1.png"
  method interaccion(){}
}

