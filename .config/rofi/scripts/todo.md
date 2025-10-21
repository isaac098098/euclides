# todo

## cartas

- añadir condicional para el servidor de `nvim` en todos los scripts que lo utilizen.

### `delete_card.sh`

- se puede eliminar una carta solo si no tiene subcartas.
- se recorren recursivamente las cartas hermanas para mantener el orden.

### `insert_card.sh`

- se inserta una subcarta en la carta seleccionada, después de su última subcarta.

### `swap_cards.sh`

- al intercambiar cartas se cambian los nombres recursivamente. esto con el fin de dar más flexibilidad al insertar cartas en lugares específicos.

### notas

#### algunas técnicas para insertar cartas

- para insertar una carta en un lugar específico, se puede seguir el siguiente esquema: a) crear una carta en la carta padre de la carta que se quiere sustituir. b) intercambiar la carta creada con la carta de interés. este procedimiento tiene la desventaja de que la carta reemplazada será ahora el último hijo de la carta padre, en vez de la siguiente a la reemplazada como sería deseable, por lo que no se recomienda insertar cartas en lugares específicos. si se insiste en conservar ese orden, se puede hacer una sucesión de intercambios desde la última carta hasta la sucesora de la carta insertada manualmente.
- a veces es mejor editar una carta que eliminarla y volverla a crear.

## notes

- implementar todo en `C`. debería ser relativamente fácil después de todo.
