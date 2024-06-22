#!/bin/bash

# Función para contar palabras, líneas y caracteres
contar() {
  local archivo=$1

  if [ ! -f "$archivo" ]; then
    echo "El archivo no existe."
    exit 1
  fi

  num_lineas=$(wc -l < "$archivo")
  num_palabras=$(wc -w < "$archivo")
  num_caracteres=$(wc -m < "$archivo")

  echo "Archivo: $archivo"
  echo "Número de líneas: $num_lineas"
  echo "Número de palabras: $num_palabras"
  echo "Número de caracteres: $num_caracteres"
}

# Solicitar el nombre del archivo al usuario
read -p "Introduce el nombre del archivo: " archivo

# Llamar a la función para contar palabras, líneas y caracteres
contar "$archivo"
