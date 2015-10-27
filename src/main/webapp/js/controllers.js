recetasListApp.controller('ListarRecetasController', function (RecetasService) {

var self = this;

  this.tareas = [];

  this.getTareas = function() {
      tareasService.findAll(function(data) {
        self.tareas = data;
      });
  } 

  this.getTareas();
  /*this.recetas = RecetasService.recetas;
  RecetasService.listarRecetas();*/
   
  

});


recetasListApp.controller('ShowRecetaController', function ($stateParams, $state, RecetasService) {

  this.receta = RecetasService.getRecetaByNombre($stateParams.id);

  if (!this.receta) {
    $state.go("listarReceta");
    return;
  }


  this.volver = function () {
    $state.go("listarReceta");
  };

});