"use strict";
recetasListApp.controller('ListarRecetasController', function(recetasService) {

	var self = this;
	this.recetas = [];

	this.getRecetas = function() {
		recetasService.findAll(function(data) {
			self.recetas = data.data;
		});
	}

	this.getRecetas();

	/*
	 * this.recetas = RecetasService.recetas; RecetasService.listarRecetas();
	 */

});

recetasListApp.controller('ShowRecetaController', function($stateParams,
		$state, recetasService) {

	this.receta = recetasService.getRecetaByNombre($stateParams.id);

	if (!this.receta) {
		$state.go("listarReceta");
		return;
	}

	this.volver = function() {
		$state.go("listarReceta");
	};

});