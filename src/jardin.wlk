import entradaPrimerPiso.*
import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import entrada.*
import wollok.game.*
import tablero.*

object jardin {
  var property image = "fondoJardinV5.png" 
  var property position = game.origin()

  method iniciar() {
    //------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self, ubicacionJardinTrasero)

    //------------------------------------------------------estado del personaje
    personaje.ubicacion(11)

    //------------------------------------------------------ubicacion objetos
    //--personaje
    habitacion.ubicarPersonaje(5, 1)
    
    //--puertas

    //--Items

    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 7)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 0)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 11, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 0, 0)//x min Izquierda
  }
}

object katyLast {
  var property image = "katyLado1.png"
  var property position = game.at(5, 6)
  var property contador=1  

  method animar() {
    game.onTick(500,"katyCurse",{self.animacion()})
  }

  method animacion() {
    if(contador !=2){
      image = "katyLado"+contador+".png"
      contador += 1
    }
    else{
      image = "katyLado"+contador+".png"
      contador =1
    }
  }
  method interaccion() {}
}