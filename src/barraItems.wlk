import puertas.*
import objetos.*
import titulo.*
import personaje.*
import textos.*
import wollok.game.*

object barraItems {
  
  method verificar() {
    self.siEstaEnInventario(iconLlave1Inv)
    //self.siEstaEnInventario(iconGema1Inv)
    self.siEstaEnInventario(iconDiscoInv)
    self.siEstaEnInventario(iconLlaveMInv)
    self.siEstaEnInventario(iconEncendedorInv)
    self.siEstaEnInventario(iconEmblemaInv)
    self.siEstaEnInventario(iconNota1Inv)
    self.siEstaEnInventario(iconLlaveDInv)
    self.siEstaEnInventario(iconLlaveCInv)
  }

  method siEstaEnInventario(unItem) {//ubicador de items inventario
    if(unItem.loTengo())
      game.addVisual(unItem)
  }
}