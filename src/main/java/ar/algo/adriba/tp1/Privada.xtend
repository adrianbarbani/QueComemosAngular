package ar.algo.adriba.tp1

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import org.eclipse.xtend.lib.annotations.Accessors
import com.fasterxml.jackson.annotation.JsonIgnore

@JsonIgnoreProperties(ignoreUnknown=true)
@Accessors
class Privada implements TipoReceta {

	@JsonIgnore Usuario duenio 
	String nombre
	String defi = new String("Privada")
	
	new(Usuario unUsuario, Receta unaReceta) {
		duenio = unUsuario
		this.agregarRecetaADuenio(unaReceta)
	}
	
	def agregarRecetaADuenio(Receta receta) {
		duenio.agregar(receta)
	}
	
	new (Usuario unUsuario){
		duenio = unUsuario
	}

	override sePuedeSugerir() {
		false
	}

	override tePuedeModificar(Receta unaReceta, Usuario usuario) {
		usuario.usuarioTiene(unaReceta)
	}

	override cambiarValores(Usuario usuario, Receta receta, Receta unaRecetaConModificaciones) {
		receta.setearValores(unaRecetaConModificaciones)
		if (nombre == null) {
			receta.nombreDelPlato = unaRecetaConModificaciones.nombreDelPlato
		} else {
			receta.setearNombre(nombre)
		}
		usuario.agregar(receta)
	
	}

	override mePuedeVer(Usuario unUsuario, Receta unaReceta) {
		unUsuario.usuarioTiene(unaReceta) || unUsuario.alguienDelGrupoConoce(unaReceta)
	}
	
	override boolean sosPublica(){
		false
	}
	
	override setearReceta(Receta receta) {
		this.agregarRecetaADuenio(receta)
	}
	
	override crearUnaCopiaPropia(Receta receta, Usuario usuario, String string) {
		var recetaAModificar = new Receta(receta, usuario)
		recetaAModificar.nombreDelPlato = string
		this.cambiarValores(usuario, recetaAModificar, receta)
	}
	
	
	

}
