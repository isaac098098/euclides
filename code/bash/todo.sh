#!/bin/bash

if ! [[ "$1" ]]
then
    echo -e "options\n\tadd\n\ttoday\n\tdate\n\tarchive\n\tsort\n\tpull\n\tpush"
    exit 0
fi

case $1 in
    add)
        echo "$2" >> $HOME/todo/todo.txt
    ;;
    today)
        awk "match(\$0, /due:$(date '+%Y-%m-%d')/) {print substr(\$0, RSTART+4, RLENGTH-4), \$0}" $HOME/todo/todo.txt | sort | cut -d ' ' -f2-
    ;;
    date)
        awk "match(\$0, /due:$2/) {print substr(\$0, RSTART+4, RLENGTH-4), \$0}" $HOME/todo/todo.txt | sort | cut -d ' ' -f2-
    ;;
    archive)
        grep -E '^x ' $HOME/todo/todo.txt >> $HOME/todo/done.txt
        sed -i '/^x /d' $HOME/todo/todo.txt
    ;;
    sort)
        awk 'match($0, /due:[0-9]{4}-[0-9]{2}-[0-9]{2}/) {print substr($0, RSTART+4, RLENGTH-4), $0}' $HOME/todo/todo.txt | sort | cut -d ' ' -f2- > $HOME/todo/tmp.txt
        mv $HOME/todo/tmp.txt $HOME/todo/todo.txt
    ;;
    pull)
        git pull
    ;;
    push)
        git -C "$HOME/todo" add .
        git -C "$HOME/todo" commit -m "$(date '+%Y-%m-%d')"
        git -C "$HOME/todo" push
    ;;
    *)
        echo "invalid option"
    ;;
esac

exit 0
