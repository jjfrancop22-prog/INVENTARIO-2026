# LAB-PSI Costos Inteligentes V1.0.36 — preparación para producción

## Antes de publicar
1. Respaldar los datos del navegador actual. **El ZIP no contiene los registros guardados en localStorage del navegador del usuario.** No limpiar datos del navegador hasta migrarlos y comprobarlos.
2. En Firebase Console > Authentication > Sign-in method, habilitar **Correo electrónico/contraseña**. En Authentication > Users, crear el primer usuario administrador; Firebase genera el UID. No colocar contraseñas en el código ni en GitHub.
3. En Firestore crear el documento de autorización en la ruta `labpsi_costos_v1/accesos/usuarios/{UID}` con campo `role` igual a `admin`. Crear más usuarios con roles `admin`, `gerencia`, `tecnico` o `consulta` según permisos deseados.
4. Crear `.env.local` tomando `.env.example` como base y reemplazar la API key real de la aplicación web de Firebase. Configurar los mismos valores `VITE_FIREBASE_*` en Netlify > Site configuration > Environment variables. Los valores `VITE_` son públicos en el navegador; **no son secretos**.
5. En Firebase Authentication > Settings > Authorized domains, agregar el dominio Netlify final.
6. **Antes de usar datos reales, configurar y probar las reglas de Firestore.** La autenticación visual no sustituye las reglas del servidor. Los permisos de `consulta` requieren bloqueo de escritura también en reglas y en todas las acciones de interfaz.
7. Confirmar que la sincronización de **ensayos, recursos compartidos, gastos generales, configuración laboral y cálculos guardados** funciona entre dos navegadores; algunas de estas categorías aún utilizan localStorage y **NO están listas para operación multiusuario**.
8. Solo después de verificar respaldo, permisos y persistencia, publicar.

## Comandos para GitHub (ejecutar desde la carpeta del proyecto)
```
npm install
npm test
npm run build
git init
git add .
git commit -m "LAB-PSI Costos V1.0.36 - acceso autenticado"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/TU_REPOSITORIO.git
git push -u origin main
```
Crear antes un repositorio privado vacío en GitHub. No subir `.env.local` ni datos sensibles.

## Netlify
Conectar el repositorio privado de GitHub. Build command: `npm run build`. Publish directory: `dist`. Agregar las variables Firebase del archivo de ejemplo en Environment variables y volver a desplegar.

## Alcance de V1.0.36
- Pantalla privada de acceso, cierre de sesión y recuperación de contraseña.
- Requiere Firebase configurado y un documento de autorización para abrir el sistema.
- Conserva las claves existentes de localStorage; no elimina datos.
- **No crea usuarios automáticamente**: por seguridad, el administrador los crea en Firebase Console.
- **No representa todavía una certificación de seguridad ni una migración multiusuario completa**. No usar para información confidencial real hasta completar los puntos 6 y 7.
