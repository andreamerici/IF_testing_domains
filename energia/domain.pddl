(define (domain energia)
(:requirements :numeric-fluents)
(:functions
    (pannelli_solari)
    (turbine_eoliche)
    (dighe_idrauliche)
    (reattori_geotermici)
    (operatori_impianto)
    (energia_prodotta)
    (soglia_solare)
    (soglia_eolico)
    (soglia_idraulico)
    (soglia_geotermico)
    (soglia_ibrido)
    (rate_solare)
    (rate_eolico)
    (rate_idraulico)
    (rate_geotermico)
    (rate_ibrido)
)

(:action installa_pannello
    :parameters ()
    :precondition (and )
    :effect (increase (pannelli_solari) 1))

(:action monta_turbina
    :parameters ()
    :precondition (and )
    :effect (increase (turbine_eoliche) 1))

(:action costruisci_diga
    :parameters ()
    :precondition (and )
    :effect (increase (dighe_idrauliche) 1))

(:action attiva_reattore
    :parameters ()
    :precondition (and )
    :effect (increase (reattori_geotermici) 1))

(:action assumi_operatore
    :parameters ()
    :precondition (and )
    :effect (increase (operatori_impianto) 1))

(:action produci_solare
    :parameters ()
    :precondition (>= (pannelli_solari) (soglia_solare))
    :effect (increase (energia_prodotta) (rate_solare)))

(:action produci_eolico
    :parameters ()
    :precondition (>= (turbine_eoliche) (soglia_eolico))
    :effect (increase (energia_prodotta) (rate_eolico)))

(:action produci_idraulico
    :parameters ()
    :precondition (and
        (>= (dighe_idrauliche) (soglia_idraulico))
        (>= (operatori_impianto) (soglia_idraulico)))
    :effect (increase (energia_prodotta) (rate_idraulico)))

(:action produci_geotermico
    :parameters ()
    :precondition (and
        (>= (reattori_geotermici) (soglia_geotermico))
        (>= (operatori_impianto) (soglia_geotermico)))
    :effect (increase (energia_prodotta) (rate_geotermico)))

(:action produci_ibrido
    :parameters ()
    :precondition (and
        (>= (pannelli_solari) (soglia_ibrido))
        (>= (turbine_eoliche) (soglia_ibrido))
        (>= (operatori_impianto) (soglia_ibrido)))
    :effect (increase (energia_prodotta) (rate_ibrido)))

)
