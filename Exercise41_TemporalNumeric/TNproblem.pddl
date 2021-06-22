(define (problem problem_TN_logistics)
(:domain TN_logistics)
(:requirements :strips :typing :durative-actions)

    (:objects 
        wp1 wp2 wp3 wp4 wp5 wp6 wp7 wp8 wp9 wp10 wp11 - location
        t1 t2 - truck
        dr1 dr2 - driver
        pack1 pack2 pack3 pack4 - package
    )
    
    (:init
        ; numerical
        (= (walkspeed) 0.5)
        (= (drivespeed) 1)
        (= (distance wp1 wp2) 100)
        (= (distance wp2 wp1) 100)
        (= (distance wp2 wp3) 100)
        (= (distance wp3 wp2) 100)
        (= (distance wp3 wp8) 75)
        (= (distance wp8 wp3) 75)
        (= (distance wp8 wp11) 75)
        (= (distance wp11 wp8) 75)
        (= (distance wp11 wp10) 100)
        (= (distance wp10 wp11) 100)
        (= (distance wp10 wp9) 100)
        (= (distance wp9 wp10) 100)
        (= (distance wp9 wp4) 75)
        (= (distance wp4 wp9) 75)
        (= (distance wp4 wp1) 75)
        (= (distance wp1 wp4) 75)       
        (= (distance wp5 wp1) 100)
        (= (distance wp1 wp5) 100)
        (= (distance wp5 wp6) 50)
        (= (distance wp6 wp5) 50)
        (= (distance wp6 wp7) 50)
        (= (distance wp7 wp6) 50)
        (= (distance wp2 wp6) 75)
        (= (distance wp6 wp2) 75)

        ;; drivers
        (at dr1 wp4)
        (at dr2 wp1)
        
        ;; trucks
        (at t1 wp6)
        (at t2 wp9)
        
        ;; packages
        (at pack1 wp2)
        (at pack2 wp3)
        (at pack3 wp5)
        (at pack4 wp11)
        
        ;; Ground Connections
        (connected wp1 wp2)
        (connected wp2 wp1)
        (connected wp2 wp3)
        (connected wp3 wp2)
        (connected wp3 wp8)
        (connected wp8 wp3)
        (connected wp8 wp11)
        (connected wp11 wp8)
        (connected wp11 wp10)
        (connected wp10 wp11)
        (connected wp10 wp9)
        (connected wp9 wp10)
        (connected wp9 wp4)
        (connected wp4 wp9)
        (connected wp4 wp1)
        (connected wp1 wp4)
        (connected wp1 wp5)
        (connected wp5 wp1)
        (connected wp5 wp6)
        (connected wp6 wp5)
        (connected wp6 wp7)
        (connected wp7 wp6)
        (connected wp2 wp6)
        (connected wp6 wp2)
    )
    
    (:goal (and 
        ;; drivers home
        (at dr1 wp1)
        (at dr2 wp1)
        
        ;; packages delivered
        (at pack1 wp9)
        (at pack2 wp2)
        (at pack3 wp9)
        (at pack4 wp2)
    ))
)