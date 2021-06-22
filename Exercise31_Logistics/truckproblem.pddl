(define (problem truckproblem) 
(:domain truckdomain)
(:requirements :strips :typing)
    (:objects 
        w1 w2 w3 w4 w5 w6 w7 w8 w9 w10 w11 - location
        t1 t2 - truck
        dr1 dr2 - driver
        pack1 pack2 pack3 pack4 - package
    )

    (:init
        ; driver
        (at dr1 w4)
        (at dr2 w1)
        ; truck
        (at t1 w6)
        (at t2 w9)
        ; packages
        (at pack1 w2)
        (at pack2 w3)
        (at pack3 w5)
        (at pack4 w11)
        (connected w1 w2)
        (connected w1 w5)
        (connected w1 w4)
        (connected w2 w1)
        (connected w2 w3)
        (connected w2 w6)
        (connected w3 w2)
        (connected w3 w8)
        (connected w4 w1)
        (connected w4 w9)
        (connected w5 w1)
        (connected w5 w6)
        (connected w6 w5)
        (connected w6 w2)
        (connected w6 w7)
        (connected w7 w6)
        (connected w8 w3)
        (connected w8 w11)
        (connected w9 w4)
        (connected w9 w10)
        (connected w10 w9)
        (connected w10 w11)
        (connected w11 w8)
        (connected w11 w10)
    )

    (:goal (and
        ;todo: put the goal condition here
        ; drive home
        (at dr1 w1)
        (at dr2 w1)
        ; package delivered
        (at pack1 w9)
        (at pack3 w9)
        (at pack2 w2)
        (at pack4 w2)
        )
    )
)
