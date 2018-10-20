import example.*
import provincias.*


class Empresa {
	var property lista_empleados = []
	var property honorarios_referencia
	
	method profesionales_caros (){
		return lista_empleados.filter {x => x.honorarios() > honorarios_referencia}
		}
	method universidades_formadoras(){
		return lista_empleados.map{x => x.universidad().provincia()}.asSet()
		}
	method profesional_mas_barato(){
		return lista_empleados.min{x => x.honorarios()}
	}
	method provincia_cubierta(provincia){
		return lista_empleados.any{x => x.puedeEnTalProvincia(provincia)}
	}
	method cuantos_en_universidad(universidad){
		return lista_empleados.count{x => x.universidad() == universidad}
	}
	method poco_atractivo(empleado){
		return empleado.trabajaEn().all {provincia => 
			lista_empleados.any{x => x.puedeEnTalProvincia() and x.honorarios() < empleado.honorarios()}
			}}
}
