# V1.0.23 — Migración conservadora de PT y MRC

- Nueva herramienta en Costos compartidos: previsualiza ensayos de aptitud (PT) y materiales de referencia (MRC) registrados dentro de equipos.
- La migración es **manual y con confirmación**. Crea una copia de seguridad local `labpsi_costos_quality_backup_...` antes de modificar datos.
- Cada servicio PT/MRC se convierte en un recurso independiente tipo «calidad» con el mismo importe, frecuencia, estado y respaldo. Se conserva el equipo, su compra, depreciación, calibración y mantenimiento.
- Los vínculos de ensayos se copian como punto de partida, **no se infiere** que el PT/MRC sea aplicable a todos los parámetros del equipo. Revisar y ajustar la sección «Distribución entre ensayos» después de migrar.
- La operación es idempotente: repetirla no vuelve a crear recursos ni costos.
- Se mantienen las claves de localStorage de versiones anteriores; no limpiar datos del navegador.
- En modo local se guarda en el navegador. Si hay sincronización Firebase, comprobar permisos y sincronización antes de usar en producción.
