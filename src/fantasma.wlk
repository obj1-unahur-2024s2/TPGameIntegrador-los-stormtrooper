import objetos.*
import personaje.*
import tablero.*
import musicaSonido.*

class Fantasma {
  var orientacion = up //self.orientacionInicial() //up
  var property velocidad
  var property contadorAnimacion = 1

  method orientacionInicial() {
    //const arriba = up
    //const abajo = down
    var numeroAleatorio = 0.randomUpTo(1).truncate(0)
    
    if(numeroAleatorio ==0)
      return up
    else 
      return down
  }

  var property position //= game.origin()//posicion inicio

  //method image() 
  var property image = "fantasma" + orientacion.descripcion() + "V2.png" //descripcion: "U D R L" (U) "cohete" + orientacion.descripcion() + ".png"

  method initialize() {
    game.onTick(velocidad,"fantasma",{self.desplazarse()})
    self.animar()
  }
  //method animar() {}

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
    game.sound("xfxDamage.mp3").play()
    personaje.restarVida()
    barraDeVida.sacarVidas()//--actualiza la cantidad de vidas
    game.addVisual(damage)//--muestra pantalla color rojo--
    game.schedule(250, { => game.removeVisual(damage)})//--elimina la pantalla roja
    game.removeVisual(self)//--elimina el fantasma
    personaje.morir()//--va a la pantalla de gameover
  }

