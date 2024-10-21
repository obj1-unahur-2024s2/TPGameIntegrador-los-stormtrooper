import comedor.*
import personaje.*
import textos.*

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
object llave1 {
  var property image = "key1.png" 
  var property position = game.center()
  var property nombre = "llave"
  var property enInventario = false

  method interaccion() {
      self.eliminar()//elimina llave
      game.addVisual(textoLlave1)//muestra texto 1
      game.schedule(5000, { => game.removeVisual(textoLlave1)})// despues de 5s elimina el texto1
      self.enInventario(true) 
  }
  method eliminar() {
    game.removeVisual(self)
  }

  method ubicarEn(unaUbicacion) {
    self.position(unaUbicacion)  
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
object puerta {
  var property image = "puerta.png" 
  var property position = game.at(4,4)
  var property nombre = "mueble"
  var property enInventario = false

  method interaccion() {
    //game.clear()
    game.removeVisual(self)// solo es una prueba
    comedor.iniciarEntrada()
  }
  method eliminar() {
    game.removeVisual(self)
  }

  method ubicarEn(unaUbicacion) {
    self.position(unaUbicacion)  
  }
}
