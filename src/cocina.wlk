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

object cocina {
  var property image = "fondoCocinaV3.png" 
  var property position = game.origin()

  const musicaAmviente = ambiente1

  method reproducirMusica() {
    musicaAmviente.sonar()
    musicaAmviente.loop()
  }

  method iniciar() {
    //------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionCocina)
    self.reproducirMusica()
    //------------------------------------------------------estado del personaje
    //personaje.inicioDePartida(false)
    personaje.ubicacion("cocina")

    //------------------------------------------------------ubicacion objetos
    //--personaje
    habitacion.ubicarPersonaje(4, 2)
    // va a cambiar

    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 10)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 0)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 11, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 1, 0)//x min Izquierda

    //--puertas
    habitacion.ubicarEnTablero(puertaAComedor, 4, 1)
    habitacion.ubicarEnTablero(puertaATunel, 9, 7)

    //--Items
    habitacion.ubicarUnKeyItem(itemNota2, 9, 2)
    habitacion.ubicarUnKeyItem(itemPolvoEstrellas, 7, 8)

    //Items en Inventario
    barraItems.verificar()
  
    //Textos
    habitacion.ubicarEnTablero(txtComida, 5, 6)
    habitacion.ubicarEnTablero(txtReloj, 8, 9)
    habitacion.ubicarEnTablero(txtSillaRota, 5, 3)

    game.addVisual(fantasmaDiagonalCocina1)
    game.addVisual(fantasmaDiagonalCocina2)
    game.addVisual(fantasmaDiagonalCocina3)

  }

}