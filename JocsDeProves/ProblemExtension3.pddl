(define (problem ProblemExtension3)
    (:domain planificador)
    (:objects
        habitacio0 habitacio1 habitacio2 habitacio3 habitacio4 habitacio5 habitacio6 - habitacion
        reserva0 reserva1 reserva2 reserva3 reserva4 reserva5 reserva6 - reserva
        dia1 dia2 dia3 dia4 dia5 dia6 dia7 dia8 dia9 dia10 dia11 dia12 dia13 dia14 dia15 dia16 dia17 dia18 dia19 dia20 dia21 dia22 dia23 dia24 dia25 dia26 dia27 dia28 dia29 dia30 - dia
    )
    (:init
        (= (maxPersonas habitacio0) 4)
        (= (maxPersonas habitacio1) 1)
        (= (maxPersonas habitacio2) 1)
        (= (maxPersonas habitacio3) 4)
        (= (maxPersonas habitacio4) 4)
        (= (maxPersonas habitacio5) 2)
        (= (maxPersonas habitacio6) 1)
        (= (personas reserva0) 1)
        (= (personas reserva1) 2)
        (= (personas reserva2) 3)
        (= (personas reserva3) 4)
        (= (personas reserva4) 2)
        (= (personas reserva5) 1)
        (= (personas reserva6) 3)
        (= (inicio reserva0) 8)
        (= (final reserva0) 11)
        (= (inicio reserva1) 5)
        (= (final reserva1) 16)
        (= (inicio reserva2) 17)
        (= (final reserva2) 26)
        (= (inicio reserva3) 22)
        (= (final reserva3) 23)
        (= (inicio reserva4) 5)
        (= (final reserva4) 14)
        (= (inicio reserva5) 18)
        (= (final reserva5) 19)
        (= (inicio reserva6) 6)
        (= (final reserva6) 12)
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
        (= (plazas_sin_ocupar) 0)
    )
    (:goal (forall (?x - reserva) (assignada ?x)))
    (:metric maximize (- (reservas_asignadas) (plazas_sin_ocupar)))
)
