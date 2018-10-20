import provincias.*

class Profesional {
	var property universidad
	var property tipoDeProf
	
	method trabajaEn()
	
	method puedeEnTalProvincia(provincia){
		return tipoDeProf.puedeTrabajarEn(self).any {x => x == provincia}
	}
	method honorarios(){
		tipoDeProf.honorario_hora(self)
	} 
}

class Profesional_universidad{
	method puedeTrabajarEn(profesional){
		return profesional.universidad().provincia()
	}
	method honorario_hora(profesional){
		return profesional.universidad().honorarios_recomendados()
	} 
}

class Profesional_litoral{
	var trabajaEn = [entreRios, santaFe, corrientes]
	method puedeTrabajarEn(empleado){
		return trabajaEn
	}
	method honorario_hora(){
		return 3000
	}		
}

class Profesional_libre{
	var property honorarioHora
	var property provincias = []
	
	method puedeTrabajarEn(empleado){
		return provincias
		}
	method honorario_hora(){
		return honorarioHora
	}
}

class Universidad {
	var property provincia
	var property honorarios_recomendados
}