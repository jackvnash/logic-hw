
(define-fun Valid ((p Real)) Bool (and (<= p 1) (<= 0 p)))
(define-fun EUR ((r Real) (s Real) (ru1 Real) (ru2 Real) (ru3 Real) (ru4 Real)) Real
    (+ 
        (* ru1 r s)
        (* ru2 r (- 1 s))
        (* ru4 (- 1 r) (- 1 s))
        (* ru3 (- 1 r) s)
    )
)

(define-fun EUS ((r Real) (s Real) (su1 Real) (su2 Real) (su3 Real) (su4 Real)) Real
    (+ 
        (* su1 r s)
        (* su2 r (- 1 s))
        (* su4 (- 1 r) (- 1 s))
        (* su3 (- 1 r) s)
    )
)

(assert 
    (not
        (forall ((su1 Real) (su2 Real) (su3 Real) (su4 Real)
                 (ru1 Real) (ru2 Real) (ru3 Real) (ru4 Real)) 
                 
            (exists ((r-s Real) (s-s Real)) (and 
            (Valid r-s)
            (Valid s-s)

            (forall ((r-p Real))
                
                (=> (and (Valid r-p) (not (= r-p r-s)))
                    (<= (EUR r-p s-s ru1 ru2 ru3 ru4) 
                        (EUR r-s s-s ru1 ru2 ru3 ru4)))
                
            )
            (forall ((s-p Real))

                (=> (and (Valid s-p) (not (= s-p s-s)))
                    (<= (EUR r-s s-p su1 su2 su3 su4) 
                        (EUR r-s s-s su1 su2 su3 su4)))

            )
        ))
        ))
            
)
(check-sat)
;; (get-model)
