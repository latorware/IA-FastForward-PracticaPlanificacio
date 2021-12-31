(define (domain planificador)
    (:requirements :strips :equality :conditional-effects :adl :typing :fluents)
    (:types habitacion reserva dia orientacion - object
            ;;nort sud est oest - orientacion
    )
    (:predicates
        (assignada ?x - reserva) ;; x assignada
        (assignacion ?x - reserva ?y - habitacion) ;; x asignada en y
        (ocupada ?x - dia ?y - habitacion) ;; y ocupada en x
        (orientadaA ?x - orientacion ?y - habitacion) ;; y orientada en x
        (peticionOrientacion ?x - orientacion ?y - reserva) ;; peticion de y en orientacion x

    )

    (:functions
        (maxPersonas ?x - habitacion) ;; personas maximas que puede alojar x
        (personas ?x - reserva) ;; personas en x
        (inicio ?x - reserva) ;; dia inicio de x
        (final ?x - reserva) ;; dia final de x
        (numero ?x - dia) ;; numero de x
        (reservas_asignadas) ;; reservas asignadas
        (assignadas_con_orientacion) ;; reservas se cumple la orientacion y estan asignadas
    )



    (:action assignar
        :parameters (?x - reserva ?y - habitacion)
        :precondition (and (not (assignada ?x)) (>= (maxPersonas ?y) (personas ?x)) (forall (?t - dia) (or(and (<= (numero ?t) (final ?x)) (>= (numero ?t) (inicio ?x)) (not (ocupada ?t ?y)))  (or (> (numero ?t) (final ?x)) (< (numero ?t) (inicio ?x)))     )))
        :effect (and (assignada ?x) (when (exists (?d - orientacion) (and (orientadaA ?d ?y) (peticionOrientacion ?d ?x))) (increase (assignadas_con_orientacion) 1)) (assignacion ?x ?y) (increase (reservas_asignadas) 1) (forall (?t - dia) (when (and (<= (numero ?t) (final ?x)) (>= (numero ?t) (inicio ?x))) (ocupada ?t ?y))))
    )



)