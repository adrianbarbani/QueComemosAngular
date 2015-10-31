"use strict";
recetasListApp.controller('ListarRecetasController', function(RecetasService) {

	var self = this;
	this.recetas = [];

	//trae las recetas
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

	var self = this;
	var receta;
		
	this.mostrar = function() {
		RecetasService.getRecetaByNombre($stateParams.id, function(data) {
			self.receta = data.data;
		})
		
	};

	this.mostrar();
	
	this.volver = function() {
		$state.go("listarReceta");
	};

});

recetasListApp.controller('CopiarRecetaController', function($stateParams, $state,
		$timeout, UsuariosService, RecetasService, SessionService) {
	
	var self = this;
	var receta;
	
	this.copiar = function(){
		RecetasService.copiarReceta({
			"nombreDeCopia" : self.nombreDeCopia})};
	
	
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

	//guarda el usr
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