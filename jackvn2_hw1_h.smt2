(declare-const p00 Bool)
(declare-const p01 Bool)
(declare-const p02 Bool)

(declare-const p10 Bool)
(declare-const p11 Bool)
(declare-const p12 Bool)

(declare-const p20 Bool)
(declare-const p21 Bool)
(declare-const p22 Bool)

(declare-const p30 Bool)
(declare-const p31 Bool)
(declare-const p32 Bool)

(declare-const p40 Bool)
(declare-const p41 Bool)
(declare-const p42 Bool)

(define-fun conjecture () Bool
    (and
        ((_ at-most 1) p00 p01 p02)
        ((_ at-least 1) p00 p01 p02)
        ((_ at-most 1) p10 p11 p02)
        ((_ at-least 1) p10 p11 p02)
        ((_ at-most 1) p20 p21 p02)
        ((_ at-least 1) p20 p21 p02)
        ((_ at-most 1) p30 p31 p02)
        ((_ at-least 1) p30 p31 p02)
        ((_ at-most 1) p40 p41 p02)
        ((_ at-least 1) p40 p41 p02)

        (or ; 0,1 edge
            (and p00 (not p10))
            (and p01 (not p11))
            (and p02 (not p12))
        )
        (or ; 0,2 edge
            (and p00 (not p20))
            (and p01 (not p21))
            (and p02 (not p22))
        )
        (or ; 1,2 edge
            (and p20 (not p10))
            (and p21 (not p11))
            (and p22 (not p12))
        )
        (or ; 1,3 edge
            (and p30 (not p10))
            (and p31 (not p11))
            (and p32 (not p12))
        )
        (or ; 2,3 edge
            (and p20 (not p30))
            (and p21 (not p31))
            (and p22 (not p32))
        )
        (or ; 1,4 edge
            (and p10 (not p40))
            (and p11 (not p41))
            (and p12 (not p42))
        )
        (or ; 2,4 edge
            (and p20 (not p40))
            (and p21 (not p41))
            (and p22 (not p42))
        )
    )
)
(assert conjecture)
(check-sat)
