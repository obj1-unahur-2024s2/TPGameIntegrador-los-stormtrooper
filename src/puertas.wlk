import entradaPrimerPiso.*
import musica.*
import objetos.*
import entrada.*
import comedor.*
import personaje.*
import textos.*
import wollok.game.*
import cocina.*
import terraza.*

//-------------------------------------------------------------------------------clase  Puertas
class Puertas {
  var property image //"Door1.png" 
  var property position = game.origin() 
  //var property item  //llave1.enInventario()
  var property irHacia //comedor.iniciar()
  var property mensaje //puertaCerrada

  //--Reubicacion
  method ubicarEn(unaUbicacion) {
    self.position(unaUbicacion)  
  }

}
//-------------------------------------------------------------------------------clase Puetas Abiertas
class PuertasAbiertas inherits Puertas  {
  //--Puertas abiertas
  method interaccion() {
    irHacia.iniciar()
  }
}
//-------------------------------------------------------------------------------clase Puertas Cerradas
class PuertasCerradas inherits Puertas  {
  //--puertas cerradas
  var property item
  var property puertaCerrada 

  method interaccion() {
    if(item.enInventario()){
        image = puertaCerrada//--al pasar por la puerta, esta queda abierta
        irHacia.iniciar()
    }
    else{
      game.addVisual(mensaje)//--muestra texto--
      game.schedule(2000, { => game.removeVisual(mensaje)})//--borra el texto
    }
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//-----------------------------------------------------Entrada -->> Comedor
const puertaAComedor = new PuertasAbiertas(image= "Door1Open.png", irHacia= comedor, mensaje= txtPuertaCerrada )

//-----------------------------------------------------Comedor, musica, primerpiso -->> Entrada
const puertaAEntrada = new PuertasAbiertas(image= "Door1Open.png", irHacia= entrada, mensaje= txtPuertaCerrada )
const escaleraAEntrada = new PuertasAbiertas(image= "escalerasDownV2.png", irHacia= entrada, mensaje= txtPuertaCerrada )

//-----------------------------------------------------Entrada -->> Musica
const puertaAMusica = new PuertasCerradas(image= "Door1.png",puertaCerrada = "Door1Open.png", item= llave1, irHacia= musica, mensaje= txtPuertaCerrada )

//-----------------------------------------------------Entrada -->> primer piso
const escaleraAPrimerPiso = new PuertasAbiertas(image= "escalerasUp.png", irHacia= entradaPrimerPiso, mensaje= txtPuertaCerrada )

//-----------------------------------------------------Terraza -->> primer piso
const puertaAPrimerPiso = new PuertasAbiertas(image= "Door3Open.png", irHacia= entradaPrimerPiso, mensaje= txtPuertaCerrada )

//-----------------------------------------------------Comedor -->> Cocina
const puertaACocina = new PuertasCerradas(image= "Door1.png",puertaCerrada = "Door1Open.png", item= llave1, irHacia= cocina, mensaje= txtPuertaCerrada )

//-----------------------------------------------------primer piso ==>> primer piso
const puertaATerraza = new PuertasCerradas(image= "Door3.png",puertaCerrada = "Door3Open.png", item= llave1, irHacia= terraza, mensaje= txtPuertaCerrada )
