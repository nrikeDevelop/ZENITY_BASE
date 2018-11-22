#!/bin/bash

#ALERT
#
#   zMessage "warning" "message"
#
function zMessage(){
    case $1 in 
        "warning") zenity --warning --text="$2" ;;
        "error")   zenity --error --text="$2" ;;
        "info")    zenity --info --text="$2" ;;
        "question") zenity --question --text="$2" ;;
    esac 
}

#FORM 
#
#   entries=( "name" "surname" "city" )
#   zForm "Titulo" "Mensaje" "-" $entries "NameFile(Optional)"
#
function zForm(){

    entries=$4
    for i in "${entries[@]}";
    do
        var=$(echo "--add-entry=$i")
        array+=($var)
    done

    if [ $5 ]
    then
        zenity --forms --title="$1" \
            --text="$2" \
            --separator="$3" \
            "${array[@]}" >> $5

    else
         zenity --forms --title="$1" \
            --text="$2" \
            --separator="$3" \
            "${array[@]}"
    fi
}

#FILE
#
#   zFile "type" "text" "separator"
#
function zFile(){

    case $1 in  
        "file")         zenity --file-selection --multiple --separator $3 --title="$2" ;;
        "directory")    zenity --file-selection --directory --multiple --separator $3 --title="$2" ;;
    esac

}

#RANGE
#
#   zRange "text" "default_value"
#
function zRange(){
    zenity --scale --text="$1" --value=$2
}

#PASSWORD
#
#   zPassword 
#
function zPassword(){
    zenity --password --username    
    #return data separe by |
}

#LIST
#
#   MANUAL CONFIGURATE
#
function zList(){
    zenity --list \
    title="Elija los fallos que quiere ver" \
    column="Número del fallo" --column="Severidad" --column="Descripción" \
    992383 Normal "GtkTreeView se cuelga con selecciones múltiples" \
    293823 Alto "El diccionario de GNOME no manera proxys" \
    393823 Crítico "El editor de menú no funciona en GNOME 2.0"
}

#INFO
#
#   zInfo title $FILE
#
function zInfo(){

    zenity --text-info \
        --title="$1" \
        --filename=$2 \
        --checkbox="He leído y acepto los términos."

}

#NOTIFICATION
#
#   zNotification "text"
#
function zNotification(){
    zenity --notification\
        --window-icon="info" \
        --text="$1"
}


#CHECK VALUE AND ACTIONS 
function check_data(){
    case $? in
        0)
            #SUCCESS
            return 0;;
        1)
            #CANCEL
            return 1;;
        -1)
            #ERROR
            return -1;;
    esac
}