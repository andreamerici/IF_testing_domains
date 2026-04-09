(define (domain fabbrica)
(:requirements :numeric-fluents)
(:functions
    (materie_prime)
    (semilavorati)
    (prodotti_finiti)
    (scorte_energia)
    (qualita)
    (spedizioni)
    (costi_operativi)
    (soglia_lavorazione)
    (soglia_assemblaggio)
    (soglia_qualita)
    (soglia_spedizione)
    (soglia_ottimizzazione)
    (rate_lavorazione)
    (rate_assemblaggio)
    (rate_spedizione)
    (rate_ottimizzazione)
)

(:action rifornisci
    :parameters ()
    :precondition (and )
    :effect (and
        (increase (materie_prime) 1)
        (increase (costi_operativi) 1)))

(:action lavora
    :parameters ()
    :precondition (>= (materie_prime) (soglia_lavorazione))
    :effect (and
        (increase (semilavorati) 1)
        (increase (prodotti_finiti) (rate_lavorazione))
        (increase (costi_operativi) 1)))

(:action assembla
    :parameters ()
    :precondition (>= (semilavorati) (soglia_assemblaggio))
    :effect (and
        (increase (prodotti_finiti) (rate_assemblaggio))
        (increase (costi_operativi) 2)))

(:action controlla_qualita
    :parameters ()
    :precondition (>= (prodotti_finiti) (soglia_qualita))
    :effect (and
        (increase (qualita) 2)
        (increase (semilavorati) 1)
        (increase (costi_operativi) 1)))

(:action spedisci
    :parameters ()
    :precondition (and
        (>= (prodotti_finiti) (soglia_spedizione))
        (>= (qualita) 1))
    :effect (and
        (increase (spedizioni) (rate_spedizione))
        (increase (scorte_energia) 1)
        (increase (costi_operativi) 1)))

(:action ottimizza
    :parameters ()
    :precondition (and
        (>= (scorte_energia) (soglia_ottimizzazione))
        (>= (qualita) (soglia_ottimizzazione)))
    :effect (and
        (increase (materie_prime) 2)
        (increase (semilavorati) 1)
        (increase (prodotti_finiti) (rate_ottimizzazione))
        (increase (spedizioni) 1)))

)
