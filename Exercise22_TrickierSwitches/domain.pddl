(define (domain trickier_switches)
    (:requirements :typing :negative-preconditions :disjunctive-preconditions :conditional-effects)
    
    ;; this domain has one type of object
    (:types switch)

    (:predicates
        ;; the properties of a switch
        (off ?s - switch)
        (on ?s - switch)
        (neighbours ?s1 ?s2 - switch)
        (onedge ?s - switch)
    )
 

    ; this action toggles a switch ON
    ; a neighbouring switch must be already on!
    (:action switch_on
        :parameters (?s ?neighbour ?another - switch)
        :precondition (and
            (off ?s)
            (neighbours ?s ?neighbour)
            (on ?neighbour)
            (or
                (onedge ?s)
                (and (not (onedge ?s))
                    (neighbours ?s ?another)
                    (off ?another)
                )
            )
        )
        :effect (and
            (not (off ?s))
            (on ?s)
        )
    )
    
    ;; this action toggles a switch OFF
    (:action switch_off
        :parameters (?s - switch)
        :precondition (and
            (on ?s)
        )
        :effect (and
            (off ?s)
            (not (on ?s))
        )
    )
)