import Mathlib
open NumberField

/-- On the target Mathlib, `IsFullLattice` over `𝓞 E ⊆ E` is exactly the pinned Mathlib's
`IsLattice` (`fg` and `span_eq_top`). -/
example {E V : Type*} [Field E] [NumberField E] [AddCommGroup V] [Module E V] [Module (𝓞 E) V]
    [IsScalarTower (𝓞 E) E V] (Λ : Submodule (𝓞 E) V) :
    Submodule.IsFullLattice E Λ ↔ Λ.FG ∧ Submodule.span E (Λ : Set V) = ⊤ :=
  ⟨fun h => ⟨Submodule.IsLattice.fg E Λ, h.span_eq_top⟩,
   fun h => { toIsLattice := Submodule.IsLattice.of_fg E h.1, span_eq_top := h.2 }⟩
