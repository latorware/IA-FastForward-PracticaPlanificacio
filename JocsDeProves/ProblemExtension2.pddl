(define (problem ProblemExtension2)
    (:domain planificador)
    (:objects
        habitacio0 habitacio1 habitacio2 habitacio3 habitacio4 habitacio5 habitacio6 - habitacion
        reserva0 reserva1 reserva2 reserva3 reserva4 reserva5 reserva6 - reserva
        dia1 dia2 dia3 dia4 dia5 dia6 dia7 dia8 dia9 dia10 dia11 dia12 dia13 dia14 dia15 dia16 dia17 dia18 dia19 dia20 dia21 dia22 dia23 dia24 dia25 dia26 dia27 dia28 dia29 dia30 - dia
        nort sud est oest - orientacion
    )
    (:init
        (= (maxPersonas habitacio0) 2)
        (orientadaA oest habitacio0)
        (= (maxPersonas habitacio1) 1)
        (orientadaA oest habitacio1)
        (= (maxPersonas habitacio2) 3)
        (orientadaA est habitacio2)
        (= (maxPersonas habitacio3) 1)
        (orientadaA sud habitacio3)
        (= (maxPersonas habitacio4) 1)
        (orientadaA est habitacio4)
        (= (maxPersonas habitacio5) 4)
        (orientadaA est habitacio5)
        (= (maxPersonas habitacio6) 3)
        (orientadaA nort habitacio6)
        (= (personas reserva0) 4)
        (peticionOrientacion nort reserva0)
        (= (personas reserva1) 4)
        (peticionOrientacion oest reserva1)
        (= (personas reserva2) 1)
        (peticionOrientacion est reserva2)
        (= (personas reserva3) 4)
        (peticionOrientacion oest reserva3)
        (= (personas reserva4) 4)
        (peticionOrientacion est reserva4)
        (= (personas reserva5) 2)
        (peticionOrientacion est reserva5)
        (= (personas reserva6) 2)
        (peticionOrientacion est reserva6)
        (= (inicio reserva0) 27)
        (= (final reserva0) 30)
        (= (inicio reserva1) 22)
        (= (final reserva1) 27)
        (= (inicio reserva2) 22)
        (= (final reserva2) 27)
        (= (inicio reserva3) 9)
        (= (final reserva3) 16)
        (= (inicio reserva4) 6)
        (= (final reserva4) 10)
        (= (inicio reserva5) 9)
        (= (final reserva5) 15)
        (= (inicio reserva6) 15)
        (= (final reserva6) 16)
        (= (numero dia1) 1)
        (= (numero dia2) 2)
        (= (numero dia3) 3)
        (= (numero dia4) 4)
        (= (numero dia5) 5)
        (= (numero dia6) 6)
        (= (numero dia7) 7)
        (= (numero dia8) 8)
        (= (numero dia9) 9)
        (= (numero dia10) 10)
        (= (numero dia11) 11)
        (= (numero dia12) 12)
        (= (numero dia13) 13)
        (= (numero dia14) 14)
        (= (numero dia15) 15)
        (= (numero dia16) 16)
        (= (numero dia17) 17)
        (= (numero dia18) 18)
        (= (numero dia19) 19)
        (= (numero dia20) 20)
        (= (numero dia21) 21)
        (= (numero dia22) 22)
        (= (numero dia23) 23)
        (= (numero dia24) 24)
        (= (numero dia25) 25)
        (= (numero dia26) 26)
        (= (numero dia27) 27)
        (= (numero dia28) 28)
        (= (numero dia29) 29)
        (= (numero dia30) 30)
        (= (reservas_asignadas) 0)
        (= (assignadas_con_orientacion) 0)
    )
    (:goal (forall (?x - reserva) (assignada ?x)))
    (:metric maximize (+ (* 2 (reservas_asignadas)) (assignadas_con_orientacion)))
)
