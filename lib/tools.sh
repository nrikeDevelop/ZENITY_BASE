#!/bin/bash

#CONDITIONALS CHECKERS

function is_number(){
	case $1 in 
		''|*[!0-9]*) 
			return 1;;
		*)
			return 0;;
	esac
}

function is_equal(){
    if [ $1 -eq $2 ]
    then 
        return 0;
    else
        return 1;
    fi
}

function is_diferent(){
    if [ $1 -ne $2 ]
    then 
        return 0;
    else
        return 1;
    fi
}

function is_greater(){
    if [ $1 -gt $2 ]
    then 
        return 0;
    else
        return 1;
    fi   
}

function is_greater_or_equal(){
    if [ $1 -ge $2 ]
    then 
        return 0;
    else
        return 1;
    fi   
}

function is_less(){
    if [ $1 -lt $2 ]
    then 
        return 0;
    else
        return 1;
    fi   
}

function is_less_or_equal(){
    if [ $1 -le $2 ]
    then 
        return 0;
    else
        return 1;
    fi   
}

#OPERATORS
#
#   var=change_value "text" "e" "a" 
#

function change_value(){
    echo $1 | tr "$2" "$3"
}

function cut_value(){
    echo $1 | cut -d"$2" -f"$3"
}

function trim_value(){
    echo $1 | tr -s "$2"
}

function sum_values(){
    echo $(expr $1 + $2)
}

function minus_values(){
    echo $(expr $1 - $2)
}

function multiply_values(){
    echo $(expr $1 \* $2)
}

function divide_values(){
    echo $(expr $1 / $2)
}