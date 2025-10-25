# todo

## cartas

- [ ] añadir condicional para el servidor de `nvim` en todos los scripts que lo utilizen.
- [ ] implementar `next` y `previous` para alfabéticos.
- [ ] modificar `main.tex` después de un cambio. al eliminar una carta, eliminarla de `main.tex` y simplemente reemplazar los nombres de sus cartas hermanas. al regenerar todo el índice, se borra todo lo que esté debajo de `\begin{document}`. si no existe `\begin{document}`, mostrar un error y no modificar nada. `\begin{document}` necesariamente debe estar en `main.tex`. al crear una carta, si no hay ningún `\input`, la carta creada debe ser la `1`. si no hay ningún `\input` y la carta a crear no es la `1`, mostrar un error y sugerir regenerar todo el índice. si hay `\inputs`, al crear una carta, se inserta una nueva línea donde corresponde. se busca su padre en el árbol abstracto. si el padre es `root`, se inserta después del último nodo raíz. si el padre no es `root`, se busca su línea en `main.tex`, si no existe, se muestra un error y se sugiere regenerar todo el índice. si existe en `main.tex` y no tiene hijos, se inserta la línea debajo, y si los tiene, se busca la línea de su último hijo y se inserta la línea después, si no se encuentra la línea nuevamente se produce un error.
- [ ] extraer metadatos de los archivos. decidir si será con un macro de `LaTeX` o como ya está, usando comentarios en la primera y segunda línea. La ventaja de lo primero es que se pueden escribir en cualquier lugar del texto, la desventaja son usar distintas tags para mostrar en `rofi` y para el `pdf`. puedes tal vez hacer un macro con un argmento opcional, y parsear los casos en los que lo tenga y en los que no. se usa solo la primera coincidencia en el texto. ver como parsear esto como expresión regular.
- [ ] agregar lógica para cuando `root` no tiene hijos y se quiere crear una carta raíz nueva, la `1`.

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
