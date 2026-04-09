(define (domain logistica)
(:requirements :numeric-fluents)
(:functions
    (setup_smistamento)
    (setup_imballaggio)
    (setup_etichettatura)
    (setup_refrigerazione)
    (personale)
    (veicoli)
    (pacchi_spediti)
    (soglia_smistamento)
    (soglia_imballaggio)
    (soglia_etichettatura)
    (soglia_refrigerazione)
    (soglia_veicoli)
    (rate_automatica)
    (rate_express)
    (rate_frigo)
)

(:action calibra_smistamento
    :parameters ()
    :precondition (and )
    :effect (increase (setup_smistamento) 1))

(:action calibra_imballaggio
    :parameters ()
    :precondition (and )
    :effect (increase (setup_imballaggio) 1))

(:action calibra_etichettatura
    :parameters ()
    :precondition (and )
    :effect (increase (setup_etichettatura) 1))

(:action calibra_refrigerazione
    :parameters ()
    :precondition (and )
    :effect (increase (setup_refrigerazione) 1))

(:action prepara_veicoli
    :parameters ()
    :precondition (and )
    :effect (increase (veicoli) 1))

(:action prepara_manuale
    :parameters ()
    :precondition (and )
    :effect (increase (personale) 1))

(:action spedizione_automatica
    :parameters ()
    :precondition (and
        (>= (setup_smistamento) (soglia_smistamento))
        (>= (setup_imballaggio) (soglia_imballaggio)))
    :effect (increase (pacchi_spediti) (rate_automatica)))

(:action spedizione_express
    :parameters ()
    :precondition (and
        (>= (setup_etichettatura) (soglia_etichettatura))
        (>= (veicoli) (soglia_veicoli)))
    :effect (increase (pacchi_spediti) (rate_express)))

(:action spedizione_frigo
    :parameters ()
    :precondition (>= (setup_refrigerazione) (soglia_refrigerazione))
    :effect (increase (pacchi_spediti) (rate_frigo)))

(:action spedizione_manuale
    :parameters ()
    :precondition (>= (personale) 1)
    :effect (increase (pacchi_spediti) 1))

)
