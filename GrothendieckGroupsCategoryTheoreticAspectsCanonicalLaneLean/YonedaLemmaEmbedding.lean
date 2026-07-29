import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure YonedaLemmaEmbedding where
  category : Type u
  presheafCategory : Type v
  yonedaEmbedding : category → presheafCategory
  fullyFaithful : Prop
  naturalityProperty : Prop
  preservationOfLimits : Prop
  fullyFaithfulTerm : fullyFaithful
  naturalityPropertyTerm : naturalityProperty
  preservationOfLimitsTerm : preservationOfLimits

structure YonedaLemmaEmbeddingEvidence (Y : YonedaLemmaEmbedding) where
  fullyFaithfulClosed : Y.fullyFaithful
  naturalityPropertyClosed : Y.naturalityProperty
  preservationOfLimitsClosed : Y.preservationOfLimits

def YonedaLemmaEmbeddingClosed (Y : YonedaLemmaEmbedding) : Prop :=
  Y.fullyFaithful ∧ Y.naturalityProperty ∧ Y.preservationOfLimits

theorem yoneda_lemma_embedding_closed_from_evidence
    (Y : YonedaLemmaEmbedding) (E : YonedaLemmaEmbeddingEvidence Y) :
    YonedaLemmaEmbeddingClosed Y := by
  exact And.intro E.fullyFaithfulClosed
    (And.intro E.naturalityPropertyClosed E.preservationOfLimitsClosed)

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse