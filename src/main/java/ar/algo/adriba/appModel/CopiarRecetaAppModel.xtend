package ar.algo.adriba.appModel

import ar.algo.adriba.tp1.Receta
import ar.algo.adriba.tp1.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class CopiarRecetaAppModel {

	Receta receta
	String nombreDeCopia
	Usuario usuario

	new (String nombre){
		nombreDeCopia = nombre
	}
	
	new(Receta unaReceta, Usuario unUsuario, String nombre) {
		receta = unaReceta
		usuario = unUsuario
		nombreDeCopia = nombre
	}

	def copiar() {
		receta.crearCopia(usuario, nombreDeCopia)
	}
}
