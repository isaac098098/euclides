#!/bin/bash

dir="$HOME/zettelkasten/current"

card=$(echo "$1" | awk '{print $1}')
last_char=${card: -1}
from=()
to=()

if [[ "$last_char" =~ [0-9] ]]
then
    parent=$(echo $card | sed -nE "s/^(.*)[0-9]+$/\1/p")
    siblings=$(ls "$dir/cards" | sed -nE "s/^$parent([0-9]+)\.tex$/\1/p" | sort -n)
    last_sibling=$(echo "$siblings" | tail -n 1)
    first_new=$parent$((10#$last_char + 1))

    for (( i=last_char; i<=last_sibling; i++ ))
    do
        new_parent="$parent$((10#$i + 1))"
        mv "$dir/cards/$parent$i.tex" "$dir/cards/tmp_$new_parent.tex"
        from+=("$parent$i")
        to+=("$new_parent")
        
        children=$(echo "$cards" | sed -nE "s/^$parent$i([a-z]+.*)\.tex$/\1/p")
        for j in $children
        do
            mv "$dir/cards/$parent$i$j.tex" "$dir/cards/tmp_$new_parent$j.tex"
            from+=("$parent$i$j")
            to+=("$new_parent$j")
        done
    done

    tmp=$(ls "$dir/cards" | grep .tex | grep tmp)
    for i in $tmp
    do
        rename=$(echo "$i" | sed -nE 's/tmp_(.*)\.tex/\1/p')
        mv "$dir/cards/$i" "$dir/cards/$rename.tex"
        # echo "$i -> $rename.tex"
    done

    for (( i=0; i<${#from[@]}; i++ ))
    do
        # printf "%s -> %s\n" "${from[$i]}" "${to[$i]}"
        sed -i -E "s|(\\zheader\{[^}]+\})\{${from[$i]}\}(\{[^}]+\})|\1{${to[$i]}}\2|" "$dir/cards/${to[$i]}.tex"
        sed -i -E "s|(\\zheadernotags\{[^}]+\})\{${from[$i]}\}|\1{${to[$i]}}|" "$dir/cards/${to[$i]}.tex"
        sed -i "s|\\input{cards/${from[$i]}\.tex}|\\input{cards/tmp_${to[$i]}\.tex}|" "$dir/main.tex"
    done

    for (( i=0; i<${#from[@]}; i++ ))
    do
        sed -i "s|\\input{cards/tmp_${to[$i]}\.tex}|\\input{cards/${to[$i]}\.tex}|" "$dir/main.tex"
    done

    cards=$(ls "$dir/cards" | grep .tex | sort -V)
    for (( i=0; i<${#from[@]}; i++ ))
    do
        for j in $cards
        do
            sed -i -E "s|(\\\\hyperref\\[card:)${from[$i]}([^]]*\\])|\1${to[$i]}\2|" "$dir/cards/$j"
            sed -i -E "s|(\\\\textsf\\{)${from[$i]}([^]]*\\})|\1${to[$i]}\2|" "$dir/cards/$j"
        done
    done

    sed -i "/\\input{cards\/$first_new\.tex}/i \\\\\\input{cards/$card\.tex}" "$dir/main.tex"

    NVIM_LISTEN_ADDRESS=/tmp/nvimsocket_cards st -e nvim --server /tmp/nvimsocket_cards --remote-tab "$dir/cards/$card.tex" &
    exit 0
elif [[ "$last_char" =~ [a-z] ]]
then
    parent=$(echo $card | sed -nE "s/^(.*)[a-z]+$/\1/p")
    siblings=($(ls "$dir/cards" | sed -nE "s/^$parent([a-z]+)\.tex$/\1/p" | awk '{print length, $0}' | sort -n | cut -d' ' -f2-))
    number=$(echo "$card" | sed -nE "s/^.*([a-z]+)/\1/p")
    card_next=$(
        echo "$number" | awk '{
            for(i=length;i;i--){
                c=substr($0,i,1)
                if(c!="z"){
                    d=index("abcdefghijklmnopqrstuuvwxyz",c)
                    printf "%s%s", substr($0,1,i-1), substr("abcdefghijklmnopqrstuuvwxyz", d+1, 1)
                    for(j=i+1;j<=length;j++) printf "a"
                        print ""; exit
                }
            }
            n=length+1
            blank=sprintf("%*s",n,"")
            gsub(/ /,"a",blank)
            print blank }'
    )

    start=0
    for i in "${!siblings[@]}"
    do
        if [[ "${siblings[$i]}" == "$last_char" ]]
        then
            start=$i
            break
        fi
    done
    first_new="$parent$card_next"

    for (( i=start; i<${#siblings[@]}; i++ ))
    do
        next=$(
            echo "${siblings[$i]}" | awk '{
                for(i=length;i;i--){
                    c=substr($0,i,1)
                    if(c!="z"){
                        d=index("abcdefghijklmnopqrstuuvwxyz",c)
                        printf "%s%s", substr($0,1,i-1), substr("abcdefghijklmnopqrstuuvwxyz", d+1, 1)
                        for(j=i+1;j<=length;j++) printf "a"
                            print ""; exit
                    }
                }
                n=length+1
                blank=sprintf("%*s",n,"")
                gsub(/ /,"a",blank)
                print blank
            }'
        )

        new_parent="$parent$next"
        mv "$dir/cards/$parent${siblings[$i]}.tex" "$dir/cards/tmp_$new_parent.tex"
        from+=("$parent${siblings[$i]}")
        to+=("$new_parent")
        
        children=$(echo "$cards" | sed -nE "s/^$parent${siblings[$i]}(.*)\.tex$/\1/p")
        for j in $children
        do
            mv "$dir/cards/$parent${siblings[$i]}$j.tex" "$dir/cards/tmp_$new_parent$j.tex"
            from+=("$parent${siblings[$i]}$j")
            to+=("$new_parent$j")
        done
    done

    tmp=$(ls "$dir/cards" | grep .tex | grep tmp)
    for i in $tmp
    do
        rename=$(echo "$i" | sed -nE 's/tmp_(.*)\.tex/\1/p')
        mv "$dir/cards/$i" "$dir/cards/$rename.tex"
        # echo "$i -> $rename.tex"
    done

    for (( i=0; i<${#from[@]}; i++ ))
    do
        # printf "%s -> %s\n" "${from[$i]}" "${to[$i]}"
        sed -i -E "s|(\\zheader\{[^}]+\})\{${from[$i]}\}(\{[^}]+\})|\1{${to[$i]}}\2|" "$dir/cards/${to[$i]}.tex"
        sed -i -E "s|(\\zheadernotags\{[^}]+\})\{${from[$i]}\}|\1{${to[$i]}}|" "$dir/cards/${to[$i]}.tex"
        sed -i "s|\\input{cards/${from[$i]}\.tex}|\\input{cards/tmp_${to[$i]}\.tex}|" "$dir/main.tex"
    done

    for (( i=0; i<${#from[@]}; i++ ))
    do
        sed -i "s|\\input{cards/tmp_${to[$i]}\.tex}|\\input{cards/${to[$i]}\.tex}|" "$dir/main.tex"
    done

    cards=$(ls "$dir/cards" | grep .tex | sort -V)
    for (( i=0; i<${#from[@]}; i++ ))
    do
        for j in $cards
        do
            sed -i -E "s|(\\\\hyperref\\[card:)${from[$i]}([^]]*\\])|\1${to[$i]}\2|" "$dir/cards/$j"
            sed -i -E "s|(\\\\textsf\\{)${from[$i]}([^]]*\\})|\1${to[$i]}\2|" "$dir/cards/$j"
        done
    done

    sed -i "/\\input{cards\/$first_new\.tex}/i \\\\\\input{cards/$card\.tex}" "$dir/main.tex"

    killall rofi 2>/dev/null
    NVIM_LISTEN_ADDRESS=/tmp/nvimsocket_cards st -e nvim --server /tmp/nvimsocket_cards --remote-tab "$dir/cards/$card.tex" &
    exit 0
fi

$HOME/.config/rofi/scripts/c/zettelkasten/sort_cards "$dir/cards"
