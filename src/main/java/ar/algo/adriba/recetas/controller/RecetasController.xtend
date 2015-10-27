package ar.algo.adriba.recetas.controller

import ar.algo.adriba.appModel.RecetasObjectSet
import ar.algo.adriba.appModel.UltimasConsultasAppModel
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils

@Controller
class RecetasController {
	extension JSONUtils = new JSONUtils

	def static void main(String[] args) {
		XTRest.start(RecetasController, 9000)
	}
	 //a
	
	@Get("/recetas")
	def Result Recetas() {
		val usuario = RecetasObjectSet.INSTANCE.crearUsuario
		RecetasObjectSet.INSTANCE.crearRecetas(usuario) 
		
		val appModel= new UltimasConsultasAppModel(usuario)
		appModel.initSearch()	
	
		var recetas = appModel.resultados 
		
//		UsuariosObjectSet.INSTANCE.crearUsuarios
//		var recetas = RepoDeUsuariosMock.getInstance.todosLosUsuarios

		
		response.contentType = ContentType.APPLICATION_JSON
		ok(recetas.toJson)
	}
}