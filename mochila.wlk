import wollok.game.*

//MOCHILA DEL PROTA

object mochila {
  const objetos = []

  method objetos() = objetos.copy() // Copia para que nadie modifique la mochila desde afuera
  method cantidad() = objetos.size()
  method estaVacia() = objetos.isEmpty()
  method tiene(objeto) = objetos.contains(objeto)

  method guardar(objeto) {
    if (self.tiene(objeto)) {
      self.error("Ya tengo eso en la mochila")
    }
    objetos.add(objeto)
  }

  method sacar(objeto) {
    self.validarQueTiene(objeto)
    objetos.remove(objeto)
  }
//usar()- lo que hace el objeto cuando se usa
  method usar(objeto) {
    self.validarQueTiene(objeto)
    objeto.usar()
    if (objeto.seConsume()) { // seConsume()¿- true si desaparece de la mochila despues de usarlo
      objetos.remove(objeto)
    }
  }

  method validarQueTiene(objeto) {
    if (!self.tiene(objeto)) {
      self.error("No tengo eso en la mochila")
    }
  }
}
