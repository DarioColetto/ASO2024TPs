#!/bin/bash

# Generar un número aleatorio entre 1 y 100
NUMERO_ALEATORIO=$(( ( RANDOM % 100 ) + 1 ))

# Función para pedir al usuario que adivine el número
adivinar_numero() {
  local adivinar

  while true; do
    read -p "Adivina el número (entre 1 y 100): " adivinar

    if ! [[ "$adivinar" =~ ^[0-9]+$ ]]; then
      echo "Introduce un número válido."
      continue
    fi

    if [ "$adivinar" -lt "$NUMERO_ALEATORIO" ]; then
      echo "Demasiado bajo. Intenta de nuevo."
    elif [ "$adivinar" -gt "$NUMERO_ALEATORIO" ]; then
      echo "Demasiado alto. Intenta de nuevo."
    else
      echo "¡Adivinaste!"
      break
    fi
  done
}

# Llamar a la función para empezar el juego
adivinar_numero
