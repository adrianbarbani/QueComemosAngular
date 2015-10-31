package ar.algo.adriba.tp1

import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@JsonIgnoreProperties(ignoreUnknown=true)
interface TipoReceta {
	def boolean sePuedeSugerir()

	def boolean tePuedeModificar(Receta unaReceta, Usuario usuario)

	def void cambiarValores(Usuario usuario, Receta receta, Receta unaRecetaConModificaciones)

	def boolean mePuedeVer(Usuario usuario, Receta unaReceta)

	def boolean sosPublica()

	def void setearReceta(Receta receta)

	def void crearUnaCopiaPropia(Receta receta, Usuario usuario, String string)
}
