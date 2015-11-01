package ar.algo.adriba.recetas.controller

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ParceBusqueda {
	String nombreReceta
	int caloriasDesde
	int caloriasHasta
	String ingrediente
	String dificultad
	String temporada
}