import GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean.UniversalProperty

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure ChainComplexCategoryPackage where
  objects : Type u
  morphisms : Type v
  homologyFunctors : Type w
  exactSequences : Prop
  grothendieckGroupComputed : Prop

structure ChainComplexCategoryEvidence (C : ChainComplexCategoryPackage) where
  exactSequencesClosed : C.exactSequences
  grothendieckGroupComputedClosed : C.grothendieckGroupComputed

def ChainComplexCategoryClosed (C : ChainComplexCategoryPackage) : Prop :=
  C.exactSequences ∧ C.grothendieckGroupComputed

theorem chain_complex_category_closed_from_evidence
    (C : ChainComplexCategoryPackage) (Ev : ChainComplexCategoryEvidence C) :
    ChainComplexCategoryClosed C := by
  exact And.intro Ev.exactSequencesClosed Ev.grothendieckGroupComputedClosed

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse