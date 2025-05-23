class ProfesionalVinculado {
    var universidad 
    
    method puedeTrabajarEn() = [self.universidad().provincia()]
    method honorarios() = self.universidad().honorarios()
    method universidad() = universidad
    method cobrar(importe) {
        universidad.recaudar(importe/2)
    }
}
class ProfesionalLitoral {
    var universidad 
    const litoral = [entreRios, santaFe, corrientes]
    method puedeTrabajarEn() = litoral
    method honorarios() = 3000
    method universidad() = universidad
    method cobrar(importe) {
        asociacionLitoral.recaudar(importe)
    }
}
class ProfesionalesLibres{
    var puedeTrabajarEn 
    var honorarios 
    var universidad 
    var recaudado = 0
    method puedeTrabajarEn() = puedeTrabajarEn
    method honorarios() = honorarios
    method universidad() = universidad
    method cobrar(importe) {recaudado +=importe}
    method pasarDinero(persona,cantidad) {
        recaudado-=cantidad
        persona.cobrar(cantidad)
    }
}
object asociacionLitoral {
    var recaudado = 0
  method recaudar(importe) {recaudado +=importe}
  method recaudado() = recaudado

}
class empresa {
    const clientes []
    const contratados = []
    method clientes() = clientes
    var honorarios = 3500
    method cuantosEstudiaronEn(unaUniversidad) = contratados.count({c=>c.universidad()==unaUniversidad})
    method profesionalesCaros() = contratados.filter({c=>c.honorarios()>self.honorarios()}).asSet()
    method honorarios() = honorarios
    method honorarios(nuevo) {honorarios = nuevo}
    method universidadesFormadoras() = contratados.map({c=>c.universidad()}).asSet()
    method profesionalMasBarato() = contratados.min({c=>c.honorarios()})
    method esDeGenteAcotada() = contratados.all({c=>c.puedeTrabajarEn().size() <= 3})
    method contratarA(profesional) = contratados.add(profesional)
    method contratados() = contratados
    method algunoPuedeAtenderA(solicitante) = contratados.any({c=>solicitante.puedeSerAtendidoPor(c)})
    method losQuePuedenAtenderA(solicitante) = contratados.filter({c=>solicitante.puedeSerAtendidoPor(c)})
    method darServicio(cliente) {
        if (self.algunoPuedeAtenderA(cliente)) {
            self.losQuePuedenAtenderA(cliente).anyone().cobrar(self.honorarios())
            clientes.add(cliente)
        }
    }
    method cuantosClientesTiene() = clientes.size()
    method tieneComoClienteA(alguien) = self.clientes().contains(alguien)
}
class persona {
    var provincia
    method provincia() = provincia
    method puedeSerAtendidoPor(profesional) = profesional.puedeTrabajarEn().contains(self.provincia())
}
class institucion{
  var universidades
  method universidades() = universidades
  method puedeSerAtendidoPor(profesional) = self.universidades().contains(profesional.universidad())

}
class club {
    var provincia
    method provincia()= provincia
    method puedeSerAtendidoPor(profesional) = profesional.puedeTrabajarEn().contains(self.provincia().any())
}

object uniRosario {
    var recaudado = 0
    method recaudar(importe) {recaudado+=importe}
    method recaudado() = recaudado
    method provincia() = santaFe
    method honorarios() = 2800
}
object uniSanMartin {
    var recaudado = 0
    method recaudar(importe) {recaudado+=importe}
    method recaudado() = recaudado
    method provincia() = buenosAires
    method honorarios() = 3500
}
object unahur {
    var recaudado = 0
    method recaudar(importe) {recaudado+=importe}
    method recaudado() = recaudado
    method provincia() = buenosAires
    method honorarios() = 8800
}
object uniCorrientes {
    var recaudado = 0
    method recaudar(importe) {recaudado+=importe}
    method recaudado() = recaudado
    method provincia() = corrientes
    method honorarios() = 4200
}
object entreRios {
  
}
object santaFe {

}
object corrientes {
  
}
object buenosAires {

}
object cordoba {
  
}
