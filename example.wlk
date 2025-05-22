class ProfesionalVinculado {
    var universidad 
    method puedeTrabajarEn() = [self.universidad().provincia()]
    method honorarios() = self.universidad().honorarios()
    method universidad() = universidad
}
class ProfesionalLitoral {
    var universidad 
    const litoral = [entreRios, santaFe, corrientes]
    method puedeTrabajarEn() = litoral
    method honorarios() = 3000
    method universidad() = universidad
}
class ProfesionalesLibres{
    var puedeTrabajarEn 
    var honorarios 
    var universidad 
    method puedeTrabajarEn() = puedeTrabajarEn
    method honorarios() = honorarios
    method universidad() = universidad
}
object empresa {
    const contratados = []
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
    method puedeSatisfacerA(solicitante) = solicitante.puedeSerAtendido()
}
class persona {
    var provincia
    method provincia() = provincia
    method puedeSerAtendido() = empresa.contratados().any({c=>c.puedeTrabajarEn().contains(self.provincia())})
}
class institucion{
  var universidades
  method universidades() = universidades
  method puedeSerAtendido() = empresa.contratados().any({c=>institucion.universidades().contains(c.universidad())})

}
class club {
    var provincia
    method provincia()= provincia
    method puedeSerAtendido() = self.provincia().any({p=>empresa.contratados().puedeTrabajarEn().contains(p)})
}

object uniRosario {
    method provincia() = santaFe
    method honorarios() = 2800
}
object uniSanMartin {
    method provincia() = buenosAires
    method honorarios() = 3500
}
object unahur {
    method provincia() = buenosAires
    method honorarios() = 8800
}
object uniCorrientes {
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
