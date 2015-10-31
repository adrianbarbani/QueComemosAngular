"use strict";
recetasListApp.controller('ListarRecetasController', function(RecetasService) {

	var self = this;
	this.recetas = [];

	this.getRecetas = function() {
		RecetasService.findAll(function(data) {
			self.recetas = data.data;
		});
	}

	this.getRecetas();

	/*
	 * this.recetas = RecetasService.recetas; RecetasService.listarRecetas();
	 */

});

recetasListApp.controller('ShowRecetaController', function($stateParams,
		$state, RecetasService) {

	var receta;
	var self = this;
	
	this.mostrar = function() {
		RecetasService.getRecetaByNombre($stateParams.id, function(data){
		self.receta = data.data;
	})
	};
	
	this.mostrar();
	
	
	//this.receta = RecetasService.getRecetaByNombre($stateParams.id);

//	if (!this.receta) {
//		$state.go("listarReceta");
//		return;
//	}

	this.volver = function() {
		$state.go("listarReceta");
	};

});

recetasListApp.controller('LoginController', function($stateParams, $state,
		UsuariosService, RecetasService, SessionService) {

	var self = this;

	this.ingresar = function() {
		UsuariosService.loguear({
			"nombreUsuarioABuscar" : self.nombreUsuarioABuscar,
			"contrasenia" : self.contrasenia
		}, this.listarRecetas);

	};

	this.listarRecetas = function(data) {

		SessionService.loguearUsuario(data.data);

		RecetasService.findAll(function() {
			$state.go("listaRecetas");
		});

	}
});