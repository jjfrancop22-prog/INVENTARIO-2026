# V1.0.12 — Persistencia del histórico 2025
- Corrige la función catalog128: deja de sobrescribir las cantidades históricas editadas con el JSON de origen al iniciar.
- Conserva annualVolume y history[2025] previamente guardados, priorizando el ID estable H25-###.
- En la primera instalación sigue precargando los 128 parámetros oficiales.
- El botón «Restaurar cantidades 2025» ahora sí ejecuta una restauración explícita del histórico oficial, sin eliminar recursos ni equipos.
- Los cálculos de costos compartidos utilizan el histórico editado tras reiniciar.
- Mantiene la misma clave de localStorage para reutilizar los datos de V1.0.11.
- 29 pruebas automatizadas aprobadas; compilación Vite no comprobada por límite de tiempo de instalación.

Nota: si la V1.0.11 ya sobrescribió y guardó los valores originales, habrá que volver a introducir los valores editados una vez en esta versión. No borrar el almacenamiento del navegador.
