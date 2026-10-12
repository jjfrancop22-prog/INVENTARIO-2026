#!/bin/bash
set -e
cd "$(dirname "$0")"
echo "LAB-PSI COSTOS V1.0.39 | Publicacion GitHub"
echo "Comprobando que la configuracion local no se publique..."
if [ -f .env.local ]; then echo 'Archivo .env.local detectado: se mantendra local y excluido de Git.'; fi
if ! grep -qx '.env.local' .gitignore; then echo 'ERROR: .gitignore no excluye .env.local'; exit 1; fi
if ! command -v git >/dev/null; then echo 'Instala Git antes de continuar.'; exit 1; fi
if ! command -v npm >/dev/null; then echo 'Instala Node.js y npm antes de continuar.'; exit 1; fi
npm install
npm run build
if [ ! -d .git ]; then git init; fi
git branch -M main
if ! git check-ignore -q .env.local; then echo 'ERROR: .env.local no esta excluido'; exit 1; fi
printf '\nPega la URL HTTPS del repositorio PRIVADO que creaste en GitHub: '
read -r REMOTE
case "$REMOTE" in https://github.com/*/*.git|https://github.com/*/*) ;; *) echo 'URL invalida. Debe ser https://github.com/usuario/repositorio'; exit 1;; esac
if git remote get-url origin >/dev/null 2>&1; then git remote set-url origin "$REMOTE"; else git remote add origin "$REMOTE"; fi
git add .
if git diff --cached --name-only | grep -E '(^|/)(\.env(\.local)?|node_modules|dist)(/|$)'; then echo 'ERROR: archivos excluidos preparados para subir'; exit 1; fi
if ! git diff --cached --quiet; then git commit -m 'LAB-PSI Costos Inteligentes V1.0.39 - Firebase en tiempo real'; fi
git push -u origin main
echo 'Proyecto subido a GitHub. Continua con Netlify y sus variables de entorno.'
