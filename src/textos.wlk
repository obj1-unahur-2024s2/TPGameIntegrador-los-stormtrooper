import objetos.*
import wollok.game.*

//----------------------------------------------------------Clase texto
class TextosInfo {
  const property texto
  const property color
  const property position 

  method text() = texto
  method textColor() = color
  method position() = position
}

//----------------------------------------------------------Color de textos
object color {
  const property blanco = "#ffffff"
  const property rojo = "#ff0000"
  const property amarillo = "#ffff00"
}



//-------------------------------------------------------OBJ textos
//--Items
const textoLlave1 = new TextosInfo(texto ="Que es esto, parece importante...
!!Encontraste una llave!!",color =color.blanco(), position = game.at(5,0))//para llave 1
const nadaImportante = new TextosInfo(texto ="No hay nada interesante aqui",color =color.blanco(), position = game.at(5,0))


//----------------------------------------------------------Info de Items
const txtPuertaCerrada = new TextosInfo(texto ="La puerta esta Cerrada",color =color.blanco(), position = game.at(5,0))//para las puertas cerradas



//---------------------------------------------------------Info de ubicacion
const ubicacionEntrada =       new TextosInfo(texto ="Entrada",             color =color.blanco(), position = game.at(5,0))
const ubicacionComedor =       new TextosInfo(texto ="El Comedor",          color =color.blanco(), position = game.at(5,0))
const ubicacionMusica =        new TextosInfo(texto ="La Sala de Musica",   color =color.blanco(), position = game.at(5,0))
const ubicacionPrimerPiso =    new TextosInfo(texto ="Entrada Segundo Piso",color =color.blanco(), position = game.at(5,0))
const ubicacionTerraza =       new TextosInfo(texto ="La Terraza",          color =color.blanco(), position = game.at(5,0))
const ubicacionBiblioteca =    new TextosInfo(texto ="La Biblioteca",       color =color.blanco(), position = game.at(5,0))
const ubicacionCocina =        new TextosInfo(texto ="La Cocina",           color =color.blanco(), position = game.at(5,0))
const ubicacionDormitorio =    new TextosInfo(texto ="El Dormitorio",       color =color.blanco(), position = game.at(5,0))
const ubicacionTunel1 =        new TextosInfo(texto ="El Tunel Secreto",    color =color.blanco(), position = game.at(5,0))
const ubicacionRitual =        new TextosInfo(texto ="La Sala del Ritual",  color =color.blanco(), position = game.at(5,0))
const ubicacionTunelSalida =   new TextosInfo(texto ="Tunel de Escape",     color =color.blanco(), position = game.at(5,0))
const ubicacionJardinTrasero = new TextosInfo(texto ="Jardin Trasero",      color =color.blanco(), position = game.at(5,0))
