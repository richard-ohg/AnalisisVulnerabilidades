#!/bin/bash

# Función para la opción -h
show_options(){
  echo -e "Modo de empleo: getShellcode -b BINARIO [OPCIÓN]\n"
  echo -e "Imprimir el shellcode de un binario en X formato.\n"
  echo -e "Sin opción, por defecto será formato hexadecimal.\n\n"
  echo "-b -> nombre del binario"
  echo "-u -> formato unicode"
  echo -e "-n -> formato numerico\n\n"
  echo -e "Ejemplo: \n\n"
  echo "./getShellcode -b binario -> Muestra los shellcode en formato hexadecimal"
  echo
  exit
}

# Función para imprimir con formato \u9090\u9090
unicode(){
  echo -e "código en unicode: $BINARIO\n"
  echo -n "--->  "
  objdump -d -j .text $BINARIO | grep -e '^ ' | tr '[[:space:]]' '\n' | egrep '^[[:alnum:]]{2}$' | xargs | sed 's/ //g' | rev | sed -E 's/(....)/\1\\u/g' | rev | sed -e 's/u\\/\\u/g' | sed -e 's/^/\\u/'
}

# Función para imprimir con formato 9090
numeric(){
  echo -e "código en numerico: $BINARIO\n"
  echo -n "--->  "  
  objdump -d -j .text $BINARIO | grep -e '^ ' | tr '[[:space:]]' '\n' | egrep '^[[:alnum:]]{2}$' | xargs | sed 's/ //g' | sed -e 's/^//g'
}

# Función para imprimir con formato \x90\x90
hexadecimal(){
  echo -e "código en hexadecimal: $BINARIO\n"
  echo -n "---> " 
  objdump -d -j .text $BINARIO | grep -e '^ ' | tr '[[:space:]]' '\n' | egrep '^[[:alnum:]]{2}$' | xargs | sed 's/ /\\x/g' | sed -e 's/^/\\x/g'
}

# Función para mandar a la función dependiendo de la opción
ejecutar(){
  
  if [ -z $BINARIO ]
    then
        echo "Falta el nombre del binario."
        echo "Forma de ejecutarlo: ./getShellcode -b binario -h | ./getShellcode -b binario -n | ./getShellcode -b binario -u"
        exit 1
  fi

  if [ $OPCION = 'H' ]
	  then
	    hexadecimal
  elif [ $OPCION = 'U' ]
	  then
		  unicode
  elif [ $OPCION = 'N' ]
	  then
		  numeric
  fi
  exit 0
}

# Verificamos que el comando se ejecute con al menos una bandera
if [ $# -eq 0 ]
then
      echo "Forma de ejecutarlo: ./getShellcode -b binario -h| ./getShellcode -b binario -n | ./getShellcode -b binario -u"
      exit 1
fi

# Capturamos los argumentos que sean puestos al script
OPCION='H'
while getopts ":hunb:" opt; do
  case $opt in
    b)
      BINARIO=$OPTARG
      ;;
    u)
      OPCION='U'
      ejecutar
      ;;
    n)
      OPCION='N'
      ejecutar
      ;;
    h) 
      show_options
      ;;
    *)
      echo "Forma de ejecutarlo: ./getShellcode -b binario| ./getShellcode -b binario -n | ./getShellcode -b binario -u"
      exit 1
      ;;
  esac
done

# Para la opción por defecto
ejecutar