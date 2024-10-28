from i3ipc import Connection, Event

i3 = Connection()

focused = i3.get_tree().find_focused().workspace().num

out = ""

for i in range(1, 11):
    match i:
        case 1:
            out += "%{F#E67E80}"
        case 2:
            out += "%{F#E69875}"
        case 3:
            out += "%{F#DBBC7F}"
        case 4:
            out += "%{F#A7C080}"
        case 5:
            out += "%{F#7FBBB3}"
        case 6:
            out += "%{F#83C092}"
        case 7:
            out += "%{F#D699B6}"
        case 8:
            out += "%{F#E67E80}"
        case 9:
            out += "%{F#E69875}"
        case 10:
            out += "%{F#DBBC7F}"
    if i == focused:
        out += "%{F#DBBC7F}󰮯 "
    else:
        out += "󰊠 "

    out += " %{F-}%{F-}"

print(out)
