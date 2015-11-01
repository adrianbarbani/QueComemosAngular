recetasListApp.service("RecetasService", function ($http) {

  this.findAll = function(callback) {
        $http.get('/recetas').then(callback);
    }
    
    this.getRecetaByNombre = function(id, callback) {
		$http.get('/receta/'+id).then(callback)
	}
    
    this.copiarReceta = function(recetaData, callback){
    	$http.post('/copiar/', recetaData).then(callback)
    }
    

});

recetasListApp.service('UsuariosService', function($http) {

	this.loguear = function(loginData, callback, errorHandler) {
		$http.post('/login/', loginData).then(callback, errorHandler);
	};

});

recetasListApp.service('SessionService', function() {

	var usuarioLogueado;
	var self = this;

	this.loguearUsuario = function(usuario) {
		self.usuarioLogueado = usuario;		
	};
});
  

  

