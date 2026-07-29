import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure ExactSequencePackage where
  category : Type u
  sequence : Type v
  kernel : Prop
  cokernel : Prop
  exactness : Prop
  longExactSequence : Prop

structure ExactSequenceEvidence (E : ExactSequencePackage) where
  kernelClosed : E.kernel
  cokernelClosed : E.cokernel
  exactnessClosed : E.exactness
  longExactSequenceClosed : E.longExactSequence

def ExactSequenceClosed (E : ExactSequencePackage) : Prop :=
  E.kernel ∧ E.cokernel ∧ E.exactness ∧ E.longExactSequence

theorem exact_sequence_closed_from_evidence (E : ExactSequencePackage)
    (Ev : ExactSequenceEvidence E) : ExactSequenceClosed E := by
  exact And.intro Ev.kernelClosed (And.intro Ev.cokernelClosed (And.intro Ev.exactnessClosed Ev.longExactSequenceClosed))

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse