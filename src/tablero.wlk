import barraItems.*
import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import wollok.game.*
import fantasma.*
import ritual.*

/*--INDICE--Habitacion
-siEstaEnInventario(unItem) muestra el item en la zona de inventario
-iniciarHabitacion(unaUbicacion,textoUbicacion) Borra todo lo que estaba en la pantalla, inicia fondo y agrega el nombre a la zona
-ubicarEnTablero(puertaA, x, y)
-ubicarUnKeyItem(unItem, x, y)
-ubicarPersonaje(x, y)
-UbicarPersonajePuertasCant2(ubicacion1, x1, y1, x2, y2) --sin uso--
-borrarTodo(unFondo) 
*/

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
    
    //personaje
    game.removeVisual(personaje)
    
    //Items
    game.removeVisual(itemLlaveTerraza)
    game.removeVisual(iconLlave1Inv)

    game.removeVisual(iconDisco)
    game.removeVisual(iconDiscoInv)

    game.removeVisual(itemLlaveMusica)
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

    game.removeVisual(itemNota2)
    game.removeVisual(iconNota2)
    game.removeVisual(iconNota2Inv)

    game.removeVisual(itemLlaveSotano)
    game.removeVisual(iconLlaveSotano)
    game.removeVisual(iconLlaveSotanoInv)

    game.removeVisual(itemNota3)
    game.removeVisual(iconNota3)
    game.removeVisual(iconNota3Inv)
    game.removeVisual(txtClavePolvo1)

    game.removeVisual(itemNota3P2)
    game.removeVisual(iconNota3P2)
    game.removeVisual(iconNota3P2Inv)
    game.removeVisual(txtClavePolvo2)

    game.removeVisual(itemPolvoEstrellas)
    game.removeVisual(iconPolvoEstrellas)
    game.removeVisual(iconPolvoEstrellasInv)
    
    //topes
    game.removeVisual(topeArriba)
    game.removeVisual(topeAbajo)
    game.removeVisual(topeDer)
    game.removeVisual(topeIzq)

    //--corazones
    game.removeVisual(corazon1)
    game.removeVisual(corazon2)
    game.removeVisual(corazon3)

    //Antorchas
    game.removeVisual(antorcha1)
    game.removeVisual(antorcha2)
    game.removeVisual(antorcha3)
    game.removeVisual(antorcha4)
    game.removeVisual(antorcha5)

    //Enemigos
    game.removeVisual(fantasmaDiagonaEntrada1)
    //game.removeVisual(fantasmaDiagonaEntrada2)
    //game.removeVisual(fantasmaDiagonaEntrada3)
    //game.removeVisual(fantasmaDiagonaEntradaOP1)
    
    game.removeVisual(fantasmaDiagonalComedor1)
    game.removeVisual(fantasmaDiagonalComedor2)
    game.removeVisual(fantasmaDiagonalComedor3)

    game.removeVisual(fantasmaDiagonalCocina1)
    game.removeVisual(fantasmaDiagonalCocina2)
    game.removeVisual(fantasmaDiagonalCocina3)//op

    game.removeVisual(fantasmaDiagonalMusica1)
    game.removeVisual(fantasmaDiagonalMusica2)
    game.removeVisual(fantasmaDiagonalMusica3)//op

    //primerPiso
    game.removeVisual(fantasmaDiagonalPrimerPiso1)

    //terraza
    game.removeVisual(fantasmaDiagonalTerraza1)
    game.removeVisual(fantasmaDiagonalTerraza2)

    //bilbioteca
    game.removeVisual(fantasmaDiagonalBiblio1)
    game.removeVisual(fantasmaDiagonalBiblio2)
    game.removeVisual(fantasmaDiagonalBiblio3)//op

    //dormitorio
    game.removeVisual(fantasmaDiagonalDormi1)
    game.removeVisual(fantasmaDiagonalDormi2)
    game.removeVisual(fantasmaDiagonalDormi3)//op


    //ritual
    game.removeVisual(fantasmaDiagonaRitual1)
    game.removeVisual(fantasmaDiagonaRitual2)
    game.removeVisual(fantasmaDiagonaRitual3)
    game.removeVisual(fantasmaDiagonaRitual4)
    game.removeVisual(fantasmaDiagonaRitual5)
    game.removeVisual(fantasmaDiagonaRitual6)
    game.removeVisual(fantasmaDiagonaRitual7)
    game.removeVisual(fantasmaDiagonaRitual8)
    game.removeVisual(fantasmaDiagonaRitual9)
    game.removeVisual(fantasmaDiagonaRitual10)
    
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
    game.removeVisual(puertaATunelSalida)
    
    //textos de Ubicacion
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
    
    //otros textos de escena
    game.removeVisual(txtNadaSilla)
    game.removeVisual(txtClaveEspejo)
    game.removeVisual(txtClaveReloj)
    game.removeVisual(txtKatyCursed)
    game.removeVisual(txtComentariosDeMas)

    game.removeVisual(txtEspejo)
    game.removeVisual(txtJarron)
    game.removeVisual(txtSillaRota)
    game.removeVisual(txtComida)
    game.removeVisual(txtRoto)
    game.removeVisual(txtCuadro)
    game.removeVisual(txtPlanta)
    game.removeVisual(txtReloj)
    game.removeVisual(txtNadaImportante)
    game.removeVisual(txtBiblioInfo1)
    game.removeVisual(txtBiblioInfo2)
    game.removeVisual(txtBiblioInfo3)
    game.removeVisual(txtBiblioInfo4)

    
    //--para hacer
    game.removeVisual(txtLamparas)
    game.removeVisual(txtHeladera)
    game.removeVisual(txtPuertaSinUso)
    game.removeVisual(txtCocina)
    game.removeVisual(txtEstantes)

    game.removeVisual(txtMesitas)
    game.removeVisual(txtTv)
    game.removeVisual(txtRadio)
    game.removeVisual(txtSofa)
    game.removeVisual(txtAlfombra)

    game.removeVisual(txtPiano)
    game.removeVisual(txtViolin)
    game.removeVisual(txtOcarina)
    game.removeVisual(txtArpa)
    game.removeVisual(txtRadioMusic)

    game.removeVisual(txtCofreDormi)
    game.removeVisual(txtCuadro2)
    game.removeVisual(txtSikus)
    game.removeVisual(txtPolvoPiso)
    game.removeVisual(txtMuebles2)

  }
}