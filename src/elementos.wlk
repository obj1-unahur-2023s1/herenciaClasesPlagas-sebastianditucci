import plagas.*

class Hogar {
	var property nivelDeMugre
	var property confortOfrecido
	method esBueno() = nivelDeMugre <= confortOfrecido / 2
	method ataqueDePlaga(plaga) { 
		nivelDeMugre += plaga.nivelDeDanio()
		plaga.efectoDePlaga()
	}
} 

class Huerta {
	var property capacidadProduccion
	var property nivel
	method esBueno() = capacidadProduccion > nivel
	method ataqueDePlaga(plaga) { 
		if (plaga.puedeTransmitir()) { capacidadProduccion -=  (plaga.nivelDeDanio() / 10) + 10} 
		else { capacidadProduccion -= plaga.nivelDeDanio() / 10 }
		plaga.efectoDePlaga()
	}
}

class Mascota {
	var property nivelDeSalud
	method esBueno() = nivelDeSalud > 250
	method ataqueDePlaga(plaga) { 
		if (plaga.puedeTransmitir()) nivelDeSalud -= plaga.nivelDeDanio() 
		plaga.efectoDePlaga()
	}
}

class Barrio {
	const elementos = []
	method aniadirElemento(elemento) { elementos.add(elemento) }
	method sacarElemento(elemento) { elementos.remove(elemento) }
	method esCopado() = elementos.count({e => e.esBueno()}) > elementos.count({e => !e.esBueno()})
}