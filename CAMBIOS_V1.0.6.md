# LAB-PSI Costos Inteligentes V1.0.6
## Equipos y costos compartidos
- Búsqueda por nombre, técnica o código en los 128 parámetros.
- Filtro de vinculados / sin vincular.
- Indicador de ensayos vinculados y costo anual equivalente.
- Volumen interno 2025 de solo lectura en asignaciones; se modifica en Histórico de producción.
- La ficha guiada abre un recurso ya vinculado del tipo seleccionado; si no existe, crea uno para configurar.
- Se impide considerar costo cero como registro recurrente validado.
- Se mantiene la clave de almacenamiento local de V1.0.5 para preservar registros previos.
- No se altera la configuración de Firebase ni los datos de otros ERP.
## Pruebas
`npm test`: 12 pruebas aprobadas.
La compilación `npm run build` requiere instalar dependencias (`npm install`).
## Nota
El motor de distribución pondera la producción interna 2025 por el factor de uso de cada método.
No habilitar Firebase en producción sin revisar reglas y autorización.
