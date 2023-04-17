(declare-const r-s Real)
(declare-const s-s Real)
(define-fun Valid ((p Real)) Bool (and (<= p 1) (<= 0 p)))
(define-fun EUR ((r Real) (s Real)) Real
    (+ 
        (* 90 r s)
        (* 20 r (- 1 s))
        (* 60 (- 1 r) (- 1 s))
        (* 30 (- 1 r) s)
    )
)

(define-fun EUS ((r Real) (s Real)) Real
    (+ 
        (* 10 r s)
        (* 80 r (- 1 s))
        (* 40 (- 1 r) (- 1 s))
        (* 70 (- 1 r) s)
    )
)

(assert 
        (and 
            (Valid r-s)
            (Valid s-s)

            (forall ((r-p Real))
                
                (=> (and (Valid r-p) (not (= r-p r-s)))
                    (<= (EUR r-p s-s) (EUR r-s s-s)))
                
            )
            (forall ((s-p Real))

                (=> (and (Valid s-p) (not (= s-p s-s)))
                    (<= (EUR r-s s-p) (EUR r-s s-s)))

            )
        )
            
)
(check-sat)
(get-model)
