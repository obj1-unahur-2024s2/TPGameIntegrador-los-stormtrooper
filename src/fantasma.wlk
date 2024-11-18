import gameOver.*
import objetos.*
import personaje.*
import tablero.*

class Fantasma {
  var orientacion = up
  var property velocidad

  var property position = game.origin()//posicion inicio

  method image() = "fantasma" + orientacion.descripcion() + ".png" //descripcion: "U D R L" (U) "cohete" + orientacion.descripcion() + ".png"

  method initialize() {
    game.onTick(velocidad,"fantasma",{self.desplazarse()})
  }

  method desplazarse() {
    self.avanzar()
    if(self.llego())//si encuentra su borde, gira
       self.girar()
  }

  method avanzar() {
    position = orientacion.adelante(position)// adelante: dir de avance (up)
   /* if (orientacion == "U")
      position = position.up(1)
    if (orientacion == "D")
      position = position.down(1)
    if (orientacion == "R")
      position = position.right(1)
    if (orientacion == "L")
      position = position.left(1)*/
  }
  method llego() =
      orientacion.enElBorde(position) //enElBorde: cual es el borde -- le doy mi posicion actual

  //  (position.y() == game.height()-1 and orientacion == "U") or
  //  (position.x() == game.width()-1 and orientacion == "R")
    // falta bajo y izq
  
  method girar() {
    orientacion = orientacion.siguiente()// siguiente: siguiente movimiento "U D R L"
  /*  if (orientacion == "U")
      orientacion = "R"
    else 
      if (orientacion == "R")
        orientacion = "D"
      */
  }
 
  method interaccion() {
    //gameOver.iniciar()
    personaje.restarVida()
    barraDeVida.sacarVidas()//--actualiza la cantidad de vidas
    game.addVisual(damage)//--muestra pantalla color rojo--
    game.schedule(250, { => game.removeVisual(damage)})//--elimina la pantalla roja
    game.removeVisual(self)//--elimina el fantasma
    personaje.morir()//--va a la pantalla de gameover
  }
}

//-------------------------------------------------------------------------------------------------
class FantasmaDiagonal inherits Fantasma{

  override method avanzar() {
    super()//position = orientacion.adelante(position)
    position = orientacion.siguiente().adelante(position)//cambia a la siguiente orientacion y luego avanza
  }

  override method llego() = super() /* orientacion.enElBorde(position) */or orientacion.siguiente().enElBorde(position)// o el borde de la sig posicion

  override method girar() {
    super()//orientacion = orientacion.siguiente()
    if (orientacion.enElBorde(position)){
      super()//orientacion = orientacion.siguiente()
      super()//orientacion = orientacion.siguiente()
    }
  }
}
class FantasmaDiagonalOpuesto inherits Fantasma{

  override method avanzar() {
    super()//position = orientacion.adelante(position)
    position = orientacion.siguienteOpuesto().adelante(position)//cambia a la siguiente orientacion y luego avanza
  }

  override method llego() = super() /* orientacion.enElBorde(position) */or orientacion.siguienteOpuesto().enElBorde(position)// o el borde de la sig posicion

  override method girar() {
    super()//orientacion = orientacion.siguiente()
    if (orientacion.enElBorde(position)){
      super()//orientacion = orientacion.siguiente()
      super()//orientacion = orientacion.siguiente()
    }
  }
}
//-----------------------------------------------------------------------------------------------

object up{
  method descripcion() = "R"//define el sprite
  method siguiente() = right// siguiente movimiento
  method opuesto() = down//no se usaria
  method siguienteOpuesto() = left
  method adelante(position) = position.up(1)//dir de avance
  method enElBorde(position) = position.y() >= topeArriba.position().y()-1 //game.height()-1//cual es el borde
}
object right{
  method descripcion() = "R"
  method siguiente() = down
  method opuesto() = left
  method siguienteOpuesto() = up
  method adelante(position) = position.right(1)
  method enElBorde(position) = position.x() >= topeDer.position().x()-1 //game.width()-1
}
object down{
  method descripcion() = "L"
  method siguiente() = left
  method opuesto() = up
  method siguienteOpuesto() = right
  method adelante(position) = position.down(1)
  method enElBorde(position) = position.y() <= topeAbajo.position().y()+1
}
object left{
  method descripcion() = "L"
  method siguiente() = up
  method opuesto() = right
  method siguienteOpuesto() = down
  method adelante(position) = position.left(1)
  method enElBorde(position) = position.x() <= topeIzq.position().x()+1
}



const fantasmaDiagonaEntrada1 = new FantasmaDiagonal(position = game.at(2,5), velocidad = 500)
const fantasmaDiagonaEntrada2 = new FantasmaDiagonal(position = game.at(7,6), velocidad = 400)
const fantasmaDiagonaEntrada3 = new FantasmaDiagonal(position = game.at(8,2), velocidad = 300)

const fantasmaDiagonaEntradaOP1 = new FantasmaDiagonalOpuesto(position = game.at(3,8), velocidad = 500)

//0.randomUpTo(game.width()).truncate(0)
//topeIzq.position().x()+1
//topeDer.position().x()-1

//topeAbajo.position().y()+1
//topeArriba.position().y()-1

//  topeIzq.position().x()+1.randomUpTo(topeDer.position().x()-1),topeAbajo.position().y()+1.randomUpTo(topeArriba.position().y()-1)
//2.randomUpTo(8),2.randomUpTo(8)