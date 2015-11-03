recetasListApp.service("RecetasService", function ($http) {

  this.findAll = function(callback) {
        $http.get('/recetas').then(callback);
    };
    
    this.findDificultades = function(callback) {
        $http.get('/dificultades').then(callback);
    };
    
    this.findTemporadas = function(callback) {
        $http.get('/temporadas').then(callback);
    };
    
    this.getRecetaByNombre = function(id, callback) {
		$http.get('/receta/'+id).then(callback);
	};
    
    this.copiarReceta = function(recetaData,callback){
    	$http.post('/copiar/', recetaData).then(callback);
    };
    
    this.buscar = function(infoBuscar, callback){
    	$http.post('/buscar/', infoBuscar).then(callback);

    };

});

recetasListApp.service('UsuariosService', function($http) {

	this.loguear = function(loginData, callback, errorHandler) {
		$http.post('/login/', loginData).then(callback, errorHandler);
	};
	
	this.hacerFavorita = function(favoritaData){
		$http.post('/favorita/', favoritaData)
	};

});

recetasListApp.service('SessionService', function() {

	var usuarioLogueado;
	var self = this;

	this.loguearUsuario = function(usuario) {
		self.usuarioLogueado = usuario;		
	};
});
  

  

