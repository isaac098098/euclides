# Dependencies

- `dep.md`: master `euclides` 
- `books`: master `euclides` 
- `mac`: master `T495` 
- `notes`: master `T495` 
- `zettelkasten`: master `T495` 
- `courses`: master `JL` 
- `academic`: master `T495` 
- `formalities`: master `euclides` 
- `images`: master `euclides` 
- `code`: master `pavilionx360` 
- `backup`: master `JL` 
- `code`: master `euclides` 
- `config.md`: master `euclides` 
- `doc.md`: master `euclides` 
- `archive`: master `euclides` 
- `programs`: master `euclides` 
- `notes_skeleton`: master `euclides` 
- `zettelkasten_skeleton`: master `euclides` 
- `templates`: master `euclides` 
- `.config/nvim`: master `euclides` 
- `.config/rofi/scripts`: master `T495` 
- `.config/hypr`: master `T495` 
- `T495/backup`: master `T495` 
- `backup`: master `JL` 

# Contents

## `euclides`

```
$HOME
├── .config
│   ├── alacritty
│   ├── awesome
│   ├── dunst
│   ├── gtk-3.0
│   ├── gtk-4.0
│   ├── i3
│   ├── i3status
│   ├── nvim
│   ├── picom
│   ├── rofi
│   ├── sxhkd
│   ├── zathura
├── .icons
│   └── default
├── .local
│   └── bin
├── .mpv
│   └── config
├── Documents -> $HOME/documents
├── Downloads -> $HOME/downloads
├── Pictures -> $HOME/pictures
├── documents
│   ├── academic
│   ├── backup
│   ├── books
│   ├── code
│   ├── comm
│   ├── fonts
│   ├── formalities
│   ├── projects
│   ├── reading
│   ├── technical
│   ├── templates
│   └── writing
├── downloads
├── euclides
│   ├── .config
│   ├── .git
│   ├── archive
│   ├── code
│   ├── doc
│   ├── home
│   └── templates
│       ├── tex
│       │   ├── art
│       │   ├── notes_skeleton
│       │   └── zettelkasten_skeleton
│       └── vander
│           ├── templates
│           ├── tests
│           └── pdf
├── phone
├── repos
│   ├── Archive.org-Downloader
│   ├── bark
│   ├── latex-luasnips
│   ├── packettracer
│   ├── paru-bin
│   ├── spotify-adblock
│   ├── stable-diffusion-webui
│   └── texlive
├── todo
│   ├── .git
│   ├── done.txt
│   ├── incomplete.txt
│   ├── objectives.txt
│   ├── todo.sh
│   └── todo.txt
├── .Xresources
├── .bash_profile
├── .bashrc
├── .update_dotfiles.sh
├── .vimrc
└── .xinitrc
```

## `pavilionx360`

```
$HOME
├── .config
│   ├── alacritty
│   ├── dunst
│   ├── gtk-3.0
│   ├── nvim
│   ├── rofi
│   ├── zathura
├── .icons
│   └── default
├── .local
│   └── bin
├── .mpv
│   └── config
├── Documents -> $HOME/documents
├── Downloads -> $HOME/downloads
├── Pictures -> $HOME/pictures
├── documents
│   ├── academic
│   ├── backup
│   ├── books
├── downloads
├── pavilionx360
│   ├── .config
│   ├── .git
│   └── home
├── phone
├── repos
│   ├── paru-bin
│   └── texlive
├── todo
│   ├── .git
│   ├── done.txt
│   ├── incomplete.txt
│   ├── objectives.txt
│   ├── todo.sh
│   └── todo.txt
├── .Xresources
├── .bash_profile
├── .bashrc
├── .update_dotfiles.sh
├── .vimrc
└── .xinitrc
```

## `T495`

```
$HOME
├── .config
│   ├── alacritty
│   ├── dunst
│   ├── gtk-3.0
│   ├── hypr
│   ├── nvim
│   └── zathura
├── .icons
│   └── default
├── .local
│   └── bin
├── .mpv
│   └── config
├── Documents -> $HOME/documents
├── Downloads -> $HOME/downloads
├── Pictures -> $HOME/pictures
├── documents
│   ├── academic
│   ├── books
│   └──  formalities
├── downloads
├── T495
│   ├── .config
│   ├── .git
│   ├── backup
│   └── home
├── notes
│   ├── current-notes -> $HOME/notes/[CURRENT]
│   ├── [CURRENT]
│   ├── eof.tex
│   └── pream.tex
├── phone
├── repos
│   ├── Archive.org-Downloader
│   ├── paru-bin
│   └── spotify-adblock
├── todo
│   ├── .git
│   ├── done.txt
│   ├── incomplete.txt
│   ├── objectives.txt
│   ├── todo.sh
│   └── todo.txt
├── zettelkasten
│   ├── current -> $HOME/zettelkasten/[CURRENT]
│   ├── [CURRENT]
│   └── preamble.tex
├── .Xresources
├── .bash_profile
├── .bashrc
├── .update_dotfiles.sh
├── .vimrc
└── .xinitrc
```

## `JL`

```
JL
├── backup
├── books
├── courses
├── movies
└── music
```

# Consideraciones

- No clonar archivos de configuración de computadoras ajenas.
- No archivar en otros repositorios que no sean `euclides`.
- Todas las plantillas van en el repositorio `euclides`.
- Cada `update_dotfiles.sh` es independiente.
- Cuando quieras cambiar de tema en `pavilionx360` o en `T495`, primero archiva los ficheros pertinentes en `euclides/archive` (si quieres guardarlos) y después haz los cambios.

## Todo

- [ ] Revisar `pavilionx360/bin`, `pavilionx360/doc` y `pavilionx360/templates`.
- [ ] `.update_dotfiles` para `T495`, donde estarán `zettelkasten_backup` y `notes_backup` en `T496/backup`.
- [ ] Actualizar `.config/rofi/scripts` en `pavilionx360` y en `T495`.
