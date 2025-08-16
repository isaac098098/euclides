#!/bin/bash

rsync -aH --delete --itemize-changes $HOME/zettelkasten_backup_250815_1559/ $HOME/zettelkasten/
