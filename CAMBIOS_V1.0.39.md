# V1.0.39 — Diagnóstico de sincronización en vivo

- Conserva las suscripciones en tiempo real (`onSnapshot`) existentes para ensayos, recursos compartidos y configuración.
- Activa `includeMetadataChanges` para observar también transiciones de caché a servidor.
- Diferencia en el encabezado `Firebase · verificando servidor` y `Firebase en vivo` según la confirmación de lectura de servidor para ensayos.
- Mantiene la configuración Firebase fuera del ZIP (`.env.local` se recupera desde la versión anterior).

## Prueba

1. Mantener ambas sesiones abiertas, admin y consulta.
2. Editar un ensayo como admin y pulsar Guardar ficha.
3. Observar si el usuario consulta refleja el cambio sin refrescar.
4. Repetir para recursos compartidos y configuración. Si sigue sin reflejarse, informar el módulo y la pantalla exacta: el problema puede estar en el estado de edición local y no en Firestore.

**Nota:** La versión sigue en preproducción. Los indicadores no constituyen una garantía de sincronización integral. Conservar respaldo JSON antes de migraciones o cambios masivos.
