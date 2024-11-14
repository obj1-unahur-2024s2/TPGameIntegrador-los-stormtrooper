import comedor.*
import personaje.*
import textos.*
import wollok.game.*

//----------------------------------------------------------------------------------------------------------Clase ObjetosInvisibles
class ObjetosInvisibles {
  var property position = game.center()
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

//---------------------------------------------------------------------------------------------------------Clase Obj INVISIBLES que solo responden
class  ObjInvSoloResponde inherits ObjetosInvisibles {//solo muetra mensaje
  //var property position = game.center()
  //const property textoInfo
  //method text() = textoInfo
  //method eliminar() 
  //method ubicarEn(unaUbicacion) 
  
  method interaccion() {
    game.addVisual(textoInfo)//--muestra texto--
    game.schedule(1500, { => game.removeVisual(textoInfo)})//--despues de 2s elimina el texto--
  }
}
const txtNadaImportante = new ObjInvSoloResponde (textoInfo = nadaImportante)
const txtNadaImportante2 = new ObjInvSoloResponde (textoInfo = nadaImportante)
const txtNadaImportante3 = new ObjInvSoloResponde (textoInfo = nadaImportante)
const txtNadaImportante4 = new ObjInvSoloResponde (textoInfo = nadaImportante)

//---------------------------------------------------------------------------------------------------------Clase Obj VISIBLES que solo responden
class ObjVisSoloResponde inherits ObjInvSoloResponde{
  const property image

}
//const prueba3 = new ObjVisSoloResponde (image = "life1Full.png", textoInfo = nadaImportante)//////////////////////////////////////////////////////////////////

//--------------------------------------------------------------------------------------------------------Clase Obj que dan item a cambio de otro
class ObjQueDanItemACambio inherits ObjetosInvisibles{
  //var property position = game.center()
  //const property textoInfo
  //method text() = textoInfo
  //method eliminar() 
  //method ubicarEn(unaUbicacion) 
  const itemNesesario 
  const itemACambio
  const iconItemACambio
  const textoNoPodes
  const textoObtenerItem
  const property image

  method interaccion() {//obj invisible que nececita un item para funcionar
    if(!itemNesesario.enInventario()){
      game.addVisual(textoNoPodes)//--muestra texto--
      game.schedule(3000, { => game.removeVisual(textoNoPodes)})//--despues de 2s elimina el texto--
    }
    else if (itemNesesario.enInventario() && !itemACambio.enInventario()){
      game.addVisual(textoObtenerItem)//--muestra texto--
      game.schedule(3000, { => game.removeVisual(textoObtenerItem)})//--despues de 2s elimina el texto--
      
      game.addVisual(iconItemACambio)
      game.schedule(3000, { => game.removeVisual(iconItemACambio)})
      
      itemACambio.enInventario(true)
      //self.eliminar()
    }
    //no se puede usar por ahora
    /*else if(itemNesesario.enInventario() && itemACambio.enInventario()){
      game.addVisual(yaNoHayNada)
      game.schedule(3000, { => game.removeVisual(yaNoHayNada)})
    } */
  }
  
}
/*
const chimenea = new ObjQueDanItemACambio(
  image = "objMueble.png", 
  itemNesesario = llave1, 
  itemACambio = llave2,
  iconItemACambio = iconLlave2, 
  textoNoPodes = hayAlgoPero, 
  textoObtenerItem = textoLlave1, 
  textoInfo = nadaImportante
)*/

//---------------------------------------------------------------------------------------------------------Clase Items INVISIBLES 
class ItemInvisible {
  var property position = game.center()
  var property enInventario = false
  const property textoExplicacion
  const property iconDelItem
  const property itemInventario
  var property loTengo = itemInventario.loTengo()

  method interaccion() {
    //texto
    game.addVisual(textoExplicacion)
    game.schedule(2000, { => game.removeVisual(textoExplicacion)})
    //icono item
    game.addVisual(iconDelItem)
    game.schedule(2000, { => game.removeVisual(iconDelItem)})
    
    self.enInventario(true)
    game.removeVisual(self)
    //agrega el item al inventario
    game.addVisual(itemInventario)
    itemInventario.loTengo(true)
  }

    method ubicarEn(unaUbicacion) {
    self.position(unaUbicacion)  
  }
}
const itemLlaveTerraza = new ItemInvisible(textoExplicacion = textoLlaveTerraza, iconDelItem = iconLlaveTerraza,itemInventario= iconLlave1Inv)
//const itemGema1 = new ItemInvisible(textoExplicacion = textoGema1, iconDelItem = iconGema1, itemInventario = iconGema1Inv)
const itemDisco = new ItemInvisible(textoExplicacion = textoDisco, iconDelItem = iconDisco, itemInventario = iconDiscoInv)
const itemLlaveMusica = new ItemInvisible(textoExplicacion = textoLlaveMusica, iconDelItem = iconLlaveMusica, itemInventario = iconLlaveMInv)
const itemEncendedor = new ItemInvisible(textoExplicacion = textoEncendedor, iconDelItem = iconEncendedor, itemInventario = iconEncendedorInv)
//

//const itemNota1 = new ItemInvisible(textoExplicacion = textoNota1, iconDelItem = iconNota1, itemInventario = iconNota1Inv)
//-------------------------------
class ItemQueSeRecibe {
  var property position = game.center()
  var property enInventario = false
  const property textoExplicacion
  const property iconDelItem
  const property itemInventario
  var property loTengo = itemInventario.loTengo()
  const property itemNecesario
  const property textoNoSePuede

  method interaccion() {
    if(!itemNecesario.enInventario()){
      game.addVisual(textoNoSePuede)//--muestra texto--
      game.schedule(3000, { => game.removeVisual(textoNoSePuede)})//--despues de 2s elimina el texto--
    }
    else if (itemNecesario.enInventario() && !self.enInventario()){
      game.addVisual(textoExplicacion)//--muestra texto--
      game.schedule(3000, { => game.removeVisual(textoExplicacion)})//--despues de 2s elimina el texto--
      
      game.addVisual(iconDelItem)
      game.schedule(2000, { => game.removeVisual(iconDelItem)})

      self.enInventario(true)
      game.removeVisual(self)
      //agrega el item al inventario
      itemInventario.loTengo(true)
      game.addVisual(itemInventario)

    }    
  }

  method ubicarEn(unaUbicacion) {
    self.position(unaUbicacion)  
  }
}

const itemEmblema = new ItemQueSeRecibe(
  textoExplicacion= textoEmblema, 
  iconDelItem= iconEmblema, 
  itemInventario= iconEmblemaInv,
  itemNecesario= itemEncendedor, 
  textoNoSePuede= hayAlgoPero)

const itemNota1 = new ItemQueSeRecibe(
  textoExplicacion= textoNota1, 
  iconDelItem= iconNota1, 
  itemInventario= iconNota1Inv,
  itemNecesario= itemDisco, 
  textoNoSePuede= hayAlgoPero)

const itemLlaveDormi = new ItemQueSeRecibe(
  textoExplicacion= textoLlaveD, 
  iconDelItem= iconLlaveD, 
  itemInventario= iconLlaveDInv,
  itemNecesario= itemEmblema, 
  textoNoSePuede= hayAlgoPero)

const itemLlaveCocina = new ItemQueSeRecibe(
  textoExplicacion= textoLlaveC, 
  iconDelItem= iconLlaveC, 
  itemInventario= iconLlaveCInv,
  itemNecesario= itemNota1, 
  textoNoSePuede= hayAlgoPero)

//-------------------------------------------------------------------------------------------------------Clase Items VISIBLES (que se eliminan de pantalla)
class ItemVisible {
  var property position = game.center()
  var property enInventario = false
  const property textoExplicacion
  const property iconDelItem
  const property image


  method interaccion() {
    game.addVisual(textoExplicacion)
    game.schedule(2000, { => game.removeVisual(textoExplicacion)})
      
    game.addVisual(iconDelItem)
    game.schedule(2000, { => game.removeVisual(iconDelItem)})
    self.enInventario(true)
    self.eliminar()
    //prueba inventorio
    //game.addVisual(iconLlave1Inv)
    //iconLlave1Inv.loTengo(true)
  
  }
  
  //--elimina la visual y pasa al inventario
  method eliminar() {
    game.removeVisual(self)
  }
 
  //--reubica el obj al principio
  method ubicarEn(unaUbicacion) {
    self.position(unaUbicacion)  
  }
}
//const llave1 = new ItemVisible(textoExplicacion = textoLlave1, iconDelItem = iconLlaveTerraza, image = "key1.png")

//-----------------------------------------------------------------------------------------------OBJ Iconos
//--Clase Iconos en los TEXTOS
class Iconos {
  const property image
  method position() = game.at(1,0)
}

const iconLlaveTerraza = new Iconos(image ="iconKey1.png")
//const iconGema1 = new Iconos(image ="iconGem1.png")
const iconDisco = new Iconos(image ="iconDisco.png")
const iconLlaveMusica = new Iconos(image ="iconKey3.png")
const iconEncendedor = new Iconos(image ="iconEncendedorV2.png")

const iconEmblema = new Iconos(image ="iconShield.png")
const iconNota1= new Iconos(image ="iconNote1.png")
const iconLlaveD= new Iconos(image ="iconKey7.png")
const iconLlaveC= new Iconos(image ="iconKey6.png")


//--Clase Iconos en el INVENTARIO
class IconoDeInventario {
  const property image 
  const property position 
  var property loTengo = false
}

const iconLlave1Inv = new IconoDeInventario(image= "iconKey2.png", position= game.at(11,10))
//const iconGema1Inv = new IconoDeInventario(image= "iconGem1.png", position= game.at(11,9))
const iconDiscoInv = new IconoDeInventario(image= "iconDisco.png", position= game.at(11,9))
const iconLlaveMInv = new IconoDeInventario(image= "iconKey3.png", position= game.at(11,8))
const iconEncendedorInv = new IconoDeInventario(image= "iconEncendedorV2.png", position= game.at(11,7))

const iconEmblemaInv = new IconoDeInventario(image= "iconShield.png", position= game.at(11,6))
const iconNota1Inv = new IconoDeInventario(image= "iconNote1.png", position= game.at(11,5))
const iconLlaveDInv = new IconoDeInventario(image= "iconKey7.png", position= game.at(11,4))
const iconLlaveCInv = new IconoDeInventario(image= "iconKey6.png", position= game.at(11,3))

class Tope {
  var property position = game.origin()

  method ubicarEn(unaUbicacion) {
    self.position(unaUbicacion)  
  }
}
const topeAbajo = new Tope()
const topeArriba = new Tope()
const topeIzq = new Tope()
const topeDer = new Tope()


//--vida
class Corazones {
  const image = "life1Full.png"
  const position
}

const corazonvida1 = new Corazones (position = game.at(0,10))
const corazonvida2 = new Corazones (position = game.at(0,9))
const corazonvida3 = new Corazones (position = game.at(0,8))

object corazon1 {
  const property image = "life1Full.png"
  const property position = game.at(0,10)
}
object corazon2 {
  const property image = "life1Full.png"
  const property position = game.at(0,9)
}
object corazon3 {
  const property image = "life1Full.png"
  const property position = game.at(0,8)
}