//--animaciones--------------------------------------------------------
  
  method animar() {
      game.onTick(5,"fantasmaR",{self.animacion()})
  }

  method animacion() {
    if(contadorAnimacion !=4){
      contadorAnimacion += 1
      image = "ghost"+ orientacion.descripcion() +"V3-F"+contadorAnimacion+".png"
    }
    else{
      contadorAnimacion =1
      image = "ghost"+ orientacion.descripcion() +"V3-F"+contadorAnimacion+".png"
    }
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
  /*
  override method animar() {
      game.onTick(5,"fantasmaR",{self.animacion()})
  }

  method animacion() {
    if(contadorAnimacion !=4){
      contadorAnimacion += 1
      image = "ghost"+ orientacion.descripcion() +"V3-F"+contadorAnimacion+".png"
    }
    else{
      contadorAnimacion =1
      image = "ghost"+ orientacion.descripcion() +"V3-F"+contadorAnimacion+".png"
    }
  }
  */
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
class FantasmaPerseguidor inherits Fantasma{
  override method avanzar() {
    //super()//position = orientacion.adelante(position)
    //position = orientacion.siguiente().adelante(position)//cambia a la siguiente orientacion y luego avanza
  }
  override method llego() = super() /* orientacion.enElBorde(position) */or orientacion.siguiente().enElBorde(position)// o el borde de la sig posicion
  override method girar() {
    super()//orientacion = orientacion.siguiente()
    if (orientacion.enElBorde(position)){
      super()//orientacion = orientacion.siguiente()
      super()//orientacion = orientacion.siguiente()
    }
  }

  //override method image() = "fantasma3.png"
  override method desplazarse() {
    //self.position(self.position().down(1))
    self.perseguirA(personaje)
  }

  method perseguirA(unPersonaje) {
    if(unPersonaje.position().x() < self.position().x())
      self.position(self.position().left(1))
    else if(unPersonaje.position().x() > self.position().x())
      self.position(self.position().right(1))
    
    if(unPersonaje.position().y() < self.position().y())
      self.position(self.position().down(1))
    else if(unPersonaje.position().y() > self.position().y())
      self.position(self.position().up(1))
  }

  override method animar() {
      game.onTick(5,"fantasmaR",{self.animacion()})
  }

  override method animacion() {
    if(contadorAnimacion !=4){
      contadorAnimacion += 1
      image = "ghostPerseguidorV1-F"+contadorAnimacion+".png"
    }
    else{
      contadorAnimacion =1
      image = "ghostPerseguidorV1-F"+contadorAnimacion+".png"
    }
  }
}
const fantasmaPerseguidorEntrada1 = new FantasmaPerseguidor(position = game.at(10,10), velocidad = 2000)//Per
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
const fantasmaDiagonaEntrada1 = new FantasmaDiagonal(position = game.at(11,6), velocidad = 700)
//---------modoDificil
const fantasmaDiagonaEntrada2 = new FantasmaDiagonal(position = game.at(11,2), velocidad = 500)
//-----------------------------------------------------------------------------------------------------------

//comedor
const fantasmaDiagonalComedor1 = new FantasmaDiagonal(position = game.at(2,9), velocidad = 900)
const fantasmaDiagonalComedor2 = new FantasmaDiagonal(position = game.at(2,2), velocidad = 1000)
const fantasmaDiagonalComedor3 = new FantasmaDiagonal(position = game.at(7,1), velocidad = 800)
//---------modoDificil
const fantasmaDiagonalComedor4 = new FantasmaDiagonal(position = game.at(9,9), velocidad = 2000)
const fantasmaPerseguidorComedor1 = new FantasmaPerseguidor(position = game.at(10,10), velocidad = 2000)//Per
//-----------------------------------------------------------------------------------------------------------

//cocina
const fantasmaDiagonalCocina1 = new FantasmaDiagonal(position = game.at(5,3), velocidad = 900)
const fantasmaDiagonalCocina2 = new FantasmaDiagonal(position = game.at(3,6), velocidad = 1000)
const fantasmaDiagonalCocina3 = new FantasmaDiagonalOpuesto(position = game.at(3,8), velocidad = 800)//OP
//---------modoDificil
const fantasmaDiagonalCocina4 = new FantasmaDiagonal(position = game.at(7,1), velocidad = 2000)
const fantasmaPerseguidorCocina1 = new FantasmaPerseguidor(position = game.at(10,10), velocidad = 2000)//Per
//-----------------------------------------------------------------------------------------------------------

//musica
const fantasmaDiagonalMusica1 = new FantasmaDiagonal(position = game.at(4,4), velocidad = 800)
const fantasmaDiagonalMusica2 = new FantasmaDiagonal(position = game.at(1,8), velocidad = 900)
const fantasmaDiagonalMusica3 = new FantasmaDiagonalOpuesto(position = game.at(3,8), velocidad = 1000)//OP
//---------modoDificil
const fantasmaDiagonalMusica4 = new FantasmaDiagonal(position = game.at(9,2), velocidad = 2000)
const fantasmaPerseguidorMusica1 = new FantasmaPerseguidor(position = game.at(10,10), velocidad = 2000)//Per
//----------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------
//primerPiso
const fantasmaDiagonalPrimerPiso1 = new FantasmaDiagonal(position = game.at(1,6), velocidad = 600)
//---------modoDificil
const fantasmaPerseguidorPrimerPiso1 = new FantasmaPerseguidor(position = game.at(10,10), velocidad = 1500)//Per
//-----------------------------------------------------------------------------------------------------------

//terraza
const fantasmaDiagonalTerraza1 = new FantasmaDiagonal(position = game.at(5,8), velocidad = 700)
const fantasmaDiagonalTerraza2 = new FantasmaDiagonalOpuesto(position = game.at(4,6), velocidad = 1000)//OP
//---------modoDificil
const fantasmaDiagonalTerraza3 = new FantasmaDiagonal(position = game.at(7,1), velocidad = 500)
//-----------------------------------------------------------------------------------------------------------

//bilbioteca
const fantasmaDiagonalBiblio1 = new FantasmaDiagonal(position = game.at(3,4), velocidad = 800)
const fantasmaDiagonalBiblio2 = new FantasmaDiagonal(position = game.at(2,7), velocidad = 900)
const fantasmaDiagonalBiblio3 = new FantasmaDiagonalOpuesto(position = game.at(7,3), velocidad = 1000)//OP
//---------modoDificil
const fantasmaDiagonalBiblio4 = new FantasmaDiagonal(position = game.at(5,6), velocidad = 2000)
const fantasmaPerseguidorBiblio1 = new FantasmaPerseguidor(position = game.at(10,10), velocidad = 2000)//Per
//-----------------------------------------------------------------------------------------------------------

//dormitorio
const fantasmaDiagonalDormi1 = new FantasmaDiagonal(position = game.at(3,8), velocidad = 800)
const fantasmaDiagonalDormi2 = new FantasmaDiagonal(position = game.at(7,2), velocidad = 1000)
const fantasmaDiagonalDormi3 = new FantasmaDiagonalOpuesto(position = game.at(3,6), velocidad = 900)//OP
//---------modoDificil
const fantasmaPerseguidorDormi1 = new FantasmaPerseguidor(position = game.at(10,10), velocidad = 2000)//Per
//-----------------------------------------------------------------------------------------------------------

//const fantasmaDiagonaEntradaOP1 = new FantasmaDiagonalOpuesto(position = game.at(3,8), velocidad = 500)

//0.randomUpTo(game.width()).truncate(0)
//topeIzq.position().x()+1
//topeDer.position().x()-1

//topeAbajo.position().y()+1
//topeArriba.position().y()-1

//  topeIzq.position().x()+1.randomUpTo(topeDer.position().x()-1),topeAbajo.position().y()+1.randomUpTo(topeArriba.position().y()-1)
//2.randomUpTo(8),2.randomUpTo(8)