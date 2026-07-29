import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure GrothendieckGroupUniversalConstruction where
  category : Type u
  exactCategoryStructure : Prop
  weakEquivalences : Prop
  quotientByWeakEquivalences : Prop
  universalProperty : Prop
  groupStructure : Prop
  exactCategoryStructureTerm : exactCategoryStructure
  weakEquivalencesTerm : weakEquivalences
  quotientByWeakEquivalencesTerm : quotientByWeakEquivalences
  universalPropertyTerm : universalProperty
  groupStructureTerm : groupStructure

structure GrothendieckGroupUniversalConstructionEvidence (G : GrothendieckGroupUniversalConstruction) where
  exactCategoryStructureClosed : G.exactCategoryStructure
  weakEquivalencesClosed : G.weakEquivalences
  quotientByWeakEquivalencesClosed : G.quotientByWeakEquivalences
  universalPropertyClosed : G.universalProperty
  groupStructureClosed : G.groupStructure

def GrothendieckGroupUniversalConstructionClosed (G : GrothendieckGroupUniversalConstruction) : Prop :=
  G.exactCategoryStructure ∧ G.weakEquivalences ∧ G.quotientByWeakEquivalences ∧ G.universalProperty ∧ G.groupStructure

theorem grothendieck_group_universal_construction_closed_from_evidence
    (G : GrothendieckGroupUniversalConstruction) (E : GrothendieckGroupUniversalConstructionEvidence G) :
    GrothendieckGroupUniversalConstructionClosed G := by
  exact And.intro E.exactCategoryStructureClosed
    (And.intro E.weakEquivalencesClosed
      (And.intro E.quotientByWeakEquivalencesClosed
        (And.intro E.universalPropertyClosed E.groupStructureClosed)))

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse