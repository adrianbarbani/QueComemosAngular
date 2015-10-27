package ar.algo.adriba.recetas.controller

import ar.algo.adriba.tp1.RepositorioRecetas
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

	@Get("/recetas")
	def Result Recetas() {
		val recetas = RepositorioRecetas.instance.todasLasRecetas
		response.contentType = ContentType.APPLICATION_JSON
		ok(recetas.toJson)
	}
}