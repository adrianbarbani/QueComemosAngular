package ar.algo.adriba.appModel

import ar.algo.adriba.tp1.Receta
import ar.algo.adriba.tp1.RepositorioRecetas
import ar.algo.adriba.tp1.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CopiarReceta {
	Receta receta
	Usuario usuario
	String nuevoNombrePlato = null
	Receta miReceta 

	new(Receta unaReceta, Usuario unUsuario, String nuevoNombre) {
		receta = unaReceta
		usuario = unUsuario
		nuevoNombrePlato = nuevoNombre
	}

	def void copiar() {
		miReceta = usuario.copiar(receta)

		if (!nuevoNombrePlato.isNullOrEmpty) {
			miReceta.nombreDelPlato = nuevoNombrePlato
		}
		
		
	}


	
	}