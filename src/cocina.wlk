import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import entrada.*
import wollok.game.*
import barraItems.*
import tablero.*

object cocina {
  var property image = "fondoCocinaV2.png" 
  var property position = game.origin()

  method iniciar() {
    //------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionCocina)

    //------------------------------------------------------estado del personaje
    //personaje.inicioDePartida(false)
    personaje.ubicacion("cocina")

    //------------------------------------------------------ubicacion objetos
    //--personaje
    habitacion.ubicarPersonaje(4, 2)
    // va a cambiar

    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 10)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 0)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 11, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 1, 0)//x min Izquierda

    //--puertas
    habitacion.ubicarEnTablero(puertaAComedor, 4, 1)

    //--Items

    //Items en Inventario
    barraItems.verificar()
  
  }

}