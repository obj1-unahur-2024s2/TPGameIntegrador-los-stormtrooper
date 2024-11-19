import gameOver.*
import objetos.*
import personaje.*
import tablero.*
import musicaSonido.*
import comedor.*

class Fantasma {
  var orientacion = self.orientacionInicial() //up
  var property velocidad

  method orientacionInicial() {
    //const arriba = up
    //const abajo = down
    var numeroAleatorio = 0.randomUpTo(1).truncate(0)
    
    if(numeroAleatorio ==0)
      return up
    else 
      return down
    
  }

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
//entrada
const fantasmaDiagonaEntrada1 = new FantasmaDiagonal(position = game.at(6,6), velocidad = 700)
//const fantasmaDiagonaEntrada2 = new FantasmaDiagonal(position = game.at(7,6), velocidad = 400)
//const fantasmaDiagonaEntrada3 = new FantasmaDiagonal(position = game.at(8,2), velocidad = 300)

//comedor
const fantasmaDiagonalComedor1 = new FantasmaDiagonal(position = game.at(2,9), velocidad = 700)
const fantasmaDiagonalComedor2 = new FantasmaDiagonal(position = game.at(5,1), velocidad = 800)
const fantasmaDiagonalComedor3 = new FantasmaDiagonal(position = game.at(8,3), velocidad = 600)
//cocina
const fantasmaDiagonalCocina1 = new FantasmaDiagonal(position = game.at(5,3), velocidad = 800)
const fantasmaDiagonalCocina2 = new FantasmaDiagonal(position = game.at(3,6), velocidad = 900)
const fantasmaDiagonalCocina3 = new FantasmaDiagonalOpuesto(position = game.at(3,8), velocidad = 700)//OP
//musica
const fantasmaDiagonalMusica1 = new FantasmaDiagonal(position = game.at(4,4), velocidad = 700)
const fantasmaDiagonalMusica2 = new FantasmaDiagonal(position = game.at(1,8), velocidad = 800)
const fantasmaDiagonalMusica3 = new FantasmaDiagonalOpuesto(position = game.at(3,8), velocidad = 900)//OP
//------------------------------------------------------------------------------------------------------------
//primerPiso
const fantasmaDiagonalPrimerPiso1 = new FantasmaDiagonal(position = game.at(7,7), velocidad = 700)
//terraza
const fantasmaDiagonalTerraza1 = new FantasmaDiagonal(position = game.at(5,8), velocidad = 800)
const fantasmaDiagonalTerraza2 = new FantasmaDiagonalOpuesto(position = game.at(4,6), velocidad = 900)//OP
//bilbioteca
const fantasmaDiagonalBiblio1 = new FantasmaDiagonal(position = game.at(3,4), velocidad = 600)
const fantasmaDiagonalBiblio2 = new FantasmaDiagonal(position = game.at(2,7), velocidad = 800)
const fantasmaDiagonalBiblio3 = new FantasmaDiagonalOpuesto(position = game.at(7,3), velocidad = 900)//OP
//dormitorio
const fantasmaDiagonalDormi1 = new FantasmaDiagonal(position = game.at(3,8), velocidad = 700)
const fantasmaDiagonalDormi2 = new FantasmaDiagonal(position = game.at(7,2), velocidad = 1000)
const fantasmaDiagonalDormi3 = new FantasmaDiagonalOpuesto(position = game.at(3,6), velocidad = 900)//OP


//const fantasmaDiagonaEntradaOP1 = new FantasmaDiagonalOpuesto(position = game.at(3,8), velocidad = 500)

//0.randomUpTo(game.width()).truncate(0)
//topeIzq.position().x()+1
//topeDer.position().x()-1

//topeAbajo.position().y()+1
//topeArriba.position().y()-1

//  topeIzq.position().x()+1.randomUpTo(topeDer.position().x()-1),topeAbajo.position().y()+1.randomUpTo(topeArriba.position().y()-1)
//2.randomUpTo(8),2.randomUpTo(8)