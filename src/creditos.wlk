import tituloJuego.*

import pruebas.*
import tunel.*

object creditos {
  const property image = "creditos.png"     
  const property position = game.origin()

  method iniciar() {
    game.addVisual(self)
    game.schedule(3000, {=> tituloJuego.iniciar()})
  }
}
