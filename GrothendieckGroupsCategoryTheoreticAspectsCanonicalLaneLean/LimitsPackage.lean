import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure LimitPackage {C : CategoryPackage} where
  diagram : Type u → Type v
  cone : Type w
  universalCone : cone
  universalProperty : ∀ (c : cone), ∃! (f : morphisms C ?_ ?_), ...
  limitExists : Prop
  limitUniqueness : Prop
  limitExistsClosed : limitExists
  limitUniquenessClosed : limitUniqueness

structure LimitEvidence {C : CategoryPackage} (L : LimitPackage C) where
  limitExistsClosed : L.limitExists
  limitUniquenessClosed : L.limitUniqueness

def LimitClosed {C : CategoryPackage} (L : LimitPackage C) : Prop :=
  L.limitExists ∧ L.limitUniqueness

theorem limit_closed_from_evidence {C : CategoryPackage} (L : LimitPackage C) (E : LimitEvidence L) : LimitClosed L := by
  exact And.intro E.limitExistsClosed E.limitUniquenessClosed

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse