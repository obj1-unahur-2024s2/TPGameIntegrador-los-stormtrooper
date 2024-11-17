import comedor.*
import personaje.*
import textos.*
import wollok.game.*

/*--INDICE--
-Clase Obj Invisibles
-clase Obj que solo muestra mensaje
-Clase Obj Visible que solo responde
-Clase Obj que dan un item a cambio

-Clase Item invisible
-Clase Item que se recibe
-Clase Item Visivble

-Iconos
-Iconos de Inventario
-Limites de mapa
-Obj Corazones
-

*/

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
  const tiempo
  
  method interaccion() {
    game.addVisual(textoInfo)//--muestra texto--
    game.schedule(tiempo, { => game.removeVisual(textoInfo)})//--despues de 2s elimina el texto--
  }
}
          const txtNadaImportante = new ObjInvSoloResponde (textoInfo = nadaImportante, tiempo =2000)
          const txtNadaImportante2 = new ObjInvSoloResponde (textoInfo = nadaImportante, tiempo =2000)
          const txtNadaImportante3 = new ObjInvSoloResponde (textoInfo = nadaImportante, tiempo =2000)
          const txtNadaImportante4 = new ObjInvSoloResponde (textoInfo = nadaImportante, tiempo =2000)
          const txtClavePolvo1 = new ObjInvSoloResponde (textoInfo = clavePolvo1, tiempo =3000)
          const txtClavePolvo2 = new ObjInvSoloResponde (textoInfo = clavePolvo2, tiempo =3000)
          const txtNadaSilla = new ObjInvSoloResponde (textoInfo = nadaImportanteSilla, tiempo =3000)
          
          const txtClaveEspejo = new ObjInvSoloResponde (textoInfo = claveEspejo, tiempo =3000)
          const txtClaveReloj = new ObjInvSoloResponde (textoInfo = claveReloj, tiempo =3000)

          const txtKatyCursed = new ObjInvSoloResponde (textoInfo = katyCursed, tiempo =5000)

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
      game.schedule(4000, { => game.removeVisual(textoNoPodes)})//--despues de 2s elimina el texto--
    }
    else if (itemNesesario.enInventario() && !itemACambio.enInventario()){
      game.addVisual(textoObtenerItem)//--muestra texto--
      game.schedule(4000, { => game.removeVisual(textoObtenerItem)})//--despues de 2s elimina el texto--
      
      game.addVisual(iconItemACambio)
      game.schedule(4000, { => game.removeVisual(iconItemACambio)})
      
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
    game.schedule(4000, { => game.removeVisual(textoExplicacion)})
    //icono item
    game.addVisual(iconDelItem)
    game.schedule(4000, { => game.removeVisual(iconDelItem)})
    
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
        const itemDisco = new ItemInvisible(textoExplicacion = textoDisco, iconDelItem = iconDisco, itemInventario = iconDiscoInv)
        const itemLlaveMusica = new ItemInvisible(textoExplicacion = textoLlaveMusica, iconDelItem = iconLlaveMusica, itemInventario = iconLlaveMInv)
        const itemEncendedor = new ItemInvisible(textoExplicacion = textoEncendedor, iconDelItem = iconEncendedor, itemInventario = iconEncendedorInv)
        const itemNota2 = new ItemInvisible(textoExplicacion = textoNota2, iconDelItem = iconNota2, itemInventario = iconNota2Inv)
        const itemNota3 = new ItemInvisible(textoExplicacion = textoNota3, iconDelItem = iconNota3, itemInventario = iconNota3Inv)
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
      game.schedule(4000, { => game.removeVisual(textoNoSePuede)})//--despues de 2s elimina el texto--
    }
    else if (itemNecesario.enInventario() && !self.enInventario()){
      game.addVisual(textoExplicacion)//--muestra texto--
      game.schedule(4000, { => game.removeVisual(textoExplicacion)})//--despues de 2s elimina el texto--
      
      game.addVisual(iconDelItem)
      game.schedule(4000, { => game.removeVisual(iconDelItem)})

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


const itemLlaveSotano = new ItemQueSeRecibe(
    textoExplicacion= textoLlaveSotano, 
    iconDelItem= iconLlaveSotano, 
    itemInventario= iconLlaveSotanoInv,
    itemNecesario= itemNota2, 
    textoNoSePuede= nadaImportante)
const itemNota3P2 = new ItemQueSeRecibe(
    textoExplicacion= textoNota3P2, 
    iconDelItem= iconNota3P2, 
    itemInventario= iconNota3P2Inv,
    itemNecesario= itemNota3, 
    textoNoSePuede= nadaImportante)
const itemPolvoEstrellas = new ItemQueSeRecibe(
    textoExplicacion= textoPolvoEstrellas, 
    iconDelItem= iconPolvoEstrellas, 
    itemInventario= iconPolvoEstrellasInv,
    itemNecesario= itemNota3P2, 
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
    game.schedule(4000, { => game.removeVisual(textoExplicacion)})
      
    game.addVisual(iconDelItem)
    game.schedule(4000, { => game.removeVisual(iconDelItem)})
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






////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--Clase Iconos en los TEXTOS
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



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
        const iconNota2= new Iconos(image ="iconNote2.png")
        const iconLlaveSotano= new Iconos(image ="iconKey5.png")
        const iconNota3= new Iconos(image ="iconNote3V1.png")
        const iconNota3P2= new Iconos(image ="iconNote3.png")
        const iconPolvoEstrellas= new Iconos(image ="iconPolvo.png")



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
        const iconNota2Inv = new IconoDeInventario(image= "iconNote2.png", position= game.at(11,2))
        const iconLlaveSotanoInv = new IconoDeInventario(image= "iconKey5.png", position= game.at(11,2))
        const iconNota3Inv = new IconoDeInventario(image= "iconNote3V1.png", position= game.at(11,1))
        const iconNota3P2Inv = new IconoDeInventario(image= "iconNote3.png", position= game.at(11,1))
        const iconPolvoEstrellasInv = new IconoDeInventario(image= "iconPolvo.png", position= game.at(11,1))

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