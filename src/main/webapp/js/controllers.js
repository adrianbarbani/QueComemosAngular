"use strict";
recetasListApp.controller('ListarRecetasController', function(RecetasService) {

	var self = this;
	this.recetas = [];
	this.temporadas = [];
	this.dificultades = [];
	
	// trae las recetas
	this.getRecetas = function() {
		RecetasService.findAll(
		function(data) {
			self.recetas = data.data;}
		);
	}
	
	//trae temporadas
	this.getTemporadas = function(){
		RecetasService.findTemporadas(
				function(data){
					self.temporadas = data.data;
				});
	}
	
	//trae dificultades
	this.getDificultades = function(){
		RecetasService.findDificultades(
				function(data){
					self.dificultades = data.data;
				});
	}
	
	//buscar
	this.buscar = function() {
		RecetasService.buscar({
			"nombreReceta" : self.nombreReceta,
			"caloriasDesde" : self.caloriasDesde,
			"caloriasHasta": self.caloriasHasta,
			"ingrediente":self.ingrediente,
			"temporada":self.temporadaElegida,
			"dificultad":self.dificultadElegida
			
		},(function(data) {
			self.recetas=[];
			self.recetas = data.data;}
		))

	};

	this.getRecetas();
	this.getTemporadas();
	this.getDificultades();

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

recetasListApp.controller('CopiarRecetaController', function($stateParams,
		$state, $timeout, RecetasService) {

	var self = this;
	var receta;


	this.obtenerReceta = function() {
		RecetasService.getRecetaByNombre($stateParams.id, function(data) {
			self.receta = data.data;
		})

	};
	this.obtenerReceta();

	this.copiar = function() {
		RecetasService.copiarReceta(({
			"nombreDeCopia" : self.nombreDeCopia,
			"numeroId": self.receta.numeroId 
			}), this.volver)
	};
	
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
		}, this.loguear, this.notificarError);

	};

	// guarda el usr
	this.loguear = function(data) {
		SessionService.loguearUsuario(data.data);
		$state.go("listarReceta");

	}

	this.notificarError = function(mensaje) {
		self.errors.push(mensaje.data);
		$timeout(function() {
			while (self.errors.length > 0)
				self.errors.pop();
		}, 3000);
	};
});