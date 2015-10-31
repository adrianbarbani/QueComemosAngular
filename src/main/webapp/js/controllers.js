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
		RecetasService.getRecetaByNombre($stateParams.id, function(data) {
			self.receta = data.data;
		})
	};

	this.mostrar();

	// this.receta = RecetasService.getRecetaByNombre($stateParams.id);

	// if (!this.receta) {
	// $state.go("listarReceta");
	// return;
	// }

	this.volver = function() {
		$state.go("listarReceta");
	};

});

recetasListApp.controller('LoginController', function($stateParams, $state,
		$timeout, UsuariosService, RecetasService, SessionService) {

	var self = this;
	this.errors = [];

	this.ingresar = function() {
		UsuariosService.loguear({
			"nombreUsuarioABuscar" : self.nombreUsuarioABuscar,
			"contrasenia" : self.contrasenia
		}, this.loguear, this.notificarError );

	};

	//trae la
	this.loguear = function(data) {
		SessionService.loguearUsuario(data.data);
		$state.go("listarReceta");
		
	}

	this.notificarError = function (mensaje) {
		self.errors.push(mensaje.data);
		$timeout(function() {
			while (self.errors.length > 0)
				self.errors.pop();
		}, 3000);
	}
	;
});