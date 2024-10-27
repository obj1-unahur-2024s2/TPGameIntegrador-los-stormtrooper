import comedor.*
import personaje.*
import textos.*
import wollok.game.*

/*
obj invisible
  solo contestan siempre (interaccion1)
  da un item y que desaparecen(interaccion2)
  necesitan de un item para interacuar (interaccion3)

hereda invisible
sumo image
agrego super
obj visible       
  contienen item y desaparecen
  necesitan de un item para interacuar y luego desaparecen
*/

//-------------------------------------------------------------------------Clase Objetos invisibles
class ObjetosItem {
  var property position = game.center()
  var property enInventario = false
  //--enInventario(true)
  const property textoInfo
  method text() = textoInfo
  
  //--elimina la visual y pasa al inventario
  method eliminar() {
    game.removeVisual(self)
  }
 
  //--reubica el obj al principio
  method ubicarEn(unaUbicacion) {
    self.position(unaUbicacion)  
  }
}
//---------------------------------------------------------------------------Clase Objetos que solo responden
class  ObjSoloResponde inherits ObjetosItem {//solo muetra mensaje
  method interaccion() {
    game.addVisual(textoInfo)//--muestra texto--
    game.schedule(2000, { => game.removeVisual(textoInfo)})//--despues de 2s elimina el texto--
  }
}
//obj1
const prueba1 = new ObjSoloResponde (textoInfo = nadaImportante)
//---------------------------------------------------------------------------Clase Objetos que tienen item
class ObjQueTienenItem inherits ObjetosItem {
  const property icon
    
  method interaccion() {
    game.addVisual(textoInfo)
    game.schedule(3000, { => game.removeVisual(textoInfo)})
      
    game.addVisual(icon)
    game.schedule(3000, { => game.removeVisual(icon)})
    self.enInventario(true)
    self.eliminar()
  }
}
//--llave1
const llave1 = new ObjQueTienenItem (textoInfo = textoLlave1, icon = iconLlave1)
//----------------------------------------------------------------------Clase Objetos que necesitan de otro  item
/*
class ObjQueDanItemACambio inherits ObjetosItem{
  const ObjNesesario 
  const ObjACambio

  method interaccion() {//obj invisible que nececita un item para funcionar
    if(!ObjNesesario.enInventario()){
      game.addVisual(textoInfo)//--muestra texto--
      game.schedule(3000, { => game.removeVisual(textoInfo)})//--despues de 2s elimina el texto--
    }
    else{
      game.addVisual(textoLlave1)//--muestra texto--
      game.schedule(3000, { => game.removeVisual(textoLlave1)})//--despues de 2s elimina el texto--
      
      game.addVisual(iconLlave1)
      game.schedule(3000, { => game.removeVisual(iconLlave1)})
      
      self.enInventario(true)
      self.eliminar()
    }
  }
}
const objconitem = new ObjQueDanItemACambio(textoInfo = nadaImportante,ObjNesesario )*/


//-----------------------------------------------------------------------------------------------OBJ Iconos
//--Clase Iconos
class Iconos {
  const property image
  method position() = game.at(1,0)
}
//--Objetos
const iconLlave1 = new Iconos(image ="key_big.png")

