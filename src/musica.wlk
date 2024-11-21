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
    habitacion.ubicarUnKeyItem(itemEmblema, 2, 9)
    habitacion.ubicarUnKeyItem(itemNota1, 6, 2)
    habitacion.ubicarUnKeyItem(itemNota3, 9, 10)

    //--textos
    habitacion.ubicarEnTablero(objPuertaSinUso, 4, 10)
    habitacion.ubicarEnTablero(objClavePolvo1, 9, 10)
    habitacion.ubicarEnTablero(objArpa, 9,8)

    //Items en Inventario
    barraItems.refreshListaDeItems()

    game.addVisual(fantasmaDiagonalMusica1)
    game.addVisual(fantasmaDiagonalMusica2)
    game.addVisual(fantasmaDiagonalMusica3)

    //--personaje
    habitacion.ubicarPersonaje(2, 4)
  }

}