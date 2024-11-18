import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import entrada.*
import wollok.game.*
import barraItems.*
import tablero.*

object biblioteca {
  var property image = "fondoBibliotecaV3.png" 
  var property position = game.origin()

  method iniciar() {
    //-------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionBiblioteca)
   
    //------------------------------------estado del personaje
    //personaje.inicioDePartida(false)//

    //-------------------------------------Ubicaciones
    //--Ubicacion del personaje segun ekl lugar
    if(personaje.ubicacion() =="primerPiso"){// desde el primer piso
      habitacion.ubicarPersonaje(2, 5)
      }
    else{//desde dormitorio
      habitacion.ubicarPersonaje(5, 9)
      }
    //identificador de ubicacion del personaje 
    personaje.ubicacion("biblioteca")

    //--puertas
    habitacion.ubicarEnTablero(puertaAPrimerPiso, 1, 5)
    habitacion.ubicarEnTablero(puertaADormitorio, 5, 10)

    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 11)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 0)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 9, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 0, 0)//x min Izquierda

    //--Items
    habitacion.ubicarUnKeyItem(itemLlaveMusica, 8, 6)
    habitacion.ubicarUnKeyItem(itemEncendedor, 1, 9)
    
    //--textos
//<<<<<<< HEAD
    habitacion.ubicarEnTablero(txtEspejo, 2, 10)
    habitacion.ubicarEnTablero(txtSillaRota, 2, 2)

    
//=======
    habitacion.ubicarEnTablero(txtComentariosDeMas, 8, 10)

//>>>>>>> 80e25f83126c53d5bfcc3e02b0b193e17ab706d2
    //Items en Inventario
    barraItems.verificar()

  }

}