#!/bin/bash
# Desenvolvedor : Diogo Machado
# www.diogomachado.com
# Versão : 1.0

menu ()
   {
    clear
    echo
    echo "##############################"
    echo "#                            #"
    echo "# Less Compile Shell         #"
    echo "#                            #"
    echo "##############################"
    echo
    echo ">>>Opções:"
    echo
    echo "[1] Abrir arquivo .less e compilar style.css"
    echo "[2] Abrir arquivo .less, compilar style.min.css minificado"
    echo "[3] Abrir arquivo .less, compilar style.min.css minificado com YUI CSS Compressor"
    echo "[0] Sair"
    echo
   }

central ()
   {
    menu
    echo "Digite umas das opções acima, e pressione Enter:"
    read opcao
    while [ $opcao != "s" ];
    do
      menu
      case $opcao in
        1) compilarBasico;;
        2) compilarMinificado;;
        3) compilarYui;;
        0) sair;;
      esac
      read opcao
    done
    }

compilarBasico ()
   {
   arquivo=`zenity --file-selection --title="Select a File"`
   clear
   echo
   echo "Compilando arquivo less"
   echo
   lessc $arquivo style.css        
   DISPLAY=:0 notify-send -i dialog-apply "Compilação concluída" "Arquivo CSS criado"
   central  
   }


compilarMinificado ()
   {
   arquivo=`zenity --file-selection --title="Select a File"`
   clear
   echo
   echo "Compilando arquivo less"
   echo
   lessc -x $arquivo style.min.css        
   DISPLAY=:0 notify-send "Compilação minificada concluída" "Arquivo CSS criado"
   central 
   }

compilarYui ()
   {
   arquivo=`zenity --file-selection --title="Select a File"`
   clear
   echo
   echo "Compilando arquivo less"
   echo
   lessc --yui-compress $arquivo style.min.css        
   DISPLAY=:0 notify-send "Compilação YUI concluída" "Arquivo CSS criado"
   central 
   }

sair ()
    {
       clear
       exit
    }
 
       clear
       central
       clear


