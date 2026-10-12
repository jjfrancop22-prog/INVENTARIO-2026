# V1.0.24 · PT y MRC por parámetro

- Los ensayos de aptitud y MRC se ingresan y calculan directamente en la sección 03 de cada ensayo, sin exigir vinculación a Costos compartidos.
- Se eliminan PT y MRC del selector de servicios nuevos de equipos y del panel de conceptos compartidos.
- Se incluye una migración manual con respaldo local que copia importes y frecuencias de PT/MRC compartidos a los parámetros vinculados y elimina los registros compartidos de origen para impedir doble imputación.
- Se conservan las claves locales de almacenamiento y el catálogo de 128 parámetros.
- Atención: revisar las vinculaciones antes de migrar, ya que un PT previamente asociado a varios parámetros se trasladará a todos ellos. Para programas multiparámetro, revisar la distribución del gasto para evitar imputar el total a cada parámetro.
