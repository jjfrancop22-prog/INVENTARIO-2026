# V1.0.37 — perfil consulta
- Identifica el rol `consulta` y presenta aviso de solo lectura.
- Intercepta acciones de edición en los formularios y botones dentro de los módulos.
- Conserva la navegación y búsquedas; bloquea guardados explícitos en ficha, histórico, recursos y cálculos.
- Evita persistir cambios automáticamente en localStorage cuando el rol es consulta.
- Mantiene intactas las claves de datos del navegador y el catálogo de 128 ensayos.
- IMPORTANTE: las reglas Firestore deben bloquear las escrituras de consulta. No sustituye pruebas funcionales de todos los módulos.
