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

const puertaAComedor = new PuertasAbiertas(image= "Door1Open.png", irHacia= comedor, mensaje= txtPuertaCerrada )

const puertaAEntrada = new PuertasAbiertas(image= "Door1Open.png", irHacia= entrada, mensaje= txtPuertaCerrada )

const escaleraAEntrada = new PuertasAbiertas(image= "escalerasDownV2.png", irHacia= entrada, mensaje= txtPuertaCerrada )

const puertaAMusica = new PuertasCerradas(image= "Door1.png",puertaCerrada = "Door1Open.png", item= itemLlaveMusica, irHacia= musica, mensaje= txtPuertaCerrada )

const escaleraAPrimerPiso = new PuertasAbiertas(image= "escalerasUp.png", irHacia= entradaPrimerPiso, mensaje= txtPuertaCerrada )

const puertaAPrimerPiso = new PuertasAbiertas(image= "Door3Open.png", irHacia= entradaPrimerPiso, mensaje= txtPuertaCerrada )

const puertaACocina = new PuertasCerradas(image= "Door1.png",puertaCerrada = "Door1Open.png", item= itemLlaveTerraza, irHacia= cocina, mensaje= txtPuertaCerrada )//itemLlaveCocina

const puertaATerraza = new PuertasCerradas(image= "Door3.png",puertaCerrada = "Door3Open.png", item= itemLlaveTerraza, irHacia= terraza, mensaje= txtPuertaCerrada )

const puertaADormitorio = new PuertasCerradas(image= "Door3.png",puertaCerrada = "Door3Open.png", item= itemLlaveDormi, irHacia= dormitorio, mensaje= txtPuertaCerrada )

const puertaABiblioteca = new PuertasAbiertas(image= "Door3Open.png", irHacia= biblioteca, mensaje= txtPuertaCerrada )

//--------------
const puertaATunel = new PuertasCerradas(image= "sotano2.png",puertaCerrada = "sotano2.png", item= itemLlaveTerraza, irHacia= tunel, mensaje= txtPuertaCerrada )//itemLlaveSotano

const puertaARitual = new PuertasAbiertas(image= "sotano2.png", irHacia= ritual, mensaje= txtPuertaCerrada )

const puertaATunelSalida = new PuertasAbiertas(image= "escalerasarriba.png", irHacia= final, mensaje= txtPuertaCerrada )

const puertaAJardin = new PuertasAbiertas(image= "escalerasarriba.png", irHacia= jardin, mensaje= txtPuertaCerrada )