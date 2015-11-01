package ar.algo.adriba.tp1

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Publica implements TipoReceta {

	//Receta recetaAModificar
	String defi = new String("Publica")
	
	
	override sePuedeSugerir() {
		true
	}

	override tePuedeModificar(Receta unaReceta, Usuario usuario) {
		true
	}

	override cambiarValores(Usuario usuario, Receta receta, Receta unaRecetaConModificaciones) {
		val Receta nuevaReceta = usuario.copiar(receta)
		usuario.agregar(nuevaReceta)
		usuario.modificarUnaReceta(nuevaReceta, unaRecetaConModificaciones)

	}

	override mePuedeVer(Usuario usuario, Receta unaReceta) {
		true
	}

	override boolean sosPublica() {
		true
	}

	override setearReceta(Receta receta) {
	}

	override crearUnaCopiaPropia(Receta receta, Usuario usuario, String string) {
		var recetaAModificar = new Receta(receta,usuario)
		if (string == null) {
			recetaAModificar.nombreDelPlato = receta.nombreDelPlato
		} else {
			recetaAModificar.nombreDelPlato = string
		}
		this.cambiarValores(usuario, receta, recetaAModificar)
	}

}
