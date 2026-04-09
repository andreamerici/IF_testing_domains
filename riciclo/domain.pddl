(define (domain riciclo)
(:requirements :numeric-fluents)
(:functions
    (carta_raccolta)
    (plastica_raccolta)
    (energia_recuperata)
    (compost)
    (rifiuti_smaltiti)
    (soglia_incenerimento)
    (soglia_compostaggio)
    (soglia_recupero_a)
    (soglia_recupero_b)
    (rate_raccolta)
    (rate_incenerimento)
    (rate_compostaggio)
    (rate_recupero)
)

(:action raccogli
    :parameters ()
    :precondition (and )
    :effect (and
        (increase (carta_raccolta) 1)
        (increase (plastica_raccolta) 1)
        (increase (rifiuti_smaltiti) (rate_raccolta))))

(:action incenerisci
    :parameters ()
    :precondition (>= (carta_raccolta) (soglia_incenerimento))
    :effect (and
        (increase (energia_recuperata) 2)
        (increase (compost) 1)
        (increase (plastica_raccolta) 1)
        (increase (rifiuti_smaltiti) (rate_incenerimento))))

(:action composta
    :parameters ()
    :precondition (>= (plastica_raccolta) (soglia_compostaggio))
    :effect (and
        (increase (compost) 2)
        (increase (energia_recuperata) 1)
        (increase (rifiuti_smaltiti) (rate_compostaggio))))

(:action recupera_energia
    :parameters ()
    :precondition (and
        (>= (energia_recuperata) (soglia_recupero_a))
        (>= (compost) (soglia_recupero_b)))
    :effect (and
        (increase (carta_raccolta) 2)
        (increase (plastica_raccolta) 1)
        (increase (rifiuti_smaltiti) (rate_recupero))))

)
