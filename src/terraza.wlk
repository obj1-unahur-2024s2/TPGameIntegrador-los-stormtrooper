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
import musicaSonido.*
import fantasma.*

object terraza {
  var property image = "fondoTerrazaV5.png" 
  var property position = game.origin()

  const musicaAmviente = ambiente2

  method reproducirMusica() {
    musicaAmviente.sonar()
    musicaAmviente.loop()
  }

  method iniciar() {
    //------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionTerraza)
    self.reproducirMusica()
    //------------------------------------------------------estado del personaje

    //------------------------------------------------------ubicacion objetos
    //--puertas
    habitacion.ubicarEnTablero(puertaAPrimerPiso, 10, 4)

    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 9)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 1)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 11, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 2, 0)//x min Izquierda

    //--Items
    habitacion.ubicarUnKeyItem(itemDisco, 6, 7)
    habitacion.ubicarUnKeyItem(itemLlaveCocina, 3, 6)
    
    //Items en Inventario
    barraItems.refreshListaDeItems()

    game.addVisual(fantasmaDiagonalTerraza1)
    game.addVisual(fantasmaDiagonalTerraza2)
    
    //--personaje
    personaje.ubicacion("terraza")
    habitacion.ubicarPersonaje(9, 4) 
  }

}