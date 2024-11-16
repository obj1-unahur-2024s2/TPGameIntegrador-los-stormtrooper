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

object ritual {
  var property image = "fondoRitualV2.png" 
  var property position = game.origin()
  var property contador =0

  method iniciar() {
    
    //------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionRitual)

    //------------------------------------------------------estado del personaje
    personaje.inicioDePartida(false)
    personaje.ubicacion(9)

    //------------------------------------------------------ubicacion objetos
    //--personaje
    game.addVisualCharacter(personaje)
    personaje.irA(game.at(7,1))
    

    //--puertas
    habitacion.ubicarEnTablero(puertaATunelSalida, 4, 10)

    //--Items

    //Items en Inventario
    barraItems.verificar()

    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 11)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 0)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 11, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 0, 0)//x min Izquierda

  }
  method sumar() {
    contador += 1
  }
  method reiniciar() {
    contador = 0
  }

}
class Antorcha {
  const image = "ddd"
  const numeroComparador

  method usarPolvoenAntorcha() {
    
  }
  
  method sumar(elContador) {
    elContador.sumar()
  }
  method reiniciar(elContador) {
    elContador.reiniciar()
  }
}
object antorcha1  {

}