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

//----------------------------------------------------------OBJ textos
//--Items
const textoLlaveTerraza = new TextosInfo(texto ="Hay algo dentro del vaso...
          !!Encontraste la llave de la Terraza!!",color =color.blanco(), position = game.at(5,0))//Llave terraza

//const textoLlave1 = new TextosInfo(texto ="Que es esto, parece importante...
//          !!Encontraste una llave!!",color =color.blanco(), position = game.at(5,0))//para llave 1

const textoDisco = new TextosInfo(texto ="Que es esto, parece importante...
          !!Encontraste un Disco!!",color =color.blanco(), position = game.at(5,0))//Gema1

const textoLlaveMusica = new TextosInfo(texto ="Que es esto, parece importante...
          !!Encontraste la llave de la Sala de Musica!!",color =color.blanco(), position = game.at(5,0))//Llave musica


const textoEncendedor = new TextosInfo(texto ="Que es esto, parece importante...
          !!Encontraste un Encendedor!!",color =color.blanco(), position = game.at(5,0))//Encendedor

//
const textoEmblema = new TextosInfo(texto ="Que es esto, parece importante...
          !!Encontraste un Emblema!!",color =color.blanco(), position = game.at(5,0))//Emblema

const textoNota1 = new TextosInfo(texto ="Que es esto, parece importante...
          !!Encontraste una nota!!",color =color.blanco(), position = game.at(5,0))//Nota

const textoLlaveD = new TextosInfo(texto ="Que es esto, parece importante...
          !!Encontraste la llave del dormitorio!!",color =color.blanco(), position = game.at(5,0))//Llave Dormitorio

const textoLlaveC = new TextosInfo(texto ="Que es esto, parece importante...
          !!Encontraste la llave de la Cocina!!",color =color.blanco(), position = game.at(5,0))//Llave Dormitorio

const nadaImportante = new TextosInfo(texto ="No hay nada interesante aqui",color =color.blanco(), position = game.at(5,0))
const hayAlgoPero = new TextosInfo(texto ="Hay algo aqui pero...",color =color.blanco(), position = game.at(5,0))
const yaNoHayNada = new TextosInfo(texto ="Ya no hay nada importante aqui",color =color.blanco(), position = game.at(5,0))
const estaVacio = new TextosInfo(texto ="Esta vacio...",color =color.blanco(), position = game.at(5,0))


//----------------------------------------------------------Info de Items
const txtPuertaCerrada = new TextosInfo(texto ="La puerta esta Cerrada",color =color.blanco(), position = game.at(5,0))//para las puertas cerradas


//---------------------------------------------------------Info de ubicacion
const ubicacionEntrada =       new TextosInfo(texto ="        Entrada",             color =color.blanco(), position = game.at(5,11))
const ubicacionComedor =       new TextosInfo(texto ="        El Comedor",          color =color.blanco(), position = game.at(5,11))
const ubicacionMusica =        new TextosInfo(texto ="        La Sala de Musica",   color =color.blanco(), position = game.at(5,11))
const ubicacionPrimerPiso =    new TextosInfo(texto ="        Primer Piso",         color =color.blanco(), position = game.at(5,11))
const ubicacionTerraza =       new TextosInfo(texto ="        La Terraza",          color =color.blanco(), position = game.at(5,11))
const ubicacionBiblioteca =    new TextosInfo(texto ="        La Biblioteca",       color =color.blanco(), position = game.at(5,11))
const ubicacionCocina =        new TextosInfo(texto ="        La Cocina",           color =color.blanco(), position = game.at(5,11))
const ubicacionDormitorio =    new TextosInfo(texto ="        El Dormitorio",       color =color.blanco(), position = game.at(5,11))
const ubicacionTunel =         new TextosInfo(texto ="        El Tunel Secreto",    color =color.blanco(), position = game.at(5,11))
const ubicacionRitual =        new TextosInfo(texto ="        La Sala del Ritual",  color =color.blanco(), position = game.at(5,11))
const ubicacionTunelSalida =   new TextosInfo(texto ="        Tunel de Escape",     color =color.blanco(), position = game.at(5,11))
const ubicacionJardinTrasero = new TextosInfo(texto ="        Jardin Trasero",      color =color.blanco(), position = game.at(5,11))


