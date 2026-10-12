# V1.0.28 — Recursos microbiológicos compartidos

En Costos compartidos, usar «Compartir TODOS los recursos de Coliformes fecales».

- Copia todos los recursos con modalidad calculable de Coliformes fecales (incluye agares, cepas y A1 Medium) a un catálogo compartido único, vinculando inicialmente Coliformes fecales, Coliformes totales y E. coli.
- No duplica recursos que ya existen en el catálogo compartido por nombre.
- Crea respaldo de recursos y ensayos en localStorage antes de la operación.
- Mantiene los registros individuales hasta ejecutar manualmente «Respaldar y retirar consumibles micro duplicados», tras verificar costos y vínculos.
- El costo anual de modalidades por período se convierte a compra anual equivalente; consumos por presentación se estiman desde el volumen de Coliformes fecales y requieren revisión antes de retirar duplicados.
- Para A1 Medium, desvincular Coliformes totales y E. coli antes de utilizar la distribución definitiva si solo se usa en Coliformes fecales.
- Conserva las claves locales y el histórico 2025.

Pruebas automatizadas: 52 correctas. Compilación Vite no verificada por falta de dependencias locales disponibles offline.
