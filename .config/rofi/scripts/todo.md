# todo

## cartas

- [ ] añadir condicional para el servidor de `nvim` en todos los scripts que lo utilizen.
- [ ] implementar `next` y `previous` para alfabéticos.

### `delete_card.sh`

- [ ] terminar
- se puede eliminar una carta solo si no tiene subcartas.
- se recorren y renombran recursivamente las cartas hermanas para mantener el orden. usar con cuidado.

### `insert_card.sh`

- [ ] terminar
- se inserta una carta hermana depués de la carta seleccionada, recorriendo y renombrando recursivamente todas las cartas hermanas que siguen. usar con cuidado.

### `create_card.sh`

- [ ] terminar
- se inserta una subcarta en la carta seleccionada, después de su última subcarta.

### `swap_cards.sh`

- [ ] terminar
- al intercambiar cartas se cambian los nombres recursivamente. esto con el fin de dar más flexibilidad al insertar cartas en lugares específicos.

## recomendaciones

- a veces es mejor editar una carta que eliminarla y volverla a crear.

## notes

- implementar todo en `C`. debería ser relativamente fácil después de todo.
