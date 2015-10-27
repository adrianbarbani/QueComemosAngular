recetasListApp.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/");

  $stateProvider

    .state('listarReceta', {
      url: "/",
      templateUrl: "partials/listar_receta.html",
      controller: "ListarRecetasController as listarCtrl"
    })

    .state('showReceta', {
      url: "/receta/:id",
      templateUrl: "partials/show_receta.html",
      controller: "ShowRecetaController as showCtrl"
    });

});