import puertas.*
import objetos.*
//import titulo.*
import personaje.*
import textos.*
import entrada.*
//import wollok.game.*
import barraItems.*
import tablero.*
import musicaSonido.*
import fantasma.*

object biblioteca {
  var property image = "fondoBibliotecaV3.png" 
  var property position = game.origin()

  const musicaAmviente = ambiente2

  method reproducirMusica() {
    musicaAmviente.sonar()
    musicaAmviente.loop()
  }

  method iniciar() {
    //--propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionBiblioteca)
    self.reproducirMusica()
    //------------------------------------------------------------------Ubicaciones
    //--puertas
    habitacion.ubicarEnTablero(puertaAPrimerPiso, 1, 5)
    habitacion.ubicarEnTablero(puertaADormitorio, 5, 10)

    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 11)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 0)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 9, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 0, 0)//x min Izquierda

    //--Items
    self.ubicacionDeLosItemsSegunElModo()  
    
    //--textos
    habitacion.ubicarEnTablero(objEspejo, 2, 10)
    habitacion.ubicarEnTablero(objSillaRota, 2, 2)

    habitacion.ubicarEnTablero(objBiblioInfo1, 7, 9)
    habitacion.ubicarEnTablero(objBiblioInfo2, 1, 7)
    habitacion.ubicarEnTablero(objBiblioInfo3, 8, 3)
    habitacion.ubicarEnTablero(objBiblioInfo4, 7, 3)
    habitacion.ubicarEnTablero(objComentariosDeMas, 8, 10)

    //--Items en Inventario
    barraItems.refreshListaDeItems()

    game.addVisual(new FantasmaDiagonal(position = limitesFantasmas.ubicacionRandom(), velocidad = 800))
    game.addVisual(new FantasmaDiagonal(position = limitesFantasmas.ubicacionRandom(), velocidad = 900))
    //game.addVisual(new FantasmaDiagonalOpuesto(position = limitesFantasmas.ubicacionRandom(), velocidad = 1000))//op
    self.enModoDificil()

    //--Ubicacion del personaje segun ekl lugar
    if(personaje.ubicacion() =="primerPiso"){// desde el primer piso
      habitacion.ubicarPersonaje(2, 5)
      }
    else{//desde dormitorio
      habitacion.ubicarPersonaje(5, 9)
      }
    //identificador de ubicacion del personaje 
    personaje.ubicacion("biblioteca")
  }

  method enModoDificil() {
    if(personaje.dificultad()==2){
      game.addVisual(new FantasmaDiagonal(position = limitesFantasmas.ubicacionRandom(), velocidad = 2000))
      game.addVisual(new FantasmaPerseguidor(position = limitesFantasmas.ubicacionRandom(), velocidad = 2000))
    }
  }

  method ubicacionDeLosItemsSegunElModo() {
    if(personaje.dificultad()==1){
      habitacion.ubicarUnKeyItem(itemLlaveMusica, 8, 6)
      habitacion.ubicarUnKeyItem(itemEncendedor, 1, 9)
    }
    else{
      habitacion.ubicarUnKeyItem(itemLlaveTerraza, 1, 3)
      habitacion.ubicarUnKeyItem(itemPolvoEstrellas, 8, 1)
      
      if(itemPolvoEstrellas.enInventario())
        habitacion.ubicarUnKeyItem(itemGema6, 8, 8) 
    }
  }
}