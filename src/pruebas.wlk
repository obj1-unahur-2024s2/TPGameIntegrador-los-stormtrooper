//habitaciones
import wollok.game.*
import entradaPrimerPiso.*
import musica.*
import entrada.*
import comedor.*
import cocina.*
import terraza.*
import biblioteca.*
import dormitorio.*
import tunel.*
import ritual.*
import final.*
import jardin.*

import musicaSonido.*
import tablero.*
import objetos.*
import personaje.*
import textos.*

object prueba {
  
  method iniciar() {
    //textos
    habitacion.ubicarEnTablero(objNadaImportante, 3, 1)
    habitacion.ubicarEnTablero(objNadaSilla, 7, 9)
    habitacion.ubicarEnTablero(objEspejo, 2, 10)
    habitacion.ubicarEnTablero(objJarron, 4, 10)
    habitacion.ubicarEnTablero(objSillaRota, 8, 7)
    //items
    habitacion.ubicarUnKeyItem(itemNota3P2, 3, 9)
    if(itemNota3.enInventario())
      habitacion.ubicarEnTablero(objClavePolvo2, 3, 9)
    
    

    
    //habitacion
    habitacion.ubicarEnTablero(topeArriba, 0, 11)//y max Arriba
    habitacion.ubicarEnTablero(topeAbajo, 0, 0)//y min Abajo
    habitacion.ubicarEnTablero(topeDer, 11, 0)//x max Derecha
    habitacion.ubicarEnTablero(topeIzq, 0, 0)//x min Izquierda
    
    habitacion.ubicarPersonaje(5, 1)

  }
}