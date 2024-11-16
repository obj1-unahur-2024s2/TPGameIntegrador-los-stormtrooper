import entradaPrimerPiso.*
import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import entrada.*
import wollok.game.*
import tablero.*
import barraItems.*

object tunel {
  var property image = "fondoTunelV2.png" 
  var property position = game.origin()

  method iniciar() {
    //------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionTunel)
    //------------------------------------------------------estado del personaje
    //personaje.inicioDePartida(false)
    personaje.ubicacion("tunel")


    //------------------------------------------------------ubicacion objetos
    //--personaje
    habitacion.ubicarPersonaje(6, 1)
    

    //--puertas
    game.addVisual(puertaARitual)
    puertaARitual.ubicarEn(game.at(5,9))


    //--Items

    //Items en Inventario
    barraItems.verificar()

    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 10)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 0)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 7, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 4, 0)//x min Izquierda
  }

}