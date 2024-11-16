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
    
    self.siEstaEnInventario(iconNota2Inv)
    self.siEstaEnInventario(iconLlaveSotanoInv)
    
    self.siEstaEnInventario(iconNota3Inv)
    self.siEstaEnInventario(iconNota3P2Inv)
    self.siEstaEnInventario(iconPolvoEstrellasInv)

  }

  method siEstaEnInventario(unItem) {//ubicador de items inventario
    if(unItem.loTengo())
      game.addVisual(unItem)
  }
}