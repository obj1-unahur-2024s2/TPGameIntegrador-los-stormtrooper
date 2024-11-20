import tablero.*
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
import biblioteca.*
import dormitorio.*
import tunel.*
import ritual.*
import final.*
import jardin.*
import musicaSonido.*

/*--INDICE--
  -Clase Puerta
  -Clase Puertas Abiertas
  -Clase Puertas Cerradas

  -Instanciacion de las puertas
  */

//-------------------------------------------------------------------------------clase  Puertas
class Puertas {
  var property image //"Door1.png" 
  var property position = game.origin() 
  var property irHacia //comedor.iniciar()
  var property mensaje //puertaCerrada
  const musicaAmbiente

  //--Reubicacion
  method ubicarEn(unaUbicacion) {
    self.position(unaUbicacion)  
  }
}
//-------------------------------------------------------------------------------clase Puetas Abiertas
class PuertasAbiertas inherits Puertas  {
  var property puertaAbierta = image
  //--Puertas abiertas
  method interaccion() {
    musicaAmbiente.stop()
    irHacia.iniciar()
  }
}
//-------------------------------------------------------------------------------clase Puertas Cerradas
class PuertasCerradas inherits Puertas  {
  //--puertas cerradas
  var property item
  var property puertaAbierta 
  var property puertaCerrada

  method interaccion() {
    if(item.enInventario()){
        image = puertaAbierta//--al pasar por la puerta, esta queda abierta
        musicaAmbiente.stop()
        habitacion.cargarListaconPuertas(self)
        irHacia.iniciar()
    }
    else{
      game.addVisual(mensaje)//--muestra texto--
      game.schedule(2000, { => game.removeVisual(mensaje)})//--borra el texto
    }
  }
  method cerrarPuerta() {
    image = puertaCerrada
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//--puertas abiertas
const puertaAComedor      = new PuertasAbiertas(image= "Door1Open.png", irHacia= comedor, mensaje= textoPuertaCerrada, musicaAmbiente= ambiente1 )
const puertaAEntrada      = new PuertasAbiertas(image= "Door1Open.png", irHacia= entrada, mensaje= textoPuertaCerrada, musicaAmbiente= ambiente1 )
const escaleraAEntrada    = new PuertasAbiertas(image= "escalerasDownV2.png", irHacia= entrada, mensaje= textoPuertaCerrada, musicaAmbiente= ambiente2 )
const escaleraAPrimerPiso = new PuertasAbiertas(image= "escalerasUp.png", irHacia= entradaPrimerPiso, mensaje= textoPuertaCerrada, musicaAmbiente= ambiente1 )
const puertaAPrimerPiso   = new PuertasAbiertas(image= "Door3Open.png", irHacia= entradaPrimerPiso, mensaje= textoPuertaCerrada, musicaAmbiente= ambiente2 )
const puertaABiblioteca   = new PuertasAbiertas(image= "Door3Open.png", irHacia= biblioteca, mensaje= textoPuertaCerrada, musicaAmbiente= ambiente2 )
const puertaARitual       = new PuertasAbiertas(image= "sotano2.png", irHacia= ritual, mensaje= textoPuertaCerrada, musicaAmbiente= salaTunel )
const puertaATunelSalida  = new PuertasAbiertas(image= "escalerasarriba.png", irHacia= final, mensaje= textoPuertaCerrada, musicaAmbiente= salaRitual )
const puertaAJardin       = new PuertasAbiertas(image= "escalerasarriba.png", irHacia= jardin, mensaje= textoPuertaCerrada, musicaAmbiente= salaJardin )

//--puertas Cerradas
const puertaAMusica       = new PuertasCerradas(image="Door1.png",puertaCerrada="Door1.png" ,puertaAbierta="Door1Open.png",item=itemLlaveMusica,irHacia=musica,mensaje=textoPuertaCerrada,musicaAmbiente= ambiente1 )
const puertaACocina       = new PuertasCerradas(image="Door1.png",puertaCerrada="Door1.png",puertaAbierta="Door1Open.png",item=itemLlaveCocina,irHacia=cocina,mensaje=textoPuertaCerrada,musicaAmbiente= ambiente1 )//itemLlaveCocina
const puertaATerraza      = new PuertasCerradas(image="Door3.png",puertaCerrada="Door3.png",puertaAbierta="Door3Open.png",item=itemLlaveTerraza,irHacia=terraza,mensaje=textoPuertaCerrada,musicaAmbiente= ambiente2 )
const puertaADormitorio   = new PuertasCerradas(image="Door3.png",puertaCerrada="Door3.png",puertaAbierta="Door3Open.png",item=itemLlaveDormi,irHacia=dormitorio,mensaje=textoPuertaCerrada,musicaAmbiente= ambiente2 )
const puertaATunel        = new PuertasCerradas(image="sotano2.png",puertaCerrada="sotano2.png",puertaAbierta="sotano2.png",item=itemLlaveSotano,irHacia=tunel,mensaje=textoPuertaCerrada,musicaAmbiente= ambiente1 )//itemLlaveSotano