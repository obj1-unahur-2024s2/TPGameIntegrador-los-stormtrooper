import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import entrada.*
import wollok.game.*
import barraItems.*
import tablero.*
import fantasma.*



object comedor {
  var property image = "fondoComedorV5.png" 
  var property position = game.origin()

  method iniciar() {
    //-------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionComedor)

    //-------------------------------------estado del personaje
    personaje.inicioDePartida(false)//

    //-------------------------------------Ubicaciones
    //--Ubicacion del personaje segun ekl lugar
    if(personaje.ubicacion() =="entrada")// desde la entrada
      habitacion.ubicarPersonaje(9, 4)
    else//desde cocina
      habitacion.ubicarPersonaje(3, 9)
    //identificador de ubicacion del personaje 
    personaje.ubicacion("comedor")

    //--puertas
    habitacion.ubicarEnTablero(puertaAEntrada, 10, 4)
    habitacion.ubicarEnTablero(puertaACocina, 3, 10)

    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 11)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 0)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 11, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 0, 0)//x min Izquierda

    //--Items
    habitacion.ubicarUnKeyItem(itemLlaveTerraza, 6, 5)
    habitacion.ubicarUnKeyItem(itemLlaveDormi, 5, 9)

    //Textos
    habitacion.ubicarEnTablero(txtComida, 4, 6)
    habitacion.ubicarEnTablero(txtRoto, 10, 7)
    habitacion.ubicarEnTablero(txtCuadro, 1, 10)
    habitacion.ubicarEnTablero(txtPlanta, 2, 9)

    //Items en Inventario
    barraItems.verificar()

    //game.addVisual(fantasmaDiagona1)

  }

}