#!/bin/bash


obtener_genero() {
  local nombre=$1

  # Realiza la solicitud a la API.
  response=$(curl -s "https://api.genderize.io/?name=$nombre")

  # Comprobar si se ha producido un error.
  if [[ "$response" == *"error"* ]]; then
    echo "Error al obtener los datos del género. Verifica el nombre e inténtalo de nuevo."
    return
  fi

    local nombre_respuesta=$(echo "$response" | jq -r '.name')
    local probabilidad=$(echo "$response" | jq -r '.probability')

  # Mostrar información.
  if [ "$genero" == "null" ]; then
    echo "No encontro info para el nombre: $nombre_respuesta"
  else
    echo "Probabilidad: $probabilidad"
  fi
}

# Solicita nombre
read -p "Introduce el nombre: " nombre

# Llamar a la función
obtener_genero "$nombre"
