import entradaPrimerPiso.*
import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import entrada.*
import wollok.game.*
import barraItems.*
import tablero.*

object dormitorio {
  var property image = "fondoDormitorioV5.png" 
  var property position = game.origin()

  method iniciar() {
    //------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionDormitorio)

    //------------------------------------------------------estado del personaje
    //personaje.inicioDePartida(false)
    personaje.ubicacion("dormitorio")

    //------------------------------------------------------ubicacion objetos
    //--personaje
    habitacion.ubicarPersonaje(5, 3)
    
    //--puertas
    habitacion.ubicarEnTablero(puertaABiblioteca, 5, 2)

    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 10)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 1)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 9, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 0, 0)//x min Izquierda

    //--Items
    habitacion.ubicarUnKeyItem(itemLlaveSotano, 8, 8)

    //Items en Inventario
    barraItems.verificar()
  
  }

}