(declare-const p bool)
(declare-const q bool)
(declare-const r bool)

(define-fun conjecture () Bool
    (and
        (or q (not r))
        (or (not p) r)
        (or (not q) r p)
        (or p q (not q))
        (or (not r) q)
    )
)

(define-fun conjecture2 () Bool
    (and
        (or q (not r))
        (or (not p) r)
        (or (not q) r p)
        (or p q (not q))
        (or (not r) q)

        (or q (not p))
        (or r (not r) p)
        (or p q (not r))
        (or (not q) r)
        (or q (not q) r)
        (or (not q) q)
        (or (not r) r)
        (or p (not p) r)
        (or q r (not r))
        (or p q (not p))
        (or p q r (not q))
        (or p q r (not r))
        (or p q r (not p))
        (or (not p) q r)
        (or q r (not r))
    )
)
(define-fun equivalence () Bool
    (iff conjecture conjecture2)
)
(assert conjecture)
(check-sat)
(assert (not equivalence)); Expected unsat if formulas are equivalent
(check-sat)

