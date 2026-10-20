import wollok.game.*

//MOCHILA DEL PROTAGONISTA
object mochila {
  const objetos = []

  method guardar(objeto) { objetos.add(objeto) }
  method tiene(objeto) = objetos.contains(objeto)
}
