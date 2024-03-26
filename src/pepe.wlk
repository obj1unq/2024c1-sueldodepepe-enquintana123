object ernesto {
	var companiero = roque
	const faltas = 0
	var bonoPresentismo = normal
	
	
	method sueldo() {
		return self.neto() + self.presentismo()
	}
	
	method companiero(_companiero) {
		companiero = _companiero
	}
	
	method neto() {
		return companiero.neto()
	}
	
	method presentismo() {
		return bonoPresentismo.valor(self)
	}

	method bonoPresentismo(_bonoPresentismo) {
		bonoPresentismo = _bonoPresentismo
	}
	
	method faltas() {
		return faltas
	}
}

object roque {
	var bonoResultado = resultadoNulo
	
	method sueldo() {
		return self.netoFijo() + self.resultado() + self.extra()
	}
	
	method netoFijo() {
		return 28000
	}
	
	method resultado() {
		return bonoResultado.valor(self)
	}
	
	method extra() {
		return 9000
	}
	
	method bonoResultado(_bonoResultado) {
		bonoResultado = _bonoResultado
	}
}

object sofia {
	
	var categoria = cadete
	
	method sueldo() {
		return self.neto() //+ self.resultado()
	}
	
	method neto() {
		return categoria.neto() * 1.3
	}
	
	method categoria(_categoria) {
		categoria = _categoria
	}
}

object pepe {

	var faltas = 0
	var categoria = cadete
	var bonoResultado = resultadoNulo
	var bonoPresentismo = normal
	
	method faltas() {
		return faltas
	}
	
	method faltas(_faltas) {
		faltas = _faltas
	}
	method sueldo() {
		return self.neto() + self.resultado()  + self.presentismo()
		//		+ bonoResultado.valor(categoria.neto()) 
		//		+ bonoPresentismo.calcular(faltas) 
	}
	
	method neto() {
		return categoria.neto()
	}
	
	method resultado() {
		return bonoResultado.valor(self)
	}

	method presentismo() {
		return bonoPresentismo.valor(self)
	}

	method bonoResultado(_bonoResultado) {
		bonoResultado = _bonoResultado
	}
	
	method bonoPresentismo(_bonoPresentismo) {
		bonoPresentismo = _bonoPresentismo
	}
	
	method categoria(_categoria) {
		categoria = _categoria
	}
	

}
//Bono RESULTADOS
object montoFijo {
	method valor(empleado) {
		return 800
	}
}
object resultadoNulo {
	method valor(empleado) {
		return 0
	}
}
object porcentual {
	method valor(empleado) {
		return empleado.neto() * 0.1
	}
}


//Bonos por PRESENTISMO normal
//$2000 pesos si la persona a quien se aplica no faltó nunca, $1000 si faltó sólo un día, $0 en cualquier otro caso.
object normal {
	method valor(empleado) {
		return if (empleado.faltas() == 0) {
			2000
		}
		else if(empleado.faltas() == 1) {
			1000
		}
		else {
			0
		}
		//return (2000 - empleado.faltas()).max(0)

	}
}

//* _Ajuste_: $100 pesos si el empleado no faltón nunca, $0 en cualquier otro caso. 
object ajuste {
	method valor(empleado) {
		return if(empleado.faltas() == 0) 100 else 0
	}
}

//* _Demagógico_: $500 pesos si el neto es menor a 18000, $300 en caso contrario. 
object demagogico {
	method valor(empleado) {
		return if(empleado.neto() < 18000) 500 else 300
	} 
}

object presentismoNulo {
	method valor(empleado) {
		return 0
	}
}

object cadete {
	var neto = 20000
	method neto() {
		return neto
	}
}

object gerente {
	var neto = 15000
	method neto() {
		return neto
	}
}

object vendedor {
	var neto = 16000
	var muchasVentas = true
	
	method neto() {
		return if(muchasVentas) neto * 1.25 else neto
	}
	
	method activarAumentoPorMuchasVentas() {
		self.muchasVentas(true)
	}
	
	method desactivarAumentoPorMuchasVentas() {
		self.muchasVentas(false)
	}
	
	method muchasVentas(_muchasVentas) {
		muchasVentas = _muchasVentas
	}
}

object medioTiempo {
	var categoriaBase = cadete
	method neto() {
		return self.categoriaBase()
	}
	method categoriaBase() {
		return categoriaBase.neto() / 2
	} 
	method categoriaBase(_categoriaBase) {
		categoriaBase = _categoriaBase
	}
}