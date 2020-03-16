#!/bin/bash

#RECURSOS
. ./resources
. ./system_data
. ./environment

#FUNÇÕES
start_program(){
$DIALOG --title "YES/NO BOX" --clear --help-button "$@" \
        --yesno "
Olá, esse script foi criado para gerar um ambiente de desenvolvimento completo no linux.

Deseja continuar?
" 9 61

retval=$?

case ${retval:-0} in
  $DIALOG_OK)
    echo "YES"
    case ${OS} in
        "arch")
            . ./arch/index
            menu;;
        "ubuntu")
            . ./ubuntu/index
            echo "Sistema não suportado"
        "")
            echo "Sistema não suportado"
    esac
    ;;
  $DIALOG_CANCEL)
    echo "NO";;
  $DIALOG_HELP)
    echo "Help pressed."
    xdg-open ${URL_DOC};;
  $DIALOG_ERROR)
    echo "ERROR!";;
  $DIALOG_ESC)
    echo "ESC pressed.";;
esac
}

sudo pacman -Syu
start_program