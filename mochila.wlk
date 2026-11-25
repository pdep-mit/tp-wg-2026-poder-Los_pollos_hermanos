import wollok.game.*

//MOCHILA DEL PROTA

object mochila {
  const objetos = []
  const recogidos = #{}

  method objetos() = objetos.copy() // Copia para que nadie modifique la mochila desde afuera
  method fueRecogido(objeto) = recogidos.contains(objeto)
  method cantidad() = objetos.size()
  method estaVacia() = objetos.isEmpty()
  method tiene(objeto) = objetos.contains(objeto)
  method tieneTodos(lista) = lista.all({ objeto => self.tiene(objeto) })

  method guardar(objeto) {
    if (self.tiene(objeto)) {
      self.error("Ya tengo eso en la mochila")
    }
    objetos.add(objeto)
    recogidos.add(objeto)
  }

  method sacar(objeto) {
    self.validarQueTiene(objeto)
    objetos.remove(objeto)
  }

  // Valida todo antes de sacar, asi no queda la mochila a medias si falta algo
  method sacarTodos(lista) {
    self.validarQueTieneTodos(lista)
    objetos.removeAll(lista)
  }

  //  ej. yerba + termo lleno + mate -> mate armado
  method combinar(ingredientes, resultado) {
    self.sacarTodos(ingredientes) // limpia lo usado
    self.guardar(resultado)
  }

  // Usar un objeto con el entorno: ej. termo vacio -> termo lleno
  method cambiar(viejo, nuevo) { self.combinar([viejo], nuevo) } 
  // el temita de le pasa viejo por parametro como lista es porque combinar opera con listas
  // esta pensado para que en un futuro reciba mas de uno para cambiar(N por 1) y funque igual 
  method validarQueTiene(objeto) {
    if (!self.tiene(objeto)) {
      self.error("No tengo eso en la mochila")
    }
  }

  method validarQueTieneTodos(lista) {
    if (!self.tieneTodos(lista)) {
      self.error("Me faltan cosas en la mochila")
    }
  }
}

