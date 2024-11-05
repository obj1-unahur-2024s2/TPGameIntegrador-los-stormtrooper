import barraItems.*
import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import entrada.*
import wollok.game.*
import terraza.*
import tablero.*

object entradaPrimerPiso {
  var property image = "fondoEntrada1PV8.png" 
  var property position = game.origin()

  method iniciar() {
    //------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionPrimerPiso)
   
    //------------------------------------------------------estado del personaje
    personaje.inicioDePartida(false)

    //------------------------------------------------------ubicacion objetos
    //--personaje
    //--Ubicacion del personaje segun el lugar    
    if(personaje.ubicacion() =="entrada")// desde entrada
      habitacion.ubicarPersonaje(5, 3)
    else if(personaje.ubicacion() =="terraza")// desde la terraza
      habitacion.ubicarPersonaje(2, 5)
    else if(personaje.ubicacion() =="biblioteca")// desde la biblioteca
      habitacion.ubicarPersonaje(9, 5)
    //identificador de ubicacion del personaje 
    personaje.ubicacion("primerPiso")

    //--puertas
    habitacion.ubicarEnTablero(escaleraAEntrada, 6, 2)
    habitacion.ubicarEnTablero(puertaATerraza, 1, 5)
    habitacion.ubicarEnTablero(puertaABiblioteca, 10, 5)
    
    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 9)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 1)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 11, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 0, 0)//x min Izquierda
    
    //--Items

    //Items en Inventario
    barraItems.verificar()

  }

}