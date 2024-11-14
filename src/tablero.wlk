import barraItems.*
import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import wollok.game.*
import fantasma.*

object habitacion {
  method siEstaEnInventario(unItem) {//ubicador de items inventario
    if(unItem.loTengo())
      game.addVisual(unItem)
  }

  method iniciarHabitacion(unaUbicacion,textoUbicacion) {//borra todo y carga el fondo
    self.borrarTodo(unaUbicacion)//inicializa el tablero
    game.addVisual(unaUbicacion)
    //--texto indicador de lugar--
    game.addVisual(textoUbicacion)
    barraDeVida.mostrarVidas()
  }

  method ubicarEnTablero(puertaA, x, y) {//ubica objetos en la pantalla
    game.addVisual(puertaA)
    puertaA.ubicarEn(game.at(x,y))
  }

  method ubicarUnKeyItem(unItem, x, y) {//ubica item que luego desaparecen
    if(!unItem.enInventario())
      game.addVisual(unItem)
      unItem.ubicarEn(game.at(x,y))
  }

  method ubicarPersonaje(x, y) {//ubica al personaje 
      game.addVisualCharacter(personaje)
      personaje.irA(game.at(x,y))
  }

  method UbicarPersonajePuertasCant2(ubicacion1, x1, y1, x2, y2) {
    if(personaje.ubicacion() ==ubicacion1){
      game.addVisualCharacter(personaje)
      personaje.irA(game.at(x1,y1))
      }
    else{
      game.addVisualCharacter(personaje)
      personaje.irA(game.at(x2,y2))
      }
  }

  method borrarTodo(unFondo) {//borra todo cada vez que cambia de pantalla (--ES IMPORTANTE QUE TODOS LOS OBJETOS ESTEN CARGADO ACA--)
    //fondo
    game.removeVisual(unFondo)
    //personaje, items
    game.removeVisual(personaje)
    
    game.removeVisual(itemLlaveTerraza)
    game.removeVisual(iconLlave1Inv)
    game.removeVisual(txtNadaImportante)
    //game.removeVisual(itemGema1)
    //game.removeVisual(iconGema1Inv)
    game.removeVisual(iconDisco)
    game.removeVisual(iconDiscoInv)

    game.removeVisual(iconLlaveMusica)
    game.removeVisual(iconLlaveMInv)

    game.removeVisual(itemEncendedor)
    game.removeVisual(iconEncendedorInv)

    game.removeVisual(itemEmblema)
    game.removeVisual(iconEmblemaInv)

    game.removeVisual(itemNota1)
    game.removeVisual(iconNota1Inv)

    game.removeVisual(itemLlaveDormi)
    game.removeVisual(iconLlaveDInv)

    game.removeVisual(itemLlaveCocina)
    game.removeVisual(iconLlaveCInv)

    game.removeVisual(topeArriba)
    game.removeVisual(topeAbajo)
    game.removeVisual(topeDer)
    game.removeVisual(topeIzq)

    //--corazones
    game.removeVisual(corazon1)
    game.removeVisual(corazon2)
    game.removeVisual(corazon3)

    //Enemigos
    game.removeVisual(fantasmaDiagonaEntrada1)
    game.removeVisual(fantasmaDiagonaEntrada2)
    game.removeVisual(fantasmaDiagonaEntrada3)
    game.removeVisual(fantasmaDiagonaEntradaOP1)
    
    //puertas
    game.removeVisual(puertaAComedor)
    game.removeVisual(puertaAEntrada)
    game.removeVisual(puertaAMusica)
    game.removeVisual(escaleraAPrimerPiso)
    game.removeVisual(puertaACocina)
    game.removeVisual(puertaATerraza)
    game.removeVisual(puertaAPrimerPiso)
    game.removeVisual(escaleraAEntrada)
    game.removeVisual(puertaABiblioteca)
    game.removeVisual(puertaADormitorio)
    game.removeVisual(puertaATunel)
    game.removeVisual(puertaARitual)
    //game.removeVisual(objConItem)
    //textos Ubicacion
    game.removeVisual(ubicacionEntrada)
    game.removeVisual(ubicacionComedor)
    game.removeVisual(ubicacionMusica)
    game.removeVisual(ubicacionPrimerPiso)
    game.removeVisual(ubicacionTerraza)
    game.removeVisual(ubicacionBiblioteca)
    game.removeVisual(ubicacionCocina)
    game.removeVisual(ubicacionDormitorio)
    game.removeVisual(ubicacionTunel)
    game.removeVisual(ubicacionRitual)
    game.removeVisual(ubicacionTunelSalida)
    game.removeVisual(ubicacionJardinTrasero)

  }
}