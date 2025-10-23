# todo

## cartas

- [ ] añadir condicional para el servidor de `nvim` en todos los scripts que lo utilizen.
- [ ] implementar `next` y `previous` para alfabéticos.

### `delete_card.sh`

- se puede eliminar una carta solo si no tiene subcartas.
- se recorren y renombran recursivamente las cartas hermanas para mantener el orden. usar con cuidado.
- después de eliminar, se revisa si la carta eliminada tiene una carta hermana sucesora inmediata, si no la tiene, no se hace nada. si la tiene, se recorren las últimas jerarquías de esta y todas las siguientes cartas hermanas un paso hacia atrás.
- de acuerdo con el punto anterior, se renombrarán recursivamente solo las cartas que esten en sucesión con la carta eliminada, es decir, ordenadas. si las cartas están perfectamente ordenadas, es decir, si no hay huecos entre cartas (ver recomendaciones sobre insertar cartas manualmente), todas se reordenarán correctamente, como debería ser.
- se actualiza `main.tex`. se modifica "in place". si se quiere regenerar todo el `main.tex`, se puede hacer ejecutando manualmente el script `regenerate`. este script sobreescribe el archivo con el árbol completo construido con las cartas y elimina archivos que de hecho no existen.

### `insert_card.sh`

- se inserta una carta hermana antes de la carta seleccionada, recorriendo y renombrando recursivamente todas las cartas hermanas que siguen. usar con cuidado.
- si hay una carta antes o si la carta es la primera en la jerarquía, la nueva carta creada pasa al lugar de la carta seleccionada. las jerarquías de la carta seleccionada y sus cartas hermanas se recorren una unidad hacia adelante. en otro caso, simplemente se crea la carta en el lugar anterior a la carta seleccionada, sin modificar las demás cartas hermanas.

### `create_card.sh`

- se inserta una subcarta en la carta seleccionada, después de su última subcarta.

### `swap_cards.sh`

- al intercambiar cartas se cambian los nombres recursivamente. esto con el fin de dar más flexibilidad al insertar cartas en lugares específicos.

## recomendaciones

- se recomienda fuertemente no crear ni eliminar cartas manualmente y dejar que el script lo haga todo. crear cartas manualmente podría dejar huecos en el árbol, haciéndole pensar al script que hay cartas que no existen, por la forma en que este se construye. al crear o eliminar cartas manualmente, también se tendrían que actualizar las inclusiones en `main.tex` manualmente.
- si se insiste en crear cartas manualmente, se puede hacer y luego ejecutar el script `regenerate` para actualizar el archivo `main.tex`. esto garantizará el orden deseado, aunque si hay huecos, estos serán llenados por el script al visualizar el árbol y no tendrán metadata.
- a veces es mejor editar una carta que eliminarla y volverla a crear.

## notes

- implementar todo en `C`. debería ser relativamente fácil después de todo.
