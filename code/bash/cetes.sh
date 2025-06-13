#!/bin/bash

tabs 4
echo -e "options\n\t(A) CETES 1 mes\n\t(B) CETES 3 meses\n\t(C) CETES 6 meses\n\t(D) CETES 1 año\n\t(E) BONDDDIA 1 día"
read opt

case "$opt" in
    A)
        wget -qO- https://www.cetesdirecto.com/sites/portal/inicio | grep 'CETES 1 mes' | awk -F:\  '{print $2}' | awk -F% '{print $1}'
    ;;
    B)
        wget -qO- https://www.cetesdirecto.com/sites/portal/inicio | grep 'CETES 3 meses' | awk -F:\  '{print $2}' | awk -F% '{print $1}'
    ;;
    C)
        wget -qO- https://www.cetesdirecto.com/sites/portal/inicio | grep 'CETES 6 meses' | awk -F:\  '{print $2}' | awk -F% '{print $1}'
    ;;
    D)
        wget -qO- https://www.cetesdirecto.com/sites/portal/inicio | grep 'CETES 1 año' | awk -F:\  '{print $2}' | awk -F% '{print $1}'
    ;;
    E)
        wget -qO- https://www.cetesdirecto.com/sites/portal/inicio | grep 'BONDDIA 1' | awk -F:\  '{print $2}' | awk -F% '{print $1}'
    ;;
    *)
        echo "invalid option"
        exit 1
    ;;
esac

exit 0
