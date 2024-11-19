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
import musicaSonido.*
import fantasma.*

object ritual {
  var property image = "fondoRitualV2.png" 
  var property position = game.origin()
  var property contador = 0
  var property estavencido = false

  const musicaAmviente = salaRitual

  method reproducirMusica() {
    musicaAmviente.sonar()
    musicaAmviente.loop()
  }  

  method iniciar() {
    //------------------------------------------------------propiedades de tablero
    habitacion.iniciarHabitacion(self,ubicacionRitual)
    
    game.schedule(1000, {=>self.reproducirMusica()})


    //--personaje
    game.addVisual(dimension)
    game.addVisualCharacter(personaje)
    personaje.irA(game.at(5,1))    
    
    
    //game.addVisual(dimension)
    game.schedule(1000, {=>
      game.removeVisual(dimension)
      game.addVisual(oscuridad)

      game.removeVisual(personaje)
      game.addVisualCharacter(personaje)
      personaje.irA(game.at(5,1))  
      })

    game.schedule(2700, {=>game.addVisual(frase)})

    game.schedule(4500, {=>
      game.removeVisual(oscuridad)
      game.addVisual(estrellas)
      game.removeVisual(personaje)
      game.addVisualCharacter(personaje)
      personaje.irA(game.at(5,1)) 
      game.removeVisual(frase)
      game.addVisualCharacter(frase)
      })

    game.schedule(6350, {=>game.removeVisual(estrellas)})


    
    //------------------------------------------------------estado del personaje
    personaje.inicioDePartida(false)
    personaje.ubicacion(9)

    //------------------------------------------------------ubicacion objetos
    //--personaje
    //game.addVisualCharacter(personaje)
    //personaje.irA(game.at(5,1))
    
    //agis
    //game.schedule(2000, {=>game.addVisual(frase)})

    game.schedule(12000, {=>
      game.removeVisual(frase)
      game.addVisual(damage)
    })
    
    game.schedule(12250, {=>
      game.removeVisual(damage)
      game.addVisual(agis)
      agis.animar()
    })
        
    //--Antorchas
    /*
    habitacion.ubicarEnTablero(antorcha1, 6, 10)
    habitacion.ubicarEnTablero(antorcha2, 1, 7)
    habitacion.ubicarEnTablero(antorcha3, 10, 7)
    habitacion.ubicarEnTablero(antorcha4, 3, 2)
    habitacion.ubicarEnTablero(antorcha5, 8, 2)
    */
    self.agregarAntorchas()
    //animacion Antorchas
    antorcha1.animar()
    antorcha2.animar()
    antorcha3.animar()
    antorcha4.animar()
    antorcha5.animar()

    //--Items

    //Items en Inventario
    barraItems.verificar()

    //Limites Tablero
    habitacion.ubicarEnTablero(topeArriba, 0, 11)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 0)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 11, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 0, 0)//x min Izquierda
    
    //fantasmas
    self.agregarFantasmas()

  }
  method agregarAntorchas() {
    game.schedule(9000, {=>habitacion.ubicarEnTablero(antorcha1, 6, 10)})
    game.schedule(9500, {=>habitacion.ubicarEnTablero(antorcha3, 10, 7)})
    game.schedule(10000, {=>habitacion.ubicarEnTablero(antorcha5, 8, 2)})
    game.schedule(10500, {=>habitacion.ubicarEnTablero(antorcha4, 3, 2)})
    game.schedule(11000, {=>habitacion.ubicarEnTablero(antorcha2, 1, 7)})
  }

  method sumar() {
    contador += 1
  }

  method reiniciar() {
    contador = 0
  }

  method agregarFantasmas() {
    //primeros 5
    self.crearFantasmaSegunTiempo(15000,fantasmaDiagonaRitual1)
    self.crearFantasmaSegunTiempo(18000,fantasmaDiagonaRitual2)
    self.crearFantasmaSegunTiempo(21000,fantasmaDiagonaRitual3)
    self.crearFantasmaSegunTiempo(24000,fantasmaDiagonaRitual4)
    self.crearFantasmaSegunTiempo(27000,fantasmaDiagonaRitual5)
    //segunada tanda
    self.crearFantasmaSegunTiempo(35000,fantasmaDiagonaRitual6)
    self.crearFantasmaSegunTiempo(40000,fantasmaDiagonaRitual7)
    self.crearFantasmaSegunTiempo(45000,fantasmaDiagonaRitual8)
    self.crearFantasmaSegunTiempo(50000,fantasmaDiagonaRitual9)
    self.crearFantasmaSegunTiempo(55000,fantasmaDiagonaRitual10)
  }

  method crearFantasmaSegunTiempo(unTiempo,unFantasma) {
    game.schedule(unTiempo, {=>
      if(!estavencido || (personaje.personajeVida()!=0 &&  !estavencido))
        game.addVisual(unFantasma)
    })  
  }

  method borrarFantasmas() {
      game.removeVisual(fantasmaDiagonaRitual1)
      game.removeVisual(fantasmaDiagonaRitual2)
      game.removeVisual(fantasmaDiagonaRitual3)
      game.removeVisual(fantasmaDiagonaRitual4)
      game.removeVisual(fantasmaDiagonaRitual5)
      game.removeVisual(fantasmaDiagonaRitual6)
      game.removeVisual(fantasmaDiagonaRitual7)
      game.removeVisual(fantasmaDiagonaRitual8)
      game.removeVisual(fantasmaDiagonaRitual9)
      game.removeVisual(fantasmaDiagonaRitual10)
  }

  method aparecerPuerta() {
    if(contador >=5){
      estavencido = true
      habitacion.ubicarEnTablero(puertaATunelSalida, 4, 10) 
      self.borrarFantasmas()//
      game.removeVisual(agis)
      game.addVisual(agisDefeated)
      agisDefeated.animar()
      game.schedule(2500, {=>game.addVisual(fraseDefeated)})
      game.schedule(7000, {=>game.removeVisual(fraseDefeated)})
    }    
  }

}//fin de metodo iniciar

