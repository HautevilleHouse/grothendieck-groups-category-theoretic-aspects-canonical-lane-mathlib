import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure LimitColimitClosure where
  category : Type u
  smallCategory : Type v
  diagram : smallCategory → category
  limitExists : Prop
  colimitExists : Prop
  limitUniversalProperty : Prop
  colimitUniversalProperty : Prop
  exactnessPreservation : Prop
  limitExistsTerm : limitExists
  colimitExistsTerm : colimitExists
  limitUniversalPropertyTerm : limitUniversalProperty
  colimitUniversalPropertyTerm : colimitUniversalProperty
  exactnessPreservationTerm : exactnessPreservation

structure LimitColimitClosureEvidence (L : LimitColimitClosure) where
  limitExistsClosed : L.limitExists
  colimitExistsClosed : L.colimitExists
  limitUniversalPropertyClosed : L.limitUniversalProperty
  colimitUniversalPropertyClosed : L.colimitUniversalProperty
  exactnessPreservationClosed : L.exactnessPreservation

def LimitColimitClosureClosed (L : LimitColimitClosure) : Prop :=
  L.limitExists ∧ L.colimitExists ∧ L.limitUniversalProperty ∧ L.colimitUniversalProperty ∧ L.exactnessPreservation

theorem limit_colimit_closure_closed_from_evidence
    (L : LimitColimitClosure) (E : LimitColimitClosureEvidence L) :
    LimitColimitClosureClosed L := by
  exact And.intro E.limitExistsClosed
    (And.intro E.colimitExistsClosed
      (And.intro E.limitUniversalPropertyClosed
        (And.intro E.colimitUniversalPropertyClosed E.exactnessPreservationClosed)))

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse