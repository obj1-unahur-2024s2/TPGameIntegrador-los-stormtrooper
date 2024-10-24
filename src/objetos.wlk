import comedor.*
import personaje.*
import textos.*
import wollok.game.*
//------------------------------------------------------------------------LLAVE-1
object llave1 {
  var property image = "key1.png" 
  var property position = game.center()
  var property nombre = "llave"
  var property enInventario = false


  //--interaccion al colicionar con el obj
  method interaccion() {
      //game.say(personaje,"Que es esto, Parece importante...")
      game.addVisual(textoLlave1)//--muestra texto--
      game.schedule(3000, { => game.removeVisual(textoLlave1)})//--despues de 2s elimina el texto--
      
      game.addVisual(llaveIcon1)
      game.schedule(3000, { => game.removeVisual(llaveIcon1)})
      self.eliminar()//--elimina llave--
  }
  
  //--elimina la visual y pasa al inventario
  method eliminar() {
    game.removeVisual(self)
    self.tengoLlave()//--cambio el estado a true
  }
 
  //--reubica el obj
  method ubicarEn(unaUbicacion) {
    self.position(unaUbicacion)  
  }
  
  //--esta en el inventario
  method tengoLlave() {
    enInventario = true
  }
}/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

object llaveIcon1 {
  var property image = "key_big.png"
  var property position = game.at(1,0)
}
