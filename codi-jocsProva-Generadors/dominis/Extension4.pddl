(define (domain planificador)
    (:requirements :strips :equality :conditional-effects :adl :typing :fluents)
    (:types habitacion reserva dia - object
    )
    (:predicates
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
        (reservas_asignadas) ;; reservas asignadas
        (plazas_sin_ocupar) ;; plazas que no han sido asignadas en una habitacion
        (habitaciones_reservadas) ;; total de habitaciones diferentes reservadas
    )



    (:action assignar_habitacion_previamente_sin_assignar
        :parameters (?x - reserva ?y - habitacion)
        :precondition (and (not (assignada ?x)) (>= (maxPersonas ?y)
            (personas ?x)) (forall (?t - dia) (not (ocupada ?t ?y))))
        :effect (and (assignada ?x) (assignacion ?x ?y) (increase (reservas_asignadas) 1)
            (increase (plazas_sin_ocupar) (- (maxPersonas ?y) (personas ?x)) )
            (increase (habitaciones_reservadas) 1)
            (forall (?t - dia) (when (and (<= (numero ?t) (final ?x)) (>= (numero ?t)
            (inicio ?x))) (ocupada ?t ?y)))
            )
    )

    (:action assignar_habitacion_previamente_assignada
        :parameters (?x - reserva ?y - habitacion)
        :precondition (and (not (assignada ?x)) (>= (maxPersonas ?y)
            (personas ?x)) (forall (?t - dia) (or(and (<= (numero ?t) (final ?x))
            (>= (numero ?t) (inicio ?x)) (not (ocupada ?t ?y)))  (or (> (numero ?t)
            (final ?x)) (< (numero ?t) (inicio ?x)))))
            (exists (?t - dia) (ocupada ?t ?y)))
        :effect (and (assignada ?x) (assignacion ?x ?y) (increase (reservas_asignadas) 1)
            (increase (plazas_sin_ocupar) (- (maxPersonas ?y) (personas ?x)) )
            (forall (?t - dia) (when (and (<= (numero ?t) (final ?x)) (>= (numero ?t)
            (inicio ?x))) (ocupada ?t ?y)))
            )
    )

)
