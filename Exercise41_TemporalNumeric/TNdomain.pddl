(define (domain TN_logistics)
(:requirements :strips :typing :durative-actions :fluents)
    
    (:types 
        location locatable - object
        package truck driver - locatable
    )
    
    (:predicates
        (connected ?from ?to - location)
        (at ?o - locatable ?l - location)
        (in ?p - package ?t - truck)
        (driving ?d - driver ?t - truck)
    )

    (:functions
        ; (fuel-level ?t - truck)
        (distance ?from ?to - location)
        (walkspeed)
        (drivespeed)
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
    ;; package actions ;;
    ;;=================;;
    (:durative-action load_package
        :parameters (?t - truck ?p - package ?wp - location)
        :duration (= ?duration 10)
        :condition (and 
            (at start (and
                (at ?p ?wp)
            ))
            (over all (and 
                (at ?t ?wp)
            )
            )
        )
        :effect (and 
            (at start (not (at ?p ?wp)))
            (at end (and 
                (in ?p ?t)
            ))
        )
    )

    (:durative-action unload_package
        :parameters (?t - truck ?p - package ?wp - location)
        :duration (= ?duration 10)
        :condition (and 
            (at start (and 
                (in ?p ?t)
            ))
            (over all (and
                (at ?t ?wp) 
            ))
        )
        :effect (and 
            (at start (not (in ?p ?t)))
            (at end (and 
                (at ?p ?wp)
            ))
        )
    )
    
)