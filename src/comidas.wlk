/*Bien
 */
class Plato {
	
	method peso()
	method valoracion()	
	method aptoVegetariano() 
	method esAbundante() = self.peso() > 250
	
}

class Provoleta inherits Plato{
	var property tieneEspecias = false
	const property peso
	override method aptoVegetariano() = not self.tieneEspecias()
	override method valoracion() = if(self.esEspecial()){120}else{80}
	method esEspecial() = self.esAbundante() || self.tieneEspecias()
}



class HamburguesasCarne inherits Plato{
	var property panUtilizado  
	
	override method peso() = 250
	override method aptoVegetariano() = false
	override method valoracion() = 60 + panUtilizado.puntos()
}

object panIndustrial {
	const property puntos = 0
}

object panCasero {
	const property puntos = 20
}

object panMasaMadre {
	const property puntos = 45
}

class HamburguesasVegetarianas inherits HamburguesasCarne{
	
	var property tipoLegumbre = ""
	override method aptoVegetariano() = true
	override method valoracion() = super() + 17.min(2 * self.tipoLegumbre().size())
}

class Parrillada inherits Plato{
	const property cortes = []
	
	
	override method peso() = cortes.sum({ c => c.peso() }) 
	override method aptoVegetariano() = false
	override method valoracion() = 0.max(15 * self.maxCalidadCortes() - self.cantCortes())
	method maxCalidadCortes() = cortes.max({ c => c.calidad() }).calidad()
	method cantCortes() = cortes.size()
	method agregarCorte(corte) {cortes.add(corte)}
}




class CorteCarne {
	var property nombre = ""
	var property calidad = 0
	var property peso = 0
}



