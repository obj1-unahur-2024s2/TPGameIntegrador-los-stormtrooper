import objetos.*
import wollok.game.*

/*--INDICE--
-Clase Texto
-Obj Color

-Instanciacion
*/

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
const textoLlaveTerraza = new TextosInfo(texto =" Hay algo dentro del vaso...
          !!Encontraste la llave de la Terraza!!",color =color.blanco(), position = game.at(6,0))//Llave terraza

//const textoLlave1 = new TextosInfo(texto ="Que es esto, parece importante...
//          !!Encontraste una llave!!",color =color.blanco(), position = game.at(5,0))//para llave 1

const textoDisco = new TextosInfo(texto ="  Una bolsa de basura. Espera, que es esto!
          !!Encontraste un Disco!!",color =color.blanco(), position = game.at(6,0))//Gema1

const textoLlaveMusica = new TextosInfo(texto ="  Un estante con libr...Espera... que es esto?
          !!Encontraste la llave de la Sala de Musica!!",color =color.blanco(), position = game.at(6,0))//Llave musica

const textoEncendedor = new TextosInfo(texto =" Hay algo dentro del cajon...
          !!Encontraste un Encendedor!!",color =color.blanco(), position = game.at(6,0))//Encendedor

const textoEmblema = new TextosInfo(texto ="  Al encender la chimenea un objeto se cayo.
          !!Encontraste un Emblema!!",color =color.blanco(), position = game.at(6,0))//Emblema

const textoNota1 = new TextosInfo(texto ="  Al usar el tocadiscos algo salio de el.
          Nota:-El vigilante del cielo tiene el secreto-",color =color.blanco(), position = game.at(6,0))//Nota

const textoLlaveD = new TextosInfo(texto =" Usaste el emblema en el reloj.
          !!Encontraste la llave del dormitorio!!",color =color.blanco(), position = game.at(6,0))//Llave Dormitorio

const textoLlaveC = new TextosInfo(texto =" Dentro del telescopio habia algo.
          !!Encontraste la llave de la Cocina!!",color =color.blanco(), position = game.at(6,0))//Llave Dormitorio

const textoNota2 = new TextosInfo(texto =" Hay una NOTA dentro de la botella...
          -Donde los sueños y pesadillas comienzan-",color =color.blanco(), position = game.at(6,0))//Encendedor

const textoLlaveSotano = new TextosInfo(texto =" Dentro de la almohada hay algo pesado...
          !!Encontraste la llave del sotano!!",color =color.blanco(), position = game.at(6,0))//Encendedor

const textoNota3 = new TextosInfo(texto =" Hay una NOTA escrita aqui...-El p..vo 
          de estr...as te ay...r. a des..cer la m...íon.-",color =color.blanco(), position = game.at(6,0))//Encendedor

const textoNota3P2 = new TextosInfo(texto =" Hay una NOTA escrita aqui... 
          -Úsal. en las 5 ..chas en .n ..den-",color =color.blanco(), position = game.at(6,0))//Encendedor

const textoPolvoEstrellas = new TextosInfo(texto =" Me parece que esto va a ser util... 
          !!Encontraste el Polvo de Estrellas!!",color =color.amarillo(), position = game.at(6,0))//Encendedor



const nadaImportante = new TextosInfo(texto ="No hay nada interesante aqui",color =color.blanco(), position = game.at(5,0))
const hayAlgoPero = new TextosInfo(texto ="Hay algo aqui pero...",color =color.blanco(), position = game.at(5,0))
const yaNoHayNada = new TextosInfo(texto ="Ya no hay nada importante aqui",color =color.blanco(), position = game.at(5,0))
const estaVacio = new TextosInfo(texto ="Esta vacio...",color =color.blanco(), position = game.at(5,0))
const clavePolvo1 = new TextosInfo(texto =" El p..vo de estr...as te ay... a des..cer la m...íon.",color =color.blanco(), position = game.at(5,10))
const clavePolvo2 = new TextosInfo(texto =" Úsal. en las 5 ..chas en .n ..den",color =color.blanco(), position = game.at(5,10))
//<<<<<<< HEAD

const nadaImportanteSilla = new TextosInfo(texto ="no me gusta esta silla...",color =color.blanco(), position = game.at(5,0))


const claveEspejo = new TextosInfo(texto ="Hay algo escrito aqui: 12, 9, 3, 7, 5. Sigue esa orden. 
                      Mi compañero que aun esta vivo será tu guía...¿?", color= color.blanco(),position=game.at(5, 0))

const claveReloj = new TextosInfo(texto ="Un reloj que aun funciona...
Que raro no?...", color= color.blanco(),position=game.at(5, 0))

//ritual
const txtAntorchaOk = new TextosInfo(texto ="¡¡Al usar el polvo en la antorcha 
                                          un humo de colores salio de ella!!",color =color.blanco(), position = game.at(5,0))
const txtAntorchaMal = new TextosInfo(texto ="¡¡No paso nada?!
                                          Algo salio mal!!",color =color.blanco(), position = game.at(5,0))
const txtAntorchaSinPolvo = new TextosInfo(texto ="Es una Antorcha!...
                                          ¿Y que?",color =color.blanco(), position = game.at(5,0))
const txtMaldicionRota = new TextosInfo(texto ="La maldicion se rompio!!!
                                          ¡¡Arriba esta la salida!!!",color =color.blanco(), position = game.at(5,0))

const katyCursed = new TextosInfo(texto ="Katy!? 
Como llegaste hasta aqui? Estas extraña. 
Porque quieres ir hacia esa puerta? 
No queda otra opcion que avanzar...",color =color.blanco(), position = game.at(5,1)) 

//=======
const comentariosDeMas = new TextosInfo(texto ="Pff, este cuadro podría haberlo hecho yo", color= color.blanco(),position=game.at(5, 0))
//>>>>>>> 80e25f83126c53d5bfcc3e02b0b193e17ab706d2

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


