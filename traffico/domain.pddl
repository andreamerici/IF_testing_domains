(define (domain traffico)
(:requirements :numeric-fluents)
(:functions
    (binari)
    (corsie)
    (piste_ciclabili)
    (fermate)
    (personale_atm)
    (persone_trasportate)
    (soglia_metro)
    (soglia_bus)
    (soglia_bici)
    (soglia_tram)
    (rate_metro)
    (rate_bus)
    (rate_bici)
    (rate_tram)
)

(:action posa_binario
    :parameters ()
    :precondition (and )
    :effect (increase (binari) 1))

(:action traccia_corsia
    :parameters ()
    :precondition (and )
    :effect (increase (corsie) 1))

(:action costruisci_pista
    :parameters ()
    :precondition (and )
    :effect (increase (piste_ciclabili) 1))

(:action installa_fermata
    :parameters ()
    :precondition (and )
    :effect (increase (fermate) 1))

(:action assumi_personale
    :parameters ()
    :precondition (and )
    :effect (increase (personale_atm) 1))

(:action usa_metro
    :parameters ()
    :precondition (>= (binari) (soglia_metro))
    :effect (increase (persone_trasportate) (rate_metro)))

(:action usa_bus
    :parameters ()
    :precondition (>= (corsie) (soglia_bus))
    :effect (increase (persone_trasportate) (rate_bus)))

(:action usa_bici
    :parameters ()
    :precondition (>= (piste_ciclabili) (soglia_bici))
    :effect (increase (persone_trasportate) (rate_bici)))

(:action usa_tram
    :parameters ()
    :precondition (and
        (>= (fermate) (soglia_tram))
        (>= (personale_atm) (soglia_tram)))
    :effect (increase (persone_trasportate) (rate_tram)))

)
