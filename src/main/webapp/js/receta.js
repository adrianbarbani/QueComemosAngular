var Receta = function (nombre, calorias, dificultad, temporada, ingredientes, condimentos, condiciones, descripcion,tipo) {
  this.nombre = nombre || '';
  this.calorias = calorias || 0;
  this.dificultad = dificultad || '';
  this.temporada = temporada || '';
  this.ingredientes = ingredientes || [];
  this.condimentos = condimentos || [];
  this.condiciones = condiciones || [];
  this.descripcion = descripcion || '';
  this.tipo = tipo || 'Publica'; 
};

