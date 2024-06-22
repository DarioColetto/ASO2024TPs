#!/bin/bash

API_KEY="b11bbb3ceee94eeeb3b211842242206"

# Función para obtener el clima actual
obtener_clima() {
  local ciudad=$1

# Realiza la solicitud a la API y obtiene el código de estado
  response=$(curl -s -w "%{http_code}" "http://api.weatherapi.com/v1/current.json?key=$API_KEY&q=$ciudad")
  http_code=$(echo "$response" | tail -c 4)
  response_body=$(echo "$response" | head -c -4)


# Mostrar el código de estado de la respuesta
  echo "Código de estado HTTP: $http_code"

  # Comprueba error
  if [[ "$response" == *"error"* ]]; then
    echo "Error al obtener los datos del clima. Verifica el nombre de la ciudad e inténtalo de nuevo."
    return
  fi

  # Muestra response
  echo "Información completa del clima:"
  echo "$response" | jq .
}

# Solicita nombre de ciudad
read -p "Introduce el nombre de la ciudad: " ciudad

# Llamado a la funcion
obtener_clima "$ciudad"
