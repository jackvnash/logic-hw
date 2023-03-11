(declare-const l1 Real)
(declare-const l2 Real)
(declare-const u1 Real)
(declare-const u2 Real)
(declare-const z Real)

;(assert (exists ((z Int)) (and (<= x (* 2 z)) (<= (* 3 z) y))))
;(apply qe)

;(assert (forall ((z Real)) 
 ;       (=> 
  ;          (and (< l1 z) (and (< l2 z) (and (< z u1) (< z u2))))
   ;         (exists ((w Real)) 
    ;            (and (< l1 w) (and (< l2 w) (and (< w u1) (and (< w u2) (not (= w z))))))
     ;       )
      ;  )
;))

;(assert (not (forall (( x Real ))
;        (exists ((y Real))
;            (and
;                (> (* 2 y) (* 3 x))
;                (< (* 4 y) (+ 10 (* 8 x)))
;            )
;        
;        )
;)))

(assert (exists ((a1 Real) (a2 Real) (b1 Real) (b2 Real) (c1 Real) (c2 Real) (d1 Real) (d2 Real))
    (and 
        (< a1 a2)
        (< b1 b2)
        (< c1 c2)
        (< d1 d1)
        (or ; a-c edge
            (and (< a1 c1) (> a2 c1))
            (and (> a1 c1) (< a1 c2))
        )
        (or ; a-b edge
            (and (< a1 b1) (> a2 b1))
            (and (> a1 b1) (< a1 b2))
        )
        (or ; d-c edge
            (and (< d1 c1) (> d2 c1))
            (and (> d1 c1) (< d1 c2))
        )
        (or ; d-b edge
            (and (< b1 d1) (> b2 d1))
            (and (> b1 d1) (< b1 d2))
        )
        (not (or ; not b-c edge
            (and (< b1 c1) (> b2 c1))
            (and (> b1 c1) (< b1 c2))
        ))
        (not (or ; not a-d edge
            (and (< a1 d1) (> a2 d1))
            (and (> a1 d1) (< a1 d2))
        ))

    )

))

(check-sat)

