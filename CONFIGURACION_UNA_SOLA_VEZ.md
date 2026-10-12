# Configuración Firebase reutilizable — LAB-PSI Costos

La API key de la aplicación web `costo` no se incluyó en el ZIP: no está disponible en los archivos recibidos. Los demás valores conocidos están en `.env.example`.

1. Extrae este ZIP al lado de tu carpeta anterior V1.0.37.
2. En Mac, abre Terminal y ejecuta `bash INICIAR_MAC.command` desde esta carpeta (o haz doble clic si el sistema lo permite).
3. El iniciador busca `.env.local` en las carpetas anteriores y lo copia **solo si esta versión aún no lo tiene**. No borra ni modifica el original.
4. Si no lo encuentra, copia manualmente `.env.local` de la versión que funcionaba a esta carpeta, una única vez.
5. Para las siguientes actualizaciones, mantén una carpeta estable del ERP y actualiza únicamente los archivos de código, conservando `.env.local` y haciendo respaldo de los datos locales antes de cambios.

`.env.local` está excluido de Git por `.gitignore`. En Netlify se configuran las variables en la interfaz del sitio. No hay que cambiar el código ni publicar el archivo local.

**Nota:** Este paquete facilita el arranque; no acredita que Firestore esté sincronizado. Sigue siendo V1.0.38 de preproducción.
