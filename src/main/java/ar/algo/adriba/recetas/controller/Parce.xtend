package ar.algo.adriba.recetas.controller

import ar.algo.adriba.tp1.Cosas
import ar.algo.adriba.tp1.Publica
import ar.algo.adriba.tp1.TipoReceta
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@JsonIgnoreProperties(ignoreUnknown = true)
@Accessors
class Parce {
	public String nombreDeCopia
	public String numeroId
	}