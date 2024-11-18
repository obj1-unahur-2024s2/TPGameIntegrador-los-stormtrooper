import tituloJuego.*


object creditos {
  const property image = "creditos.png"   
  var property position = game.origin()

  method iniciar() {
    game.addVisual(self)
    game.schedule(3000, {=> tituloJuego.iniciar()})
  }
}