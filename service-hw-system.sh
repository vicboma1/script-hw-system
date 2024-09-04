#!/bin/sh

echo -e "\e[35m service-hw-system.sh\e[0m"

if [ "$#" -ne 0 ] ; then
   echo -e "\e[31m *** El numero de parametros no es correcto. ***\e[0m"
   echo -e "\e[31m sh service-hw-system.sh \e[0m"
   exit 1
fi



function manufacturerBaseboard() {
    msg="Manufacture Baseboard"
    echo
    req=$(sudo dmidecode -s baseboard-manufacturer)
    if [ "$?" -eq "0" ]
    then
       echo
       echo -e "\e[36m $msg \e[0m"
       echo "  manufacturer: $(sudo dmidecode -s baseboard-manufacturer)"
       echo "  product: $(sudo dmidecode -s baseboard-product-name)"
       echo "  version: $(sudo dmidecode -s baseboard-version)"
       echo "  serial: $(sudo dmidecode -s baseboard-serial-number)"
       echo "  asset-tag: $(sudo dmidecode -s baseboard-asset-tag)"
    else
       echo -e "\e[31m *** Error en $msg. Algo salio mal.... ***\e[0m"
    fi
}

function manufacturerSystem() {
    msg="Manufacture System"
    echo
    req=$(sudo dmidecode -s system-manufacturer)
    if [ "$?" -eq "0" ]
    then
       echo
       echo -e "\e[36m $msg \e[0m"
       echo "  manufacturer: $(sudo dmidecode -s system-manufacturer)"
       echo "  product: $(sudo dmidecode -s system-product-name)"
       echo "  version: $(sudo dmidecode -s system-version)"
       echo "  serial: $(sudo dmidecode -s system-serial-number)"
       echo "  uuid: $(sudo dmidecode -s system-uuid)"
       echo "  family: $(sudo dmidecode -s system-family)"
    else
       echo -e "\e[31m *** Error en $msg. Algo salio mal.... ***\e[0m"
    fi
}

function manufacturerBios() {
    msg="Manufacture Bios"
    echo
    req=$(sudo dmidecode -s bios-vendor)
    if [ "$?" -eq "0" ]
    then
       echo
       echo -e "\e[36m $msg \e[0m"
       echo "  vendor: $(sudo dmidecode -s bios-vendor)"
       echo "  version: $(sudo dmidecode -s bios-version)"
       echo "  release: $(sudo dmidecode -s bios-release-date)"
       echo "  revision: $(sudo dmidecode -s bios-revision)"
    else
       echo -e "\e[31m *** Error en $msg. Algo salio mal.... ***\e[0m"
    fi
}

function manufacturerChassis() {
    msg="Manufacture Chassis"
    echo
    req=$(sudo dmidecode -s chassis-manufacturer)
    if [ "$?" -eq "0" ]
    then
       echo
       echo -e "\e[36m $msg \e[0m"
       echo "  manufacturer: $(sudo dmidecode -s chassis-manufacturer)"
       echo "  type: $(sudo dmidecode -s chassis-type)"
       echo "  verison: $(sudo dmidecode -s chassis-version)"
       echo "  serial: $(sudo dmidecode -s chassis-serial-number)"
       echo "  asset-tag: $(sudo dmidecode -s chassis-asset-tag)"
       echo "  type: $(sudo dmidecode -s chassis-type)"
       echo "  release: $(sudo dmidecode -s chassis-version)"
       echo "  revision: $(sudo dmidecode -s chassis-serial-number)"

    else
       echo -e "\e[31m *** Error en $msg. Algo salio mal.... ***\e[0m"
    fi
}


function manufacturerProcessor() {
    msg="Manufacture Processor"
    echo
    req=$(sudo dmidecode -s processor-manufacturer)
    if [ "$?" -eq "0" ]
    then
       echo
       echo -e "\e[36m $msg \e[0m"
       echo "  manufacturer: $(sudo dmidecode -s processor-manufacturer | head -1)"
       echo "  frequency: $(sudo dmidecode -s processor-frequency | head -1)"
       echo "  version: $(sudo dmidecode -s processor-version | head -1)"
       echo "  family: $(sudo dmidecode -s processor-family | head -1)"

    else
       echo -e "\e[31m *** Error en $msg. Algo salio mal.... ***\e[0m"
    fi
}


function freeMem() {
    msg="Memoria-disponible"
    echo
    req=$(free -h)
    if [ "$?" -eq "0" ]
    then
       echo
       echo -e "\e[36m $msg \e[0m"
       free -h
    else
       echo -e "\e[31m *** Error en $msg. Algo salio mal.... ***\e[0m"
    fi
}

function inactiveMem() {
    msg="Memoria-inactiva"
    echo
    req=$(vmstat -s -S M)
    if [ "$?" -eq "0" ]
    then
       echo
       echo -e "\e[36m $msg \e[0m"
       vmstat -s -S M
    else
       echo -e "\e[31m *** Error en $msg. Algo salio mal.... ***\e[0m"
    fi
}

function procMemInfo() {
    msg="Memoria inactiva /memInfo/"
    echo
    req=$(cat /proc/meminfo/)
    if [ "$?" -eq "0" ]
    then
       echo -e "\e[36m $msg \e[0m"
       cat /proc/meminfo/
    else
       echo -e "\e[31m *** Error en $msg. Algo salio mal.... ***\e[0m"
    fi
}

manufacturerBaseboard
manufacturerSystem
manufacturerBios
manufacturerProcessor
manufacturerChassis
freeMem
inactiveMem
#procMemInfo
