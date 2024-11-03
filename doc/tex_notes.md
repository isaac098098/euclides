# Neovim + vimtex notes workflow

Paquetes requeridos: `neovim`, `vimtex`, `zathura`, `rofi`, `sxhkd`.

Crear una carpeta en la que se almacenarán las notas de cada curso, también en carpetas. En este caso `$HOME/notes`. Dentro de esta carpeta también se hallará un enlace simbólico llamado `current-notes`, el cuál apuntará a la carpeta con las notas del curso en el que se quiera trabajar en un momento determinado. Sin embargo, no existirá tal carpeta, es decir, no se debe crear una carpeta real sino solo el enlace simbólico, el cuál cambiará dinámicamente. El archivo `.tex` de todos los cursos deben llamarse `main.tex` y se llena usando el snippet `math-notes`.

Se deben crear las carpetas para cada curso antes de usar los siguientes atajos de teclado. Éstas deberán contener el archivo `main.tex`, que se puede crear seleccionando el curso con `alt-s` y abriendo el archivo principal de las notas con `alt+n`. En la carpeta padre, es decir en la carpeta `notes`, deberán estar `pream.tex` y `eof.tex`, que se pueden copiar usando el binario `pream`.

Todos los archivos de las clases tendrán el formato `lec_[num].tex`. Todos estos archivos también deberán contener un encabezado de la forma `*lecture{title}{date}` para extraer el tema de la clase.

## Atajos

- Seleccionar curso: `alt+s`.
- Abrir `main.tex` en neovim `alt+n`.
- Compilar y abrir notas de una clase o varias en zathura `alt+p`.
- Abrir notas de una clase en neovim `alt+o`.


## Adding bibliography entries
1. Open the bibliography file. E.g. `bibliography.bib`
2. Add the BibTeX entry using snippets and fill it.
3. Go back to the lecture document and cite.
4. If there's not enough information to fill the entry, use the `foo` snippet to add a temporary footnote.
