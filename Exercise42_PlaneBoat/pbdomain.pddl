(define (domain planeboats)
(:requirements :strips :typing :durative-actions :fluents)
    
    (:types 
        location locatable - object
        package driver vehicle - locatable
        truck boat plane - vehicle
    )
    
    (:predicates
        (connected ?from ?to - location)
        (airconnected ?from ?to - location)
        (seaconnected ?from ?to - location) 
       (at ?o - locatable ?l - location)
        (in ?p - package ?v - vehicle)
        (driving ?d - driver ?t - truck)
    )

    (:functions
        ; (fuel-level ?t - truck)
        (distance ?from ?to - location)
        (walkspeed)
        (drivespeed)
        (boatspeed)
        (planespeed)
    )
    
    ;;================;;
    ;; driver actions ;;
    ;;================;;
    (:durative-action walk
        :parameters (?d - driver ?from ?to - location)
        :duration (= ?duration (/(distance ?from ?to)(walkspeed)))
        :condition (and 
            (at start (and 
                (at ?d ?from)
            ))
            (over all (and
                (connected ?from ?to) 
            ))
        )
        :effect (and 
            (at start (and 
                (not (at ?d ?from))
            ))
            (at end (and 
                (at ?d ?to)
            ))
        )
    )   

    (:durative-action board_vehicle
        :parameters (?t - truck ?d - driver ?wp - location)
        :duration (= ?duration 10)
        :condition (and 
            (at start (and 
                (at ?d ?wp)
            ))
            (over all (and 
                (at ?t ?wp)
            ))
        )
        :effect (and 
            (at start (and 
                (not (at ?d ?wp))
            ))
            (at end (and 
                (driving ?d ?t)
            ))
        )
    ) 

    (:durative-action disembark_vehicle
        :parameters (?t - truck ?d - driver ?wp - location)
        :duration (= ?duration 10)
        :condition (and 
            (at start (and 
                (driving ?d ?t)
            ))
            (over all (and 
                (at ?t ?wp)
            ))
        )
        :effect (and 
            (at start (and
                (not (driving ?d ?t)) 
            ))
            (at end (and 
                (at ?d ?wp)
            ))
        )
    )
    
    
    ;;=================;;
    ;; vehicle actions ;;
    ;;=================;;
    
    (:durative-action drive_truck
        :parameters (?t - truck ?d - driver ?from ?to - location)
        :duration (= ?duration (/(distance ?from ?to)(drivespeed)))
        :condition (and 
            (at start (and
                (at ?t ?from) 
            ))
            (over all (and 
                (connected ?from ?to)
                (driving ?d ?t)
            ))
        )
        :effect (and 
            (at start (and 
                 (not (at ?t ?from))
            ))
            (at end (and 
                (at ?t ?to)
            ))
        )
    )

    ;;=================;;
    ;; plane boat actions ;;
    ;;=================;;
    (:durative-action move_plane
        :parameters (?p - plane ?from ?to - location)
        :duration (= ?duration (/(distance ?from ?to)(planespeed)))
        :condition (and 
            (at start (and 
                (airconnected ?from ?to)
                (at ?p ?from) 
            ))
            
        )
        :effect (and 
            (at start (and 
                (not (at ?p ?from))
            ))
            (at end (and 
                (at ?p ?to) 
            ))
        )
    )

    (:durative-action move_boat
        :parameters (?b - boat ?from ?to - location)
        :duration (= ?duration (/(distance ?from ?to)(boatspeed)))
        :condition (and 
            (at start (and 
                (seaconnected ?from ?to)
                (at ?b ?from) 
            ))
            
        )
        :effect (and 
            (at start (and 
                (not (at ?b ?from))
            ))
            (at end (and 
                (at ?b ?to) 
            ))
        )
    )
    
    ;;=================;;
    ;; package actions ;;
    ;;=================;;
    (:durative-action load_package
        :parameters (?v - vehicle ?p - package ?wp - location)
        :duration (= ?duration 10)
        :condition (and 
            (at start (and
                (at ?p ?wp)
            ))
            (over all (and 
                (at ?v ?wp)
            )
            )
        )
        :effect (and 
            (at start (not (at ?p ?wp)))
            (at end (and 
                (in ?p ?v)
            ))
        )
    )

    (:durative-action unload_package
        :parameters (?v - vehicle ?p - package ?wp - location)
        :duration (= ?duration 10)
        :condition (and 
            (at start (and 
                (in ?p ?v)
            ))
            (over all (and
                (at ?v ?wp) 
            ))
        )
        :effect (and 
            (at start (not (in ?p ?v)))
            (at end (and 
                (at ?p ?wp)
            ))
        )
    )


    
    
)