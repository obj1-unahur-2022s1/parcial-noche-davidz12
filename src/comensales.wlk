/*Bien */
import comidas.*

class Comensales {
	var property peso 
	const property comidasIngeridas = []
	method leAgrada(unaComida)
	method estaSatisfecho() = self.comidasIngeridas() >= peso * 0.01
	method comer(unaComida) { comidasIngeridas.add(unaComida) }
	
	method comidasIngeridas() = comidasIngeridas.sum { c => c.peso() }
	
}

class Vegetarianos inherits Comensales {
	override method leAgrada(unaComida) = unaComida.aptoVegetariano() && unaComida.valoracion() > 85 && self.noHayAbundantes()
	method noHayAbundantes() = comidasIngeridas.all({ c => !c.esAbundante() })	
	override method estaSatisfecho() = super() && self.noHayAbundantes()
}

class HambrePopular inherits Comensales {
	override method leAgrada(unaComida) = unaComida.esAbundante()
	
}


class PaladarFino inherits Comensales {
	override method leAgrada(unaComida) = unaComida.peso().between(150,300) and unaComida.valoracion() > 100
	override method estaSatisfecho() = super() && comidasIngeridas.size().even()
}