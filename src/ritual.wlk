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
  var property contador = 0

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
    
    game.addVisual(agis)
    agis.animar()
    
    antorcha1.animar()
    antorcha2.animar()
    antorcha3.animar()
    antorcha4.animar()
    antorcha5.animar()
    
    //--Antorchas
    habitacion.ubicarEnTablero(antorcha1, 6, 10)
    habitacion.ubicarEnTablero(antorcha2, 1, 7)
    habitacion.ubicarEnTablero(antorcha3, 10, 7)
    habitacion.ubicarEnTablero(antorcha4, 3, 2)
    habitacion.ubicarEnTablero(antorcha5, 8, 2)

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

  method aparecerPuerta() {
    if(contador >=5)
      habitacion.ubicarEnTablero(puertaATunelSalida, 4, 10)     
  }

  
}
//------------------------------------------------------------------------------------------------Clase Antrocha
class Antorcha {
  var property image = "torch_1V2.png"
  var property position = game.origin()
  const numeroComparador
  const numeroFinal

  var property contador=1

  

  method animar() {
    game.onTick(5,"Antorcha",{self.animacion()})
  }

  method animacion() {
    if(contador !=4){
      image = "torch_"+contador+"V2.png"
      contador += 1
    }
    else{
      contador =1
      image = "torch_"+contador+"V2.png"
    }

  }
  method ubicarEn(unaUbicacion) {
    self.position(unaUbicacion)  
  }

  method interaccion() {//utiliza la colicion
    self.destruir(ritual)
  }
  method mostrarMensaje(unMensaje) {
    game.addVisual(unMensaje)//--muestra texto--
    game.schedule(2500, { => game.removeVisual(unMensaje)})
  }

  method destruir(unRitual) {
    if(itemPolvoEstrellas.enInventario()){//si tenes el polvo
        if(unRitual.contador()==numeroComparador || unRitual.contador()==numeroFinal){//si haces la combinacion correcta
          self.sumar(unRitual)
          if(unRitual.contador()<=4)
            self.mostrarMensaje(txtAntorchaOk)//mensaje OK
          else
            self.mostrarMensaje(txtMaldicionRota)//mensaje MAL
          unRitual.aparecerPuerta()//verifica si se habrio la puerta
        }
        else{//si haces MAL la combinacion
          self.reiniciar(unRitual)
          self.mostrarMensaje(txtAntorchaMal)
        }
    }
    else//si NO tenes el polvo. PERDISTE
      self.mostrarMensaje(txtAntorchaSinPolvo)
  }
  
  method sumar(unRitual) {
    unRitual.sumar()
  }
  method reiniciar(unRitual) {
    unRitual.reiniciar()
  }
}

const antorcha1 = new Antorcha(numeroComparador = 0, numeroFinal = 0)
const antorcha2 = new Antorcha(numeroComparador = 1, numeroFinal = 1)
const antorcha3 = new Antorcha(numeroComparador = 2, numeroFinal = 2)
const antorcha4 = new Antorcha(numeroComparador = 3, numeroFinal = 3)
const antorcha5 = new Antorcha(numeroComparador = 4, numeroFinal = 5)

//-------------------------------------------------------------------------------------------Agis
object agis {
  var property image = "AgisF1V2.png"
  const property position = game.at(2, 3)
  var property contador=1

  method animar() {
    game.onTick(5,"Agis",{self.animacion()})
  }

  method animacion() {
    if(contador !=15){
      image = "AgisF"+contador+"V2.png"
      contador += 1
    }
    else{
      contador =1
      image = "AgisF"+contador+"V2.png"
    }

  }
}

/*
    method inicializar(){
        controlTeclado.inicializar(toni)
        toni.position(controlDeMovimientos.defaultPosition())
        game.addVisual(toni)
        
        (1..game.height()-2).forEach{ value => 
            game.schedule(value * 1000, {
                const enemigo = new Enemigo(position= game.at((0..game.width()-1).anyOne(),value))
                controlDeColisiones.inicializar(enemigo)
                
                if(0.randomUpTo(1) <= 0.5) 
                    self.cambiarDireccionDerecha(enemigo, "Evento-" + value)
                else 
                    self.cambiarDireccionIzquierda(enemigo, "Evento-" + value)
               // game.addVisual(enemigo)
            })    
        }
    }
*/