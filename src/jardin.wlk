import entradaPrimerPiso.*
import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import entrada.*
import wollok.game.*
import tablero.*
import musicaSonido.*

object jardin {
  var property image = "fondoJardinV5.png" 
  var property position = game.origin()

  const musicaAmviente = salaJardin

  method reproducirMusica() {
    musicaAmviente.sonar()
    musicaAmviente.loop()
  }  

  method iniciar() {
    //------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self, ubicacionJardinTrasero)
    self.reproducirMusica()
    //------------------------------------------------------estado del personaje
    personaje.ubicacion(11)

    //------------------------------------------------------ubicacion objetos
    game.addVisual(katyLast)
    katyLast.animar()
    //--personaje
    habitacion.ubicarPersonaje(5, 1)
    
    //--puertas

    //--Items

    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 7)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 0)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 6, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 4, 0)//x min Izquierda
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
  method interaccion() {
    game.addVisual(fraseFinal)
    game.schedule(11000, {=>
      game.removeVisual(fraseFinal)
      game.addVisual(fraseEnd)
      })
    game.schedule(12000, {=>game.stop()})
  }
}

object fraseFinal {
  method position() = game.at(5,8)
  method textColor() = "#ffffff"

  method text() = " Katyyy!! 
        Estas aquí! Pudiste escapar también!...

        ...Volvamos a casa...
        El sótano se derrumbo, 
        ya no hay nada que temer.."
}
object fraseEnd {
  method position() = game.at(5,8)
  method textColor() = "#ffffff"

  method text() =           "FIN
        ¡¡Muchas Gracias por Jugar!!"
}