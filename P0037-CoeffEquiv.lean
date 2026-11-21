import Mathlib

/-! On the port target `Polynomial R` is an abbreviation for `AddMonoidAlgebra R ℕ` and the constant
`Polynomial.coeff` no longer exists; `p.coeff` is `AddMonoidAlgebra.coeff p`. These checks confirm
that the restated M083449 uses Mathlib's polynomial coefficient. -/

example {K : Type} [Semiring K] (p : Polynomial K) (a : ℕ) :
    AddMonoidAlgebra.coeff p a = p.coeff a := rfl

example {K : Type} [Semiring K] (x : K) (n a : ℕ) :
    AddMonoidAlgebra.coeff (Polynomial.monomial n x) a = if n = a then x else 0 :=
  Polynomial.coeff_monomial_apply
