# Explicaciones teóricas

## Polimorfismo

Lo usamos un montón, pero lo más importante es cómo manejamos los **objetivos de la historia**. Cuando hablás con un NPC, `Npc.interactuar()` hace `dialogar(wachington.objetivo())`, y el NPC le manda un mensaje al objetivo actual, por ejemplo `objetivo.interactuarConPortero()`. Cada objetivo (`objetivoLimpiarEntrada`, `objetivoBuscarLlave`, etc.) responde distinto al mismo mensaje. Así el portero te dice una cosa si tenés que juntar papeles y otra si ya los tiraste, sin que el portero sepa en qué etapa estamos.

Otros lugares donde hay polimorfismo:

- **`interactuar()`:** `wachington.interactuar()` busca lo que tiene al lado y que sea `esInteractuable()`, y le manda `interactuar()`. No le importa si es un `Npc`, una `Puerta`, un papel o el tacho.
- **`esSolido()`:** `tablero.hayObstaculoEn` le pregunta `esSolido()` a todo lo que hay en la celda (paredes, mesas, NPCs) sin fijarse qué es.
- **`Sala`:** `cargar()` funciona igual para las seis salas, y cada una define su `fondo()`, `objetos()`, `ancho()` y `alto()`.
- **`mochila` y `panelMochila`:** la mochila guarda cualquier cosa que entienda `image()` y `nombre()`, y el panel la dibuja sin saber qué es.

## Colecciones

- **`mochila`:** usa una **lista** (`objetos`) con lo que tenés ahora y un **set** (`recogidos`) con todo lo que alguna vez agarraste. Para esto último nos sirve un set porque no importa el orden ni queremos repetidos. Usamos `all` en `tieneTodos`, `removeAll` en `sacarTodos`, y `objetos()` devuelve una `copy()` para que nadie pueda romper la mochila desde afuera.
- **`hablaron`** en `objetivoConseguirRespuestas`: es un **set** porque si hablás dos veces con el mismo compañero no tiene que contar. Cuando el set llega a 3, avanza la historia (hay un test que lo prueba).
- **Lista para la mochila:** acá elegimos lista porque el orden importa a la hora de dibujar los objetos en el panel.
- **`Sala.objetos()`:** devuelve una lista y `objetosEnElMapa()` la filtra con `filter` para que no vuelva a aparecer lo que ya recogimos.
- **`salasPermitidas()`:** es una lista y la consultamos con `contains` para saber si una puerta te deja pasar.
- **`wachington.interactuar()`:** usa `game.allVisuals().filter(...)` para encontrar a quién tiene al lado.

## Herencia

- `ObjetoDecorativo` → `ObjetoDecorativoSolido` / `ObjetoDecorativoNoSolido` → un montón de paredes, mesas y sillas que solo definen su `image()`. Nos evita repetir `position`, `esInteractuable()` y `esSolido()` en muchas clases.
- `Util` → `Puerta`, `AccesoBloqueado`, `PapelDelPiso` y los objetos con los que se interactúa.
- `Npc` → todos los personajes.
- `Sala` → las seis salas.
- `Objetivo` → todos los objetivos de la historia.

# Diagramas

![Diagrama de clases](Diagrama/Juego.png)