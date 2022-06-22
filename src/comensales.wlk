import comidas.*

class Comensales {
	var property peso 
	const property comidasIngeridas = []
	method leAgrada(unaComida)
	method estaSatisfecho()
	method comer(unaComida) { comidasIngeridas.add(unaComida) }
	
}

class Vegetarianos inherits Comensales {
	override method leAgrada(unaComida) = unaComida.aptoVegetariano() && unaComida.valoracion() > 85 && self.noHayAbundantes()
	method noHayAbundantes() = comidasIngeridas.all({ c => !c.esAbundante() })	
	override method estaSatisfecho() = self.noHayAbundantes()
}

class HambrePopular inherits Comensales {
	override method leAgrada(unaComida) = unaComida.esAbundante()
	override method estaSatisfecho() = comidasIngeridas.all({ c => c.esAbundante() })
}


class PaladarFino inherits Comensales {
	override method leAgrada(unaComida) = unaComida.peso().between(150,300) and unaComida.valoracion() > 100
	override method estaSatisfecho() = comidasIngeridas.size().even()
}