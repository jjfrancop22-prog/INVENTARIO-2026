# LAB-PSI Costos Inteligentes V1.0.38 — preproducción y pruebas

## Precauciones
- **NO publicar como producción todavía.** No borre datos del navegador ni desinstale la V1.0.37.
- El ZIP no contiene los costos reales guardados en el localStorage de su Mac. La migración debe ejecutarse **en el mismo navegador y origen** que contiene esos datos. Si se abre desde otra URL o puerto, podrían no aparecer.
- Antes de migrar, abra **Configuración → Descargar respaldo JSON** y guarde el archivo fuera del navegador. Compruebe que contiene ensayos, recursos, configuración laboral, gastos generales y cálculos guardados.
- La migración solo se habilita si el sistema detecta vacías las colecciones de ensayos, recursos y el documento de ajustes. La comprobación se repite justo antes de escribir. Si hay datos remotos, se bloquea para evitar sobrescrituras.
- Una interrupción a mitad de migración puede dejar datos parciales. **No fuerce ni repita la operación**; revise Firestore y el respaldo.

## Procedimiento
1. Inicie sesión como `admin` en el navegador original y abra **Configuración**. Revise los conteos de ensayos y recursos de Firestore.
2. Descargue el respaldo JSON y verifique su contenido. Si el navegador muestra los datos correctos y Firestore está vacío, use **Migrar datos locales a Firebase (solo vacío)**.
3. Compruebe en Firestore las rutas `labpsi_costos_v1/catalogo/ensayos`, `labpsi_costos_v1/recursos/compartidos` y el documento `labpsi_costos_v1/configuracion/datos/global`.
4. Abra otro navegador o perfil, inicie sesión como `consulta` y verifique los mismos 128 ensayos, costos compartidos y presupuesto. No debe poder guardar ni editar.
5. Como `admin`, cambie un valor de una ficha y presione **Guardar ficha**. Verifique su reflejo en la sesión de consulta. Para cambios en presupuesto o configuración laboral, presione **Guardar ajustes y presupuesto en Firebase**.
6. Pruebe guardar un cálculo, cerrar y abrir sesión, y verificar el mismo resultado desde otra sesión.
7. Pruebe desconectar internet: una escritura remota no debe considerarse confirmada hasta que Firestore la acepte. Reconecte y compruebe el resultado.
8. Antes de GitHub/Netlify, ejecute `npm install`, `npm test` y `npm run build` en su Mac.

## Límites actuales
- La sincronización de fichas y recursos ocurre por documento al pulsar Guardar; los cambios del presupuesto y configuración requieren el botón específico.
- No hay resolución de conflictos multiadministrador ni importación automática de respaldos JSON.
- Los resultados calculados se almacenan en un documento de configuración compartido; para alto volumen o varios administradores se recomienda una colección independiente.
- La seguridad depende de reglas Firestore correctamente publicadas, con `consulta` sin escritura. Compruebe las reglas en el emulador y revise la regla general para que no permita modificar roles de usuario mediante un match más amplio.
