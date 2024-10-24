import entradaPrimerPiso.*
import musica.*
import objetos.*
import entrada.*
import comedor.*
import personaje.*
import textos.*
import wollok.game.*

//-----------------------------------------------------Entrada -->> Comedor
object puertaAComedor {
  var property image = "puerta.png" 
  var property position = game.at(4,4)  

  //Hacia el comedor
  method interaccion() {
    if(llave1.enInventario())
        comedor.iniciar()
    else{
      game.addVisual(puertaCerrada)//--muestra texto--
      game.schedule(2000, { => game.removeVisual(puertaCerrada)})
    }
  }

  method ubicarEn(unaUbicacion) {
    self.position(unaUbicacion)  
  }
}
//-----------------------------------------------------Comedor, musica, primerpiso -->> Entrada
object puertaAEntrada {
  var property image = "puerta.png" 
  var property position = game.at(4,4)

  //Hacia la entrada
  method interaccion() {
    entrada.iniciar()
  }

  method ubicarEn(unaUbicacion) {
    self.position(unaUbicacion)  
  }
}
//-----------------------------------------------------Entrada -->> Musica
object puertaAMusica {
  var property image = "puerta.png" 
  var property position = game.at(4,4)  

  //Hacia el comedor
  method interaccion() {
    Musica.iniciar()
    /*if(llave1.enInventario())
        comedor.iniciar()
    else{
      game.addVisual(puertaCerrada)//--muestra texto--
      game.schedule(2000, { => game.removeVisual(puertaCerrada)})
    }*/
  }

  method ubicarEn(unaUbicacion) {
    self.position(unaUbicacion)  
  }
}
//-----------------------------------------------------Entrada -->> primer piso
object escaleraAPrimerPiso {
  var property image = "puerta.png" 
  var property position = game.at(4,4)  

  //Hacia el comedor
  method interaccion() {
    entradaPrimerPiso.iniciar()
    /*if(llave1.enInventario())
        comedor.iniciar()
    else{
      game.addVisual(puertaCerrada)//--muestra texto--
      game.schedule(2000, { => game.removeVisual(puertaCerrada)})
    }*/
  }

  method ubicarEn(unaUbicacion) {
    self.position(unaUbicacion)  
  }
}