(define (domain planificador)
    (:requirements :strips :equality :conditional-effects :adl :typing :fluents)
    (:types habitacion reserva - object
            identificador dia - object2
    )
    (:predicates
        (identificacion ?x - object ?y - identificador) ;;y es el identificador de x
        (assignada ?x - reserva) ;; x assignada
        (assignacion ?x - reserva ?y - habitacion) ;; x asignada en y
        (ocupada ?x - dia ?y - habitacion) ;; y ocupada en x

    )

    (:functions
        (maxPersonas ?x - habitacion) ;; personas maximas que puede alojar x
        (personas ?x - reserva) ;; personas en x
        (inicio ?x - reserva) ;; dia inicio de x
        (final ?x - reserva) ;; dia final de x
        (numero ?x - dia) ;; numero de x
    )



    (:action assignar
        :parameters (?x - reserva ?y - habitacion)
        :precondition (and (not (assignada ?x)) (>= (maxPersonas ?y) (personas ?x)) (forall (?z - dia) (when (and (<= (numero ?z) (final ?x)) (>= (numero ?z) (inicio ?x))) (not (ocupada ?z ?y)))))
        :effect (and (assignada ?x) (assignacion ?x ?y) (forall (?t dia) (when (and (<= (numero ?t) (final ?x)) (>= (numero ?t) (inicio ?x))) (ocupada ?t ?y))))
    )



)