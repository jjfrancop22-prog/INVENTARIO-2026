# LAB-PSI COSTOS INTELIGENTES · V1.0.4

Aplicación web **nueva**, independiente de los ERP anteriores, con React, Vite y Firebase. Incluye 128 parámetros únicos del histórico de producción 2025, conservando recursos coincidentes del presupuesto anterior del archivo `Copia de presupuesto(1).xlsx` y un motor auditable de costos.

## Instalación local en Mac (Terminal)

```bash
cd labpsi-costos-v1
npm install
cp .env.example .env
# Abrir .env y colocar VITE_FIREBASE_API_KEY entregada por Firebase
npm test
npm run dev
```

Abrir la URL local indicada por Vite (normalmente http://localhost:5173).

## Modo de demostración y datos históricos

Sin archivo `.env` funciona en **modo demostración local**, sin conexión Firebase. Los cambios se conservan en `localStorage` de ese navegador. NO son copias de seguridad ni se sincronizan. Los 39 ensayos importados se clasifican como **referencia histórica** y no se suman al costo hasta que el responsable valide categoría, cantidad y método. Esto evita precios falsamente precisos. La V1 incluye fichas, catálogo, dashboard, costos directos, por lote, anuales, mano de obra, indirectos, simulación de margen y exportación CSV. Campo se registra como tipo de servicio, pero su costeo especializado (movilización, viáticos, cuadrillas, jornadas, etc.) es una **fase posterior**.

## Fórmulas

- Directo por unidad: costo unitario × cantidad consumida.
- Recurso por lote: costo del recurso × cantidad por lote / número de muestras del lote.
- Recurso anual: costo anual / volumen anual.
- Mano de obra: (minutos activos por lote / tamaño del lote + minutos activos por muestra) × costo laboral/hora / 60.
- Costos fijos por unidad: costos fijos anuales / volumen anual.
- Costo total: recursos + mano de obra + fijos + indirectos.
- Precio con margen sobre ventas: costo total / (1 − margen objetivo).

El cálculo actual es una **base de costeo**: no reemplaza el futuro motor ABC completo ni valida automáticamente el método.

## Activar Firebase sin afectar los demás ERP

El proyecto es `laboratorio-inventario`. No hay escrituras automáticas al iniciar. Configurar `.env`, habilitar Email/Password en Firebase Authentication y crear el documento de rol `labpsi_costos_v1/accesos/usuarios/<UID>` con `{ "role": "admin" }` mediante consola de Firebase. Revisar `scripts/README-SEGURIDAD.md` antes de fusionar reglas. **NO sustituir las reglas existentes del proyecto con `firestore.rules`**, ya que otros ERP podrían perder acceso.

Tras autenticar y autorizar, el catálogo sincroniza documentos desde `labpsi_costos_v1/catalogo/ensayos`. El botón Guardar ficha escribe la ficha seleccionada. Los 39 datos iniciales NO se suben automáticamente. No compartir la configuración de servicios de cuentas ni claves privadas. El archivo `.env` está ignorado por Git.

## GitHub (repositorio nuevo)

```bash
git init
git add .
git commit -m "LAB-PSI Costos V1.0.4 base"
git branch -M main
git remote add origin https://github.com/TU-USUARIO/TU-REPOSITORIO.git
git push -u origin main
```

Crear previamente el repositorio vacío en GitHub. No copiar el repositorio de los ERP existentes.

## Netlify

Importar el repositorio GitHub. Comando de build `npm run build`, directorio `dist`. Definir las variables `VITE_FIREBASE_*` del archivo `.env.example` en Site configuration > Environment variables. Agregar el dominio de Netlify a **Authentication > Settings > Authorized domains** de Firebase. Ejecutar pruebas con usuario autorizado antes de uso productivo.

## Limitaciones V1.0.4

- No incluye todavía permisos detallados por recurso, bitácora inmutable, reportes PDF, integraciones automáticas, motor ABC integral ni migración masiva a Firestore.
- `localStorage` es solo para pruebas; no se debe utilizar como almacenamiento definitivo.
- La plantilla de reglas requiere endurecimiento y fusión segura antes de producción.
- Los precios y costos calculados sobre entradas no validadas son solo simulaciones.


## V1.0.4 — Recursos compartidos

Nueva pestaña **Costos compartidos**: crear un equipo, programa PT o MRC una sola vez; activar casilleros de calibración, mantenimiento, ensayo de aptitud, material de referencia, verificación o depreciación. Al activar se muestran costo por servicio, frecuencia en meses y respaldo. Los registros desactivados se conservan y no se computan.

Vincular los ensayos y registrar **determinaciones internas de 2025 por método**, más un factor de utilización (por defecto 1). No se inventan volúmenes: los 39 ensayos se importaron con `annualVolume=0`. El costo anual equivalente = costo × 12 / meses; el costo por determinación = costo anual × factor / suma(volumen interno 2025 × factor). Así, el gasto se registra una vez y se distribuye entre métodos. Si falta el volumen, el sistema alerta y no asigna un importe ficticio. Para MRC consumibles, el prorrateo por frecuencia es una aproximación: la siguiente etapa incorporará volumen de frasco, consumos, caducidad y merma.

**Persistencia:** guarda en el navegador para pruebas. Con cuenta y permisos de Firebase, el botón «Guardar recurso» escribe el registro activo en `labpsi_costos_v1/recursos/compartidos/{id}`. Al iniciar sesión se leen los registros compartidos de Firestore. **No se ha desplegado ni verificado Firebase real.** No uses datos de prueba como datos productivos.

**Limitaciones:** la colección de recursos no tiene aún gestión de conflictos, eliminación remota, control de revisiones ni auditoría completa. No reemplazar reglas globales de Firestore con el archivo de ejemplo.

## V1.0.2 — Histórico de producción

El menú **Histórico de producción** permite registrar determinaciones internas y subcontratadas por ensayo y año (2025, 2026, 2027 y años anteriores), anotar su fuente, exportar CSV y guardar. Los datos se conservan localmente de forma automática; el botón Guardar histórico intenta escribir en Firestore únicamente con sesión autorizada. La distribución de costos compartidos toma la producción interna de 2025 del histórico central, evitando editar el mismo volumen en cada equipo. El campo `annualVolume` se actualiza para el año 2025 por compatibilidad con el motor de costos actual. No confundir producción comercial con blancos o controles de calidad.

**Precaución:** Firestore debe configurarse con permisos restrictivos antes de habilitar sincronización; el almacenamiento local no sincroniza entre equipos. Si no hay conexión autorizada, el sistema muestra el aviso de guardado local.

## V1.0.3 · Importación del histórico 2025

En **Histórico de producción**, pulsar **Incorporar histórico unificado 2025**. Se importan las 128 denominaciones consolidadas del archivo de referencia, asociando por nombre normalizado solo coincidencias inequívocas a los ensayos existentes. Las fichas de costos, reactivos y recursos se conservan. Las denominaciones que no tengan correspondencia única se agregan como registros pendientes de clasificar. Se mantienen separados los volúmenes internos, subcontratados y de campo. El botón es idempotente; los datos quedan inicialmente en el navegador. Para compartirlos entre usuarios, pulsar **Guardar histórico** con una cuenta Firebase autorizada. **Precaución:** ese guardado escribe las fichas de catálogo existentes; revisar primero las reglas de Firestore y los registros remotos. Los nombres que mezclen técnicas o matrices deben revisarse antes de asignar equipos o costos.


## V1.0.4 — catálogo consolidado
- La vista presenta exclusivamente los **128 parámetros únicos** del consolidado 2025.
- Conserva cantidades: 35.154 totales, 27.288 internas, 842 subcontratadas y 7.024 de campo.
- Migra el catálogo local de V1.0.3 al nuevo formato y mantiene el almacenamiento antiguo como respaldo.
- Los costos técnicos históricos se recuperan cuando el nombre coincide. Los recursos compartidos locales se revinculan por nombre.
- El botón «Restaurar cantidades 2025» recupera las cifras originales si fueron editadas.
- **No elimina documentos de Firestore**: si ya hay registros duplicados en la nube, la interfaz los consolida visualmente, pero la limpieza física exige respaldo y revisión antes de borrar.
- La sincronización Firebase requiere autenticación y reglas autorizadas.
