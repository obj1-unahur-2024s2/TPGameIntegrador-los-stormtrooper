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

object dormitorio {
  var property image = "fondoDormitorioV5.png" 
  var property position = game.origin()

  const musicaAmviente = ambiente2

  method reproducirMusica() {
    musicaAmviente.sonar()
    musicaAmviente.loop()
  }

  method iniciar() {
    //------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionDormitorio)
    self.reproducirMusica()

    //------------------------------------------------------ubicacion objetos    
    //--puertas
    habitacion.ubicarEnTablero(puertaABiblioteca, 5, 2)

    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 10)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 1)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 9, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 0, 0)//x min Izquierda

    //--Items
    self.ubicacionDeLosItemsSegunElModo() 

    //Items en Inventario
    barraItems.refreshListaDeItems()

    //textos
    habitacion.ubicarEnTablero(objClaveEspejo, 3, 9)
    habitacion.ubicarEnTablero(objClaveReloj, 2, 9)
    habitacion.ubicarEnTablero(objPuertaSinUso, 1,6)
    

    game.addVisual(new FantasmaDiagonal(position = limitesFantasmas.ubicacionRandom(), velocidad = 800))
    game.addVisual(new FantasmaDiagonal(position = limitesFantasmas.ubicacionRandom(), velocidad = 1000))
    //game.addVisual(new FantasmaDiagonalOpuesto(position = limitesFantasmas.ubicacionRandom(), velocidad = 900))//op
    self.enModoDificil()
    
    //--personaje
    personaje.ubicacion("dormitorio")    
    habitacion.ubicarPersonaje(5, 3)

  }

  method enModoDificil() {
    if(personaje.dificultad()==2){
      game.addVisual(new FantasmaPerseguidor(position = limitesFantasmas.ubicacionRandom(), velocidad = 2000))
    }
  }

  method ubicacionDeLosItemsSegunElModo() {
    if(personaje.dificultad()==1){
      habitacion.ubicarUnKeyItem(itemLlaveSotano, 8, 8)
      habitacion.ubicarEnTablero(objCofreDormi, 5, 8)
    }
    else{
      habitacion.ubicarUnKeyItem(itemLlaveSotano, 8, 8)
      habitacion.ubicarUnKeyItem(itemNota3, 3, 4)
      
      if(itemLlaveTerraza.enInventario())
        habitacion.ubicarUnKeyItem(itemGema1, 5, 8) 
    }
  }

}