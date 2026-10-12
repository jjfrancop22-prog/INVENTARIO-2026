#!/bin/bash
set -e
cd "$(dirname "$0")"
if [ ! -s .env.local ]; then
  echo "Buscando configuración Firebase en versiones anteriores..."
  found=""
  for dir in ../LAB_PSI_COSTOS_INTELIGENTES_V1.0.37* ../LAB_PSI_COSTOS_INTELIGENTES_V1.0.38* ../LAB_PSI_COSTOS_INTELIGENTES_V1.0.36*; do
    if [ -f "$dir/.env.local" ] && grep -q '^VITE_FIREBASE_API_KEY=' "$dir/.env.local" && ! grep -q '^VITE_FIREBASE_API_KEY=REEMPLAZAR' "$dir/.env.local"; then
      found="$dir/.env.local"; break
    fi
  done
  if [ -n "$found" ]; then
    cp "$found" .env.local
    echo "Configuración recuperada desde $found"
  else
    echo "No encontré .env.local válido en las carpetas anteriores."
    echo "Copia tu .env.local existente a esta carpeta una sola vez."
    echo "No es necesario crear usuarios ni otro proyecto Firebase."
    exit 1
  fi
fi
if ! grep -q '^VITE_FIREBASE_API_KEY=' .env.local || grep -q '^VITE_FIREBASE_API_KEY=REEMPLAZAR' .env.local; then
  echo "La configuración Firebase necesita la API key de la app web costo."; exit 1
fi
if [ ! -d node_modules ]; then npm install; fi
npm run dev
