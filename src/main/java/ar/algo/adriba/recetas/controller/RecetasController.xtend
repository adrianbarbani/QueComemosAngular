package ar.algo.adriba.recetas.controller

import ar.algo.adriba.appModel.DetalleDeRecetaAppModel
import ar.algo.adriba.appModel.LoginAppModel
import ar.algo.adriba.appModel.RecetasObjectSet
import ar.algo.adriba.appModel.UltimasConsultasAppModel
import ar.algo.adriba.appModel.UsuariosObjectSet
import ar.algo.adriba.tp1.Busqueda
import ar.algo.adriba.tp1.Receta
import ar.algo.adriba.tp1.Usuario
import java.util.List
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils

@Controller
class RecetasController {

	Usuario usr

	extension JSONUtils = new JSONUtils

	def static void main(String[] args) {
		XTRest.start(RecetasController, 9000)
	}

	@Post("/login/")
	def Result login(@Body String body) {
		val LoginAppModel login = body.fromJson(LoginAppModel)
		UsuariosObjectSet.INSTANCE.crearUsuarios

		try {
			
			login.autorizarLogin
			usr = login.usuarioLogin

			response.contentType = ContentType.TEXT_PLAIN
			ok(login.nombreUsuarioABuscar.toJson)
			
		} catch (Exception e) {
			badRequest(e.message)
		}

	}
	
	
	def listarLasRecetas() {
		val appModel = new UltimasConsultasAppModel(usr)
		appModel.initSearch()
		
		var List<Receta> recetas = appModel.resultados
		recetas
	}

	@Get("/recetas")
	def Result Recetas() {
		RecetasObjectSet.INSTANCE.crearRecetas(usr)

		var recetas = listarLasRecetas()

		response.contentType = ContentType.APPLICATION_JSON
		ok(recetas.toJson)
	}
	
	
	@Get("/receta/:id")
	def Result getRecetaByNombre(@Body String body) {
		
		
		var Busqueda busqueda = new Busqueda(usr)
		var detalleReceta = new DetalleDeRecetaAppModel(busqueda.buscarRecetaPorNombre(body),usr)
		var Receta receta = detalleReceta.unaReceta
			
		response.contentType = ContentType.APPLICATION_JSON
		ok(receta.toJson)
	}
}
