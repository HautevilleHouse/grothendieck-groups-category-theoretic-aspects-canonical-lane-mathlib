import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure ExactCategoryAdmissibleClass where
  category : Type u
  exactCategoryStructure : Prop
  admissibleMonomorphisms : Prop
  admissibleEpimorphisms : Prop
  shortExactSequences : Prop
  exactCategoryStructureTerm : exactCategoryStructure
  admissibleMonomorphismsTerm : admissibleMonomorphisms
  admissibleEpimorphismsTerm : admissibleEpimorphisms
  shortExactSequencesTerm : shortExactSequences

structure ExactCategoryAdmissibleClassEvidence (E : ExactCategoryAdmissibleClass) where
  exactCategoryStructureClosed : E.exactCategoryStructure
  admissibleMonomorphismsClosed : E.admissibleMonomorphisms
  admissibleEpimorphismsClosed : E.admissibleEpimorphisms
  shortExactSequencesClosed : E.shortExactSequences

def ExactCategoryAdmissibleClassClosed (E : ExactCategoryAdmissibleClass) : Prop :=
  E.exactCategoryStructure ∧ E.admissibleMonomorphisms ∧ E.admissibleEpimorphisms ∧ E.shortExactSequences

theorem exact_category_admissible_class_closed_from_evidence
    (E : ExactCategoryAdmissibleClass) (Ev : ExactCategoryAdmissibleClassEvidence E) :
    ExactCategoryAdmissibleClassClosed E := by
  exact And.intro Ev.exactCategoryStructureClosed
    (And.intro Ev.admissibleMonomorphismsClosed
      (And.intro Ev.admissibleEpimorphismsClosed Ev.shortExactSequencesClosed))

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse