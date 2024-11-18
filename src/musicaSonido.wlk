object ambiente1 {
  const sonido = game.sound("ambiente.mp3")
  
  method sonar() {
    sonido.play()
  }
  method pausa() {
    sonido.pause()
  }
  method loop() {
    sonido.shouldLoop(true)
  }
  method stop() {
    sonido.stop()
  }
  method played() {
    return sonido.played()
  }
}
object ambiente2 {
  const sonido = game.sound("ambiente2.mp3")
  
  method sonar() {
    sonido.play()
  }
  method pausa() {
    sonido.pause()
  }
  method loop() {
    sonido.shouldLoop(true)
  }
  method stop() {
    sonido.stop()
  }
  method played() {
    return sonido.played()
  }
}
object salaRitual {
  const sonido = game.sound("ritual.mp3")
  
  method sonar() {
    sonido.play()
  }
  method pausa() {
    sonido.pause()
  }
  method loop() {
    sonido.shouldLoop(true)
  }
  method stop() {
    sonido.stop()
  }
  method played() {
    return sonido.played()
  }
}
object salaTunel {
  const sonido = game.sound("tunel.mp3")
  
  method sonar() {
    sonido.play()
  }
  method pausa() {
    sonido.pause()
  }
  method loop() {
    sonido.shouldLoop(true)
  }
  method stop() {
    sonido.stop()
  }
}
object salaJardin {
  const sonido = game.sound("jardin.mp3")
  
  method sonar() {
    sonido.play()
  }
  method pausa() {
    sonido.pause()
  }
  method loop() {
    sonido.shouldLoop(true)
  }
  method stop() {
    sonido.stop()
  }
}
object tituloM {
  const sonido = game.sound("titulo.mp3")
  
  method sonar() {
    sonido.play()
  }
  method pausa() {
    sonido.pause()
  }
  method loop() {
    sonido.shouldLoop(true)
  }
  method stop() {
    sonido.stop()
  }
}
object gameOverM {
  const sonido = game.sound("gameOver.mp3")
  
  method sonar() {
    sonido.play()
  }
  method pausa() {
    sonido.pause()
  }
  method loop() {
    sonido.shouldLoop(true)
  }
  method stop() {
    sonido.stop()
  }
}




//----------------------------------------------------------XFX
object xfxDamage {
  const sonido = game.sound("xfxDamage.mp3")
  
  method sonar() {
    sonido.play()
  }
  method pausa() {
    sonido.pause()
  }
  method loop() {
    sonido.shouldLoop(true)
  }
  method stop() {
    game.schedule(3000, sonido.stop())
    sonido.stop()
  }

  method sonarYParar() {
    self.sonar()
    self.stop()
  }
}
class XfxDamage2 {
  const sonido = game.sound("xfxDamage.mp3")
  
  method sonar() {
    sonido.play()
    if(!sonido.played())
        sonido.stop()
  }
  method pausa() {
    sonido.pause()
  }
  method loop() {
    sonido.shouldLoop(true)
  }
  method stop() {
    game.schedule(3000, sonido.stop())
    sonido.stop()
  }

  method sonarYParar() {
    self.sonar()
    self.stop()
  }
}
const damage1 = new XfxDamage2()
const damage2 = new XfxDamage2()
const damage3 = new XfxDamage2()
