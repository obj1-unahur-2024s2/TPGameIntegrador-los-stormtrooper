import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import entrada.*
import wollok.game.*
import barraItems.*
import tablero.*

object musica {
  var property image = "fondoMusicaV5.png" 
  var property position = game.origin()

  method iniciar() {
    //------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionMusica)

    //------------------------------------------------------estado del personaje
    //personaje.inicioDePartida(false)
    personaje.ubicacion("musica")

    //------------------------------------------------------ubicacion objetos
    //--personaje
    habitacion.ubicarPersonaje(2, 4)

    //--puertas
    habitacion.ubicarEnTablero(puertaAEntrada, 1, 4)

    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 11)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 0)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 11, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 0, 0)//x min Izquierda

    //--Items
    habitacion.ubicarUnKeyItem(itemEmblema, 2, 9)
    habitacion.ubicarUnKeyItem(itemNota1, 6, 2)
    habitacion.ubicarUnKeyItem(itemNota3, 9, 10)

    
    
    habitacion.ubicarEnTablero(txtClavePolvo1, 9, 10)

    //Items en Inventario
    barraItems.verificar()
  }

}