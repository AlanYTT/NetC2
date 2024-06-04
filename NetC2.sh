#!/bin/bash

function set_color() {
    echo -e "\e[$1m"
}

function reset_color() {
    echo -e "\e[0m"
}

if [ -z "$1" ]; then
    echo "Uso: $0 <dirección IP>"
    exit 1
fi

IP=$1

RESPONSE=$(curl -s http://ipinfo.io/$IP)

IP_ADDR=$(echo $RESPONSE | jq -r '.ip')
HOSTNAME=$(echo $RESPONSE | jq -r '.hostname')
CITY=$(echo $RESPONSE | jq -r '.city')
REGION=$(echo $RESPONSE | jq -r '.region')
COUNTRY=$(echo $RESPONSE | jq -r '.country')
LOC=$(echo $RESPONSE | jq -r '.loc')
ORG=$(echo $RESPONSE | jq -r '.org')
POSTAL=$(echo $RESPONSE | jq -r '.postal')
TIMEZONE=$(echo $RESPONSE | jq -r '.timezone')

reset_color
set_color "32"
echo "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
echo "$                                             $"
echo "$             NetC2 By alanYTT                $"
echo "$                                             $"
echo "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
reset_color

set_color "36"
echo "Información para la IP: $IP_ADDR"
reset_color
set_color "33"
echo "Hostname: $HOSTNAME"
echo "Ciudad: $CITY"
echo "Región: $REGION"
echo "País: $COUNTRY"
echo "Localización: $LOC"
echo "Organización: $ORG"
echo "Código Postal: $POSTAL"
echo "Zona Horaria: $TIMEZONE"
reset_color
