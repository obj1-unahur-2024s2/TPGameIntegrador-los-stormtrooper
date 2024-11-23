import barraItems.*
import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import entrada.*
import wollok.game.*
import terraza.*
import tablero.*
import musicaSonido.*
import fantasma.*

object entradaPrimerPiso {
  var property image = "fondoEntrada1PV8.png" 
  var property position = game.origin()

  const musicaAmviente = ambiente2

  method reproducirMusica() {
    musicaAmviente.sonar()
    musicaAmviente.loop()
  }  

  method iniciar() {
    //------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionPrimerPiso)
    self.reproducirMusica()
    //------------------------------------------------------estado del personaje
    personaje.inicioDePartida(false)

    //------------------------------------------------------ubicacion objetos
    //--puertas
    habitacion.ubicarEnTablero(escaleraAEntrada, 6, 2)
    habitacion.ubicarEnTablero(puertaATerraza, 1, 5)
    habitacion.ubicarEnTablero(puertaABiblioteca, 10, 5)
    
    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 9)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 1)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 11, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 0, 0)//x min Izquierda
    
    //--Items

    //Items en Inventario
    barraItems.refreshListaDeItems()

    //texto
    habitacion.ubicarEnTablero(objPlanta, 1, 7)

    game.schedule(500, {=>
      game.addVisual(fantasmaDiagonalPrimerPiso1)

    })
    self.enModoDificil()
  
    //--Ubicacion del personaje segun el lugar    
    if(personaje.ubicacion() =="entrada")// desde entrada
      habitacion.ubicarPersonaje(5, 3)
    else if(personaje.ubicacion() =="terraza")// desde la terraza
      habitacion.ubicarPersonaje(2, 5)
    else if(personaje.ubicacion() =="biblioteca")// desde la biblioteca
      habitacion.ubicarPersonaje(9, 5)
    //identificador de ubicacion del personaje 
    personaje.ubicacion("primerPiso")
  }
  
  method enModoDificil() {
    if(personaje.dificultad()==2){
      game.addVisual(fantasmaPerseguidorPrimerPiso1)
    }
  }
}