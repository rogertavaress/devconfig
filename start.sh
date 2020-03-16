#!/bin/bash

#RECURSOS
. ./shared/system
. ./resources
. ./system_data
. ./environment

#FUNÇÕES
start_program(){
$DIALOG --title "DevConfig - Bem-vindos" --clear --help-button "$@" \
        --yesno "
Olá, esse script foi criado para gerar um ambiente de desenvolvimento completo no linux.

Deseja continuar?
" 9 61

retval=$?

case ${retval:-0} in
  $DIALOG_OK)
    menu
    ;;
  $DIALOG_CANCEL)
    exit;;
  $DIALOG_HELP)
    echo "Help pressed."
    xdg-open ${URL_DOC};;
  $DIALOG_ERROR)
    echo "ERROR!";;
  $DIALOG_ESC)
    echo "ESC pressed.";;
esac
}

atualizar
start_program