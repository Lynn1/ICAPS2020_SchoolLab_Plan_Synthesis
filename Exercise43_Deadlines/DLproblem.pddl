(define (problem problem_deadlines)
(:domain deadlines)


    (:objects 
        wp1 wp2 wp3 wp4 wp5 wp6 wp7 wp8 wp9 wp10 wp11 sky lighthouse - location
        t1 t2 - truck
        dr1 dr2 - driver
        pack1 pack2 pack3 pack4 - package
        b1 - boat
        p1 - plane
    )
    
    (:init
        ; numerical
        (= (walkspeed) 0.5)
        (= (drivespeed) 1)
        (= (boatspeed) 1.5)
        (= (planespeed) 2)
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
        (= (distance wp4 sky) 20)
        (= (distance sky wp4) 20)
        (= (distance wp2 sky) 20)
        (= (distance sky wp2) 20)
        (= (distance wp7 lighthouse) 75)
        (= (distance lighthouse wp7) 75)

        ;; drivers
        (pos dr1 wp4)
        (pos dr2 wp1)
        
        ;; trucks
        (pos t1 wp6)
        (pos t2 wp9)

        ;; plane boat
        (pos p1 sky)
        (pos b1 lighthouse)
        
        ;; packages
        (pos pack1 wp2)
        (pos pack2 wp3)
        (pos pack3 wp5)
        (pos pack4 wp11)

        (at 0 (available pack1))
        (at 0 (available pack2))
        (at 0 (available pack3))
        (at 0 (available pack4))

        (at 2500 (not (available pack1)))
        (at 2500 (not (available pack2)))
        (at 2500 (not (available pack3)))
        (at 2500 (not (available pack4))) 
        
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
        (airconnected wp2 sky)
        (airconnected sky wp2)
        (seaconnected wp7 lighthouse) 
        (seaconnected lighthouse wp7)
    )
    
    (:goal (and 
        ;; drivers home
        (pos dr1 wp1)
        (pos dr2 wp1)
        
        ;; packages delivered.
        (pos pack1 wp9)
        (pos pack2 lighthouse)
        (pos pack3 wp9)
        (pos pack4 wp2)        
        ; (at 2500 (pos pack1 wp9))
        ; (at 2500 (pos pack2 lighthouse))
        ; (at 2500 (pos pack3 wp9))
        ; (at 2500 (pos pack4 wp2))
    ))
)