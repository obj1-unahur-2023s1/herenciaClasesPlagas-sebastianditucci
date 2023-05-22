class Plaga {
	var property poblacion
	method puedeTransmitir() = poblacion >= 10
	method efectoDePlaga() { poblacion = poblacion * 0.1 }
}

class Cucaracha inherits Plaga {
	var property pesoPromedio
	method nivelDeDanio() = poblacion / 2
	override method puedeTransmitir() = super() and pesoPromedio >= 10
	override method efectoDePlaga() { 
		super()
		pesoPromedio += 2
	}
}

class Pulga inherits Plaga {
	method nivelDeDanio() = poblacion * 2
}

class Garrapata inherits Plaga {
	method nivelDeDanio() = poblacion * 2
	override method efectoDePlaga() { poblacion = poblacion * 0.2 }
}

class Mosquito inherits Plaga {
	method nivelDeDanio() = poblacion
	override method puedeTransmitir() = super() and poblacion % 3 == 0
}