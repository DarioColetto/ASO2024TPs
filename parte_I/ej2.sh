#!/bin/bash

# Función para generar la elección aleatoria
eleccion_computadora() {
  local opciones=("piedra" "papel" "tijeras")
  echo "${opciones[$(( RANDOM % 3 ))]}"
}

# Función para elegir ganador
ganador() {
  local usuario=$1
  local computadora=$2

  if [ "$usuario" == "$computadora" ]; then
    echo "Es un empate."
  elif [[ ("$usuario" == "piedra" && "$computadora" == "tijeras") || 
          ("$usuario" == "papel" && "$computadora" == "piedra") || 
          ("$usuario" == "tijeras" && "$computadora" == "papel") ]]; then
    echo "¡Ganaste! $usuario vence a $computadora."
  else
    echo "Perdiste. $computadora vence a $usuario."
  fi
}

# Solicitar la elección del usuario
read -p "Elige piedra, papel o tijeras: " eleccion_usuario

# Validar la elección del usuario
if [[ "$eleccion_usuario" != "piedra" && "$eleccion_usuario" != "papel" && "$eleccion_usuario" != "tijeras" ]]; then
  echo "Elección no válida. Por favor elige piedra, papel o tijeras."
  exit 1
fi

# Generar la elección de la computadora
eleccion_computadora=$(eleccion_computadora)

# Mostrar la elección de la computadora
echo "La computadora eligió: $eleccion_computadora"

# Determinar y mostrar el ganador
determinar_ganador "$eleccion_usuario" "$eleccion_computadora"
