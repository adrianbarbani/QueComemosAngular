recetasListApp.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/");

  $stateProvider

  .state('login', {
	  url:"/",
	  templateUrl:"partials/login.html",
	  controller:"LoginController as loginCtrl"
  })
  
    .state('listarReceta', {
      url: "/listarRecetas/",
      templateUrl: "partials/listar_receta.html",
      controller: "ListarRecetasController as listarCtrl"
    })

    .state('showReceta', {
      url: "/receta/:id",
      templateUrl: "partials/show_receta.html",
      controller: "ShowRecetaController as showCtrl"
    })
  

});