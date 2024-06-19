#!/bin/bash


calcular() {
  local num1=$1
  local num2=$2
  local operacion=$3

  case $operacion in
    1)
      echo "Resultado: $(( num1 + num2 ))"
      ;;
    2)
      echo "Resultado: $(( num1 - num2 ))"
      ;;
    3)
      echo "Resultado: $(( num1 * num2 ))"
      ;;
    4)
      if [ $num2 -eq 0 ]; then
        echo "Error: División por cero no permitida."
      else
        echo "Resultado: $(( num1 / num2 ))"
      fi
      ;;
    *)
      echo "Operación no válida. Elija entre suma, resta, multiplicacion, division."
      ;;
  esac
}

# Solicita el primer número
read -p "Introduce el primer número: " num1
if ! [[ "$num1" =~ ^-?[0-9]+$ ]]; then
  echo "Entrada no válida. Debes ingresar un número."
  exit 1
fi

# Solicita el segundo número
read -p "Introduce el segundo número: " num2
if ! [[ "$num2" =~ ^-?[0-9]+$ ]]; then
  echo "Entrada no válida. Debes ingresar un número."
  exit 1
fi

# Solicita la operación al usuario
read -p "Introduce la operación (1)suma, 2)resta, 3)multiplicacion, 4)division): " operacion
if ! [[ "$num2" =~ ^-?[0-9]+$ ]]; then
  echo "Entrada no válida. Debes ingresar un número de operacion."
  exit 1
fi

# Llamar a la función para realizar el cálculo
calcular $num1 $num2 $operacion
