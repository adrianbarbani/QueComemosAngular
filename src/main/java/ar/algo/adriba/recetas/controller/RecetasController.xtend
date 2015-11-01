package ar.algo.adriba.recetas.controller

import ar.algo.adriba.appModel.CopiarRecetaAppModel
import ar.algo.adriba.appModel.DetalleDeRecetaAppModel
import ar.algo.adriba.appModel.LoginAppModel
import ar.algo.adriba.appModel.RecetasObjectSet
import ar.algo.adriba.appModel.UltimasConsultasAppModel
import ar.algo.adriba.appModel.UsuariosObjectSet
import ar.algo.adriba.tp1.Busqueda
import ar.algo.adriba.tp1.Receta
import ar.algo.adriba.tp1.RepoDeTemporadas
import ar.algo.adriba.tp1.RepoDificultades
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
	extension JSONPropertyUtils = new JSONPropertyUtils
	
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

	@Get("/recetas")
	def Result Recetas() {
		RecetasObjectSet.INSTANCE.crearRecetas(usr)

		var List<Receta> recetas = listarLasRecetas()

		response.contentType = ContentType.APPLICATION_JSON
		ok(recetas.toJson)
	}
	
	@Get("/temporadas")
	def Result temporadas() {
		var temporadas = RepoDeTemporadas.getInstance.dameLasTemporadas()

		response.contentType = ContentType.APPLICATION_JSON
		ok(temporadas.toJson)
	}
	
	@Get("/dificultades")
	def Result dificultades() {
		var dificultades = RepoDificultades.getInstance.getTodasLasDificultades()

		response.contentType = ContentType.APPLICATION_JSON
		ok(dificultades.toJson)
	}
	
	
	@Post("/receta/:id")
	def Result getRecetaByNombre(@Body String body) {
		
		var Busqueda busqueda = new Busqueda(usr)
		
		var detalleReceta = new DetalleDeRecetaAppModel(busqueda.buscarPorId(body),usr)
		var Receta receta = detalleReceta.unaReceta
			
		response.contentType = ContentType.APPLICATION_JSON
		ok(receta.toJson)
	}
	
	
	
 	 @Post("/copiar/")
	def Result receta(@Body String body) {
		
		var Busqueda busqueda = new Busqueda(usr)
		
		var id = body.getPropertyValue("numeroId")
		var String nombreDeCopia = body.getPropertyValue("nombreDeCopia") 
		
		var copiaReceta = new CopiarRecetaAppModel(busqueda.buscarPorId(id),usr,nombreDeCopia)
		
		
		copiaReceta.copiarReceta()	
		
		response.contentType = ContentType.TEXT_PLAIN
		ok('{ "status" : "OK" }')
	}
	
	@Post("/buscar/")
	def Result buscar(@Body String body) {
		var consultas = new UltimasConsultasAppModel(usr)
		var ParceBusqueda aux = body.fromJson(ParceBusqueda)
		
		consultas.caloriasDesde = 1//Integer.parseInt(body.getPropertyValue("caloriasDesde"))
		consultas.caloriasHasta = 20000//Integer.parseInt(body.getPropertyValue("caloriasHasta"))
		consultas.nombre = aux.nombreReceta
		consultas.dificultadSeleccionada= null
		consultas.temporadaSeleccionada= null
		consultas.ingredienteABuscar= null //body.getPropertyValue("ingrediente")
		consultas.buscar()
		
		response.contentType = ContentType.APPLICATION_JSON
		ok(consultas.resultados.toJson)
	}
	//------------------------------------------------------------------
	def listarLasRecetas() {
		val appModel = new UltimasConsultasAppModel(usr)
		appModel.initSearch()
		
		var List<Receta> recetas = appModel.resultados
		recetas
	}
}
