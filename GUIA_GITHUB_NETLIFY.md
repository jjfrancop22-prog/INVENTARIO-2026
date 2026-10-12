# LAB-PSI Costos Inteligentes V1.0.39 — Publicación

## 1. GitHub
Crea un repositorio **privado**, vacío, en https://github.com/new con nombre `LAB-PSI-COSTOS-INTELIGENTES`. No actives README, licencia ni .gitignore desde GitHub.

En Terminal, dentro de la carpeta de este proyecto, ejecuta:

```bash
bash PUBLICAR_GITHUB_MAC.command
```

Pega la URL HTTPS del repositorio cuando se solicite. GitHub puede pedir autenticación en navegador o credenciales Git. El script compila y sube el código; no sube `.env.local` ni `node_modules`.

## 2. Netlify
En Netlify, **Add new project > Import an existing project > GitHub** y selecciona el repositorio privado. Rama `main`, comando `npm run build`, directorio de publicación `dist`. El archivo `netlify.toml` ya incluye la configuración de compilación.

En **Site configuration > Environment variables**, añade los valores de tu archivo `.env.local` local, sin subir ese archivo al repositorio:

- `VITE_FIREBASE_API_KEY`
- `VITE_FIREBASE_AUTH_DOMAIN`
- `VITE_FIREBASE_PROJECT_ID`
- `VITE_FIREBASE_STORAGE_BUCKET`
- `VITE_FIREBASE_MESSAGING_SENDER_ID`
- `VITE_FIREBASE_APP_ID`

No compartas las contraseñas de usuarios ni cuentas de servicio. Despliega nuevamente tras configurar las variables.

## 3. Firebase Authentication
En Firebase Authentication > Settings > Authorized domains agrega el dominio asignado por Netlify (solo el nombre, sin `https://`). No crees un proyecto nuevo ni migres otra vez los 128 ensayos y 45 recursos.

## 4. Validación antes de operación
Prueba acceso admin y consulta desde dos navegadores; comprueba lectura de 128 ensayos y 45 recursos, sincronización de cambios, restauración de un valor de prueba, permisos de escritura bloqueados para consulta en Firestore y persistencia tras recarga. Conserva respaldos JSON. No declarar producción hasta completar estas verificaciones.
