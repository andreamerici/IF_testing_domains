(define (domain riciclo)
(:requirements :numeric-fluents)
(:functions
    (carta_raccolta)
    (plastica_raccolta)
    (energia_recuperata)
    (compost)
    (rifiuti_smaltiti)
    (vetro_raccolta)
    (metallo_raccolta)
    (materiale_riciclato)
    (inquinamento)
    (capacita_impianto)
    (soglia_incenerimento)
    (soglia_compostaggio)
    (soglia_recupero_a)
    (soglia_recupero_b)
    (soglia_fusione_a)
    (soglia_fusione_b)
    (soglia_riciclo_a)
    (soglia_riciclo_b)
    (soglia_manutenzione)
    (rate_raccolta)
    (rate_incenerimento)
    (rate_compostaggio)
    (rate_recupero)
    (rate_fusione)
    (rate_riciclo_avanzato)
    (rate_raccolta_differenziata)
)

(:action raccogli
    :parameters ()
    :precondition (and )
    :effect (and
        (increase (carta_raccolta) 1)
        (increase (plastica_raccolta) 1)
        (increase (rifiuti_smaltiti) (rate_raccolta))
        (increase (inquinamento) 1)))

(:action raccolta_differenziata
    :parameters ()
    :precondition (>= (capacita_impianto) 1)
    :effect (and
        (increase (carta_raccolta) 1)
        (increase (plastica_raccolta) 1)
        (increase (vetro_raccolta) 1)
        (increase (metallo_raccolta) 1)
        (increase (rifiuti_smaltiti) (rate_raccolta_differenziata))
        (increase (capacita_impianto) 1)))

(:action incenerisci
    :parameters ()
    :precondition (and
        (>= (carta_raccolta) (soglia_incenerimento))
        (>= (capacita_impianto) 1))
    :effect (and
        (increase (energia_recuperata) 2)
        (increase (compost) 1)
        (increase (plastica_raccolta) 1)
        (increase (rifiuti_smaltiti) (rate_incenerimento))
        (increase (capacita_impianto) 1)))

(:action composta
    :parameters ()
    :precondition (and
        (>= (plastica_raccolta) (soglia_compostaggio))
        (>= (vetro_raccolta) 1))
    :effect (and
        (increase (compost) 2)
        (increase (energia_recuperata) 1)
        (increase (rifiuti_smaltiti) (rate_compostaggio))
        (increase (capacita_impianto) 1)))

(:action recupera_energia
    :parameters ()
    :precondition (and
        (>= (energia_recuperata) (soglia_recupero_a))
        (>= (compost) (soglia_recupero_b)))
    :effect (and
        (increase (carta_raccolta) 2)
        (increase (plastica_raccolta) 1)
        (increase (rifiuti_smaltiti) (rate_recupero))
        (increase (capacita_impianto) 2)))

(:action fusione_metalli
    :parameters ()
    :precondition (and
        (>= (metallo_raccolta) (soglia_fusione_a))
        (>= (energia_recuperata) (soglia_fusione_b)))
    :effect (and
        (increase (materiale_riciclato) (rate_fusione))
        (increase (rifiuti_smaltiti) (rate_fusione))
        (increase (capacita_impianto) 1)))

(:action riciclo_avanzato
    :parameters ()
    :precondition (and
        (>= (compost) (soglia_riciclo_a))
        (>= (materiale_riciclato) (soglia_riciclo_b))
        (>= (vetro_raccolta) 2))
    :effect (and
        (increase (rifiuti_smaltiti) (rate_riciclo_avanzato))
        (increase (capacita_impianto) 3)
        (increase (materiale_riciclato) 1)))

(:action manutenzione
    :parameters ()
    :precondition (and
        (>= (energia_recuperata) 2)
        (>= (materiale_riciclato) 1))
    :effect (and
        (increase (capacita_impianto) 5)
        (increase (rifiuti_smaltiti) 1)))
)