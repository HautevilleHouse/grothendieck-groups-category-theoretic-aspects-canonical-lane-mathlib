import GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure ExactSequencePackage where
  category : Type u
  objects : Type v
  morphisms : Type w
  kernel : Prop
  image : Prop
  exactnessCondition : kernel ∧ image

structure ExactSequenceEvidence (E : ExactSequencePackage) where
  kernelClosed : E.kernel
  imageClosed : E.image
  exactnessClosed : E.exactnessCondition

def ExactSequenceClosed (E : ExactSequencePackage) : Prop :=
  E.kernel ∧ E.image ∧ E.exactnessCondition

theorem exact_sequence_closed_from_evidence (E : ExactSequencePackage) (Ev : ExactSequenceEvidence E) :
    ExactSequenceClosed E := by
  exact And.intro Ev.kernelClosed (And.intro Ev.imageClosed Ev.exactnessClosed)

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse