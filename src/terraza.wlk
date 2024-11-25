import entradaPrimerPiso.*
import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
//import entrada.*
//import wollok.game.*
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

    //------------------------------------------------------ubicacion objetos
    //--puertas
    habitacion.ubicarEnTablero(puertaAPrimerPiso, 10, 4)

    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 9)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 1)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 11, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 2, 0)//x min Izquierda

    //--Items
    self.ubicacionDeLosItemsSegunElModo()  
    
    //--Items en Inventario
    barraItems.refreshListaDeItems()

    //--fantasmas
    game.addVisual(new FantasmaDiagonal(position = limitesFantasmas.ubicacionRandom(), velocidad = 700))
    game.addVisual(new FantasmaDiagonalOpuesto(position = limitesFantasmas.ubicacionRandom(), velocidad = 1000))
    self.enModoDificil()
    
    //--personaje
    personaje.ubicacion("terraza")
    habitacion.ubicarPersonaje(9, 4) 
  }
  //--modo dificil fantasmas
  method enModoDificil() {
    if(personaje.dificultad()==2){
      game.addVisual(new FantasmaDiagonal(position = limitesFantasmas.ubicacionRandom(), velocidad = 500))
    }
  }  
  
  method ubicacionDeLosItemsSegunElModo() {
    if(personaje.dificultad()==1){
      habitacion.ubicarUnKeyItem(itemDisco, 6, 7)
      habitacion.ubicarUnKeyItem(itemLlaveCocina, 3, 6)
    }
    else{
      habitacion.ubicarUnKeyItem(itemLlaveCocina, 3, 6)
      
      if(itemLlaveSotano.enInventario())
        habitacion.ubicarUnKeyItem(itemGema5, 5, 3) 
    }
  }
}