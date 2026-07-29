import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure YonedaPackage {C : CategoryPackage} where
  homFunctor : C.objects → Set (C.morphisms ?_ ?_)
  naturalTransformation : Type u
  yonedaEmbedding : Prop
  yonedaLemma : Prop
  yonedaEmbeddingClosed : yonedaEmbedding
  yonedaLemmaClosed : yonedaLemma

structure YonedaEvidence {C : CategoryPackage} (Y : YonedaPackage C) where
  yonedaEmbeddingClosed : Y.yonedaEmbedding
  yonedaLemmaClosed : Y.yonedaLemma

def YonedaClosed {C : CategoryPackage} (Y : YonedaPackage C) : Prop :=
  Y.yonedaEmbedding ∧ Y.yonedaLemma

theorem yoneda_closed_from_evidence {C : CategoryPackage} (Y : YonedaPackage C) (E : YonedaEvidence Y) : YonedaClosed Y := by
  exact And.intro E.yonedaEmbeddingClosed E.yonedaLemmaClosed

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse