recetasListApp.service("recetasService", function ($http) {


  this.findAll = function(callback) {
        $http.get('/recetas').then(callback);
    }
  
  /*
  this.recetas = [];

  this.getRecetaByNombre = function (id) {
    return _.find(this.recetas, function (receta) {
      return receta.nombre == id;
    });
  };

  this.agregarReceta = function (receta) {
    this.recetas.push(receta);
  };

  this.listarRecetas = function(){
    if (this.recetas.length == 0) {
      this.agregarReceta(new Receta("Milanesa Napoliana", 900, "Media", "Todo el año", [{nombre:"Carne", cantidad:5},{nombre:"pan rallado", cantidad:400}], ["Sal","Oregano"],["Vegano"],"Empanar la carne y freir. Agregar salsa de tomate y queso. Cocinar."));
      this.agregarReceta(new Receta("Ravioles", 1600, "Dificil", "Otoño"));
      };    
  };*/
  

});