//instancias fantasma
const fantasmaDiagonaRitual1 = new FantasmaDiagonal(position = game.at(1,2), velocidad = 400)
const fantasmaDiagonaRitual2 = new FantasmaDiagonal(position = game.at(2,1), velocidad = 400)
const fantasmaDiagonaRitual3 = new FantasmaDiagonal(position = game.at(3,1), velocidad = 350)
const fantasmaDiagonaRitual4 = new FantasmaDiagonal(position = game.at(4,1), velocidad = 350)
const fantasmaDiagonaRitual5 = new FantasmaDiagonal(position = game.at(5,1), velocidad = 300)

const fantasmaDiagonaRitual6 = new FantasmaDiagonal(position = game.at(6,1), velocidad = 200)
const fantasmaDiagonaRitual7 = new FantasmaDiagonal(position = game.at(7,1), velocidad = 150)
const fantasmaDiagonaRitual8 = new FantasmaDiagonal(position = game.at(8,1), velocidad = 150)
const fantasmaDiagonaRitual9 = new FantasmaDiagonal(position = game.at(9,1), velocidad = 100)
const fantasmaDiagonaRitual10 = new FantasmaDiagonal(position = game.at(10,2), velocidad = 100)
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
      contador += 1
      image = "torch_"+contador+"V2.png"
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
      contador += 1
      image = "AgisF"+contador+"V2.png"
    }
    else{
      contador =1
      image = "AgisF"+contador+"V2.png"
    }
  }
}
//--------------------------------------------------------------------------------Agis derrotado
object agisDefeated {
  var property image = "AgisDef1.png"
  const property position = game.at(2, 3)
  var property contador=1
 
  method animar() {
    game.onTick(5,"AgisDef",{self.animacion()})
  }

  method animacion() {
    if(contador !=2){
      contador += 1
      image = "AgisDef"+contador+".png"
    }
    else{
      contador =1
      image = "AgisDef"+contador+".png"
    }
  }
}
//------------------------------------------------------------------------------Frase intro
object frase {
  method position() = game.at(5,7)
  method textColor() = "#ffffff"

  method text() = "     Te he estado esperando...
      Veo que mi pequeño esclavo hizo su trabajo...
      No te enojes con el, solo tome posesión 
      de su ser para atraerte hasta aquí.
      Ya no puedes salir de este lugar...
      ¡¡ENTREGAME TU ALMA!! 
      ¡YA NO PUEDES ESCAPÁR DE MI!"
}
//-------------------------------------------------------------------------------Frase final
object fraseDefeated {
  method position() = game.at(5,7)
  method textColor() = "#ffffff"

  method text() = "     Nooo!! que has hecho!!
      No puedes irte de aquí!!
      ¡¡¡Te lo pRohiiíbOo00o0o00Ooo0o!!!"
}

object dimension {
  const property image = "dimension.png"
  var property position = game.origin()
}
object oscuridad {
  const property image = "fondoOscuridad.png"
  var property position = game.origin()
}
object estrellas {
  const property image = "fondoRitual.png"
  var property position = game.origin()
}



/*
    method inicializar(){
        controlTeclado.inicializar(toni)
        toni.position(controlDeMovimientos.defaultPosition())
        game.addVisual(toni)
        
        const x = 1.randomUpTo(10).truncate(0)
        const y = 1.randomUpTo(10).truncate(0)
        const enemigo = new FantasmaDiagonal(position= game.at(x, y)


        (1..10).forEach{ value => 
            game.schedule(value * 1000, {
                const enemigo = new Enemigo(position= game.at((0..game.width()-1).anyOne(),value))
                controlDeColisiones.inicializar(enemigo)


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


Eventos automaticos
Una funcionalidad interesante que podemos implementar es que la caja se mueva cada n segundos (por ejemplo, cada 2 segundos), enviando el mensaje onTick() al objeto game, el lapso de repetición expresado en milisegundos, un identificador (string descriptivo) y el bloque de código que debe ejecutar:

program ejemplo {
  game.addVisualCharacter(wollok)
  game.addVisual(caja)
  // cada dos segundos muevo la caja
  game.onTick(2000, "movimiento", { caja.movete() })
  //
  game.start()
}

El método movete() en caja actualiza la posición en base a un valor al azar, tomando en cuenta el ancho y alto del tablero:

object caja {
  var property position = game.center()
  method image() = "caja.png"
  method movete() {
    const x = 0.randomUpTo(game.width()).truncate(0)
    const y = 0.randomUpTo(game.height()).truncate(0)
    // otra forma de generar números aleatorios
    // const x = (0.. game.width()-1).anyOne()
    // const y = (0.. game.height()-1).anyOne()
    position = game.at(x,y)
  }
}
*/
