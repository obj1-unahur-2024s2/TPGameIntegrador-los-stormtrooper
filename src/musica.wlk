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

object musica {
  var property image = "fondoMusicaV5.png" 
  var property position = game.origin()

  const musicaAmviente = ambiente1

  method reproducirMusica() {
    musicaAmviente.sonar()
    musicaAmviente.loop()
  }

  method iniciar() {
    //------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionMusica)
    self.reproducirMusica()
    //------------------------------------------------------estado del personaje
    personaje.ubicacion("musica")

    //------------------------------------------------------ubicacion objetos
    //--puertas
    habitacion.ubicarEnTablero(puertaAEntrada, 1, 4)

    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 11)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 0)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 11, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 0, 0)//x min Izquierda

    //--Items
    self.ubicacionDeLosItemsSegunElModo()

    //--textos
    habitacion.ubicarEnTablero(objPuertaSinUso, 4, 10)
    habitacion.ubicarEnTablero(objClavePolvo1, 9, 10)
    habitacion.ubicarEnTablero(objArpa, 9,8)

    //Items en Inventario
    barraItems.refreshListaDeItems()

    game.addVisual(new FantasmaDiagonal(position = limitesFantasmas.ubicacionRandom(), velocidad = 800))
    game.addVisual(new FantasmaDiagonal(position = limitesFantasmas.ubicacionRandom(), velocidad = 900))
    //game.addVisual(new FantasmaDiagonalOpuesto(position = limitesFantasmas.ubicacionRandom(), velocidad = 1000))
    self.enModoDificil()

    //--personaje
    habitacion.ubicarPersonaje(2, 4)
  }

  method enModoDificil() {
    if(personaje.dificultad()==2){
      game.addVisual(new FantasmaDiagonal(position = limitesFantasmas.ubicacionRandom(), velocidad = 2000))
      game.addVisual(new FantasmaPerseguidor(position = limitesFantasmas.ubicacionRandom(), velocidad = 2000))
    }
  }
    method ubicacionDeLosItemsSegunElModo() {
    if(personaje.dificultad()==1){
      habitacion.ubicarUnKeyItem(itemEmblema, 2, 9)
      habitacion.ubicarUnKeyItem(itemNota1, 6, 2)
      habitacion.ubicarUnKeyItem(itemNota3, 9, 10)
    }
    else{
      habitacion.ubicarUnKeyItem(itemEmblema, 2, 9)
      habitacion.ubicarUnKeyItem(itemNota1, 6, 2)

      if(itemLlaveDormi.enInventario())
        habitacion.ubicarUnKeyItem(itemGema3, 9, 2)

    }
  }
}