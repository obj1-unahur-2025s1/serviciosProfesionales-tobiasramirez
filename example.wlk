class ProfesionalVinculado {
    var juana = new ProfesionalVinculado
    method puedeTrabajarEn() = self.universidad().provincia()
    method honorarios() = self.universidad().honorarios()
}
class ProfesionalLitoral {
    method puedeTrabajarEn() = santaFe && entreRios && corrientes
    method honorarios() = 3000
}
class ProfesionalesLibres{
    method puedeTrabajarEn() = self.provincia()
    method honorarios() = self.honorarios()
}
