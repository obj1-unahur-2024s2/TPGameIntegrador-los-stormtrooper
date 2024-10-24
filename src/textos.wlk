import objetos.*
import wollok.game.*

//----------------------------------------------------------Color de textos
object color {
  const property blanco = "#ffffff"
  const property rojo = "#ff0000"
  const property amarillo = "#ffff00"
}

//----------------------------------------------------------Items
object textoLlave1 {
  method position() = game.at(5,0)//(x,y)
  method text() = "Que es esto, parece importante... 
  !!Encontraste una llave!!"
  method textColor() = color.blanco()
}
//----------------------------------------------------------Info de Items
object puertaCerrada {
  method position() = game.at(5,0)//(x,y)
  method text() = "La puerta esta Cerrada"
  method textColor() = color.blanco()
}

//---------------------------------------------------------Info de ubicacion
object ubicacionEntrada {
  method position() = game.at(5,0)//(x,y)
  method text() = "La Entrada"
  method textColor() = color.blanco()
}
object ubicacionComedor {
  method position() = game.at(5,0)//(x,y)
  method text() = "El Comedor"
  method textColor() = color.blanco()
}
object ubicacionMusica {
  method position() = game.at(5,0)//(x,y)
  method text() = "La Sala de Musica"
  method textColor() = color.blanco()
}
object ubicacionPrimerPiso {
  method position() = game.at(5,0)//(x,y)
  method text() = "Entrada Segundo Piso"
  method textColor() = color.blanco()
}
object ubicacionTerraza {
  method position() = game.at(5,0)//(x,y)
  method text() = "La Terraza"
}
object ubicacionBiblioteca {
  method position() = game.at(5,0)//(x,y)
  method text() = "La Biblioteca"
}
object ubicacionCocina {
  method position() = game.at(5,0)//(x,y)
  method text() = "La Cocina"
}
object ubicacionDormitorio {
  method position() = game.at(5,0)//(x,y)
  method text() = "El Dormitorio"
}
object ubicacionTunel1 {
  method position() = game.at(5,0)//(x,y)
  method text() = "El Tunel Secreto"
}
object ubicacionRitual {
  method position() = game.at(5,0)//(x,y)
  method text() = "La Sala del Ritual"
}
object ubicacionTunelSalida {
  method position() = game.at(5,0)//(x,y)
  method text() = "Tunel de Escape"
}
object ubicacionJardinTrasero {
  method position() = game.at(5,0)//(x,y)
  method text() = "Jardin Trasero"
}