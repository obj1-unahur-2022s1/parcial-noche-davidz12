import comidas.*
import comensales.*

class Cocina {
	const property comidasPreparadas = []
	
	method buenaOfertaVegetariana() = (self.cantComidasVegetarianas() - self.cantComidasNoVegetarianas()).abs() <= 2
	method comidasVegetarianas() =  comidasPreparadas.filter({ c => c.aptoVegetariano() })
	method cantComidasVegetarianas() = self.comidasVegetarianas().size()
	method comidasNoVegetarianas() = comidasPreparadas.filter({ c => !c.aptoVegetariano() })
	method cantComidasNoVegetarianas() = self.comidasNoVegetarianas().size()
	method platoFuerteCarnivoro() = self.comidasNoVegetarianas().max({ c => c.valoracion() })
	method comidasQueGustan(unComensal) = comidasPreparadas.filter ({ c => unComensal.leAgrada(c) })
	
}