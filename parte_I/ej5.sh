#!/bin/bash

# Variables para almacenar el tiempo
inicio=0
tiempo_transcurrido=0
tiempo=0

# Función para iniciar el cronómetro
iniciar() {
  if [ $tiempo -eq 1 ]; then
    echo "El cronómetro ya está en marcha."
  else
    inicio=$(date +%s)
    tiempo=1
    echo "Cronómetro iniciado."
  fi
}

# Función para detener el cronómetro
detener() {
  if [ $tiempo -eq 0 ]; then
    echo "El cronómetro no está en marcha."
  else
    end_time=$(date +%s)
    tiempo_transcurrido=$((end_time - inicio + tiempo_transcurrido))
    tiempo=0
    echo "Cronómetro detenido. Tiempo transcurrido: $tiempo_transcurrido segundos."
  fi
}

# Función para reiniciar el cronómetro
reiniciar() {
  inicio=0
  tiempo_transcurrido=0
  tiempo=0
  echo "Cronómetro reiniciado."
}

# Función para mostrar el menú
mostrar_menu() {
  echo "1. Iniciar cronómetro"
  echo "2. Detener cronómetro"
  echo "3. Reiniciar cronómetro"
  echo "4. Salir"
}

# Bucle principal
while true; do
  mostrar_menu
  read -p "Selecciona una opción: " opcion

  case $opcion in
    1)
      iniciar
      ;;
    2)
      detener
      ;;
    3)
      reiniciar
      ;;
    4)
      echo "Saliendo del cronómetro."
      exit 0
      ;;
    *)
      echo "Opción no válida. Por favor, selecciona una opción del 1 al 4."
      ;;
  esac
done
