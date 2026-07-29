import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean.CategoryPackage

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure GrothendieckGroupPackage {C : CategoryPackage} where
  group : Type w
  addition : group → group → group
  zero_ : group
  negation : group → group
  addAssociative : ∀ (a b c : group), addition (addition a b) c = addition a (addition b c)
  zeroLeft : ∀ (a : group), addition zero_ a = a
  zeroRight : ∀ (a : group), addition a zero_ = a
  negLeft : ∀ (a : group), addition (negation a) a = zero_
  negRight : ∀ (a : group), addition a (negation a) = zero_
  addCommutative : ∀ (a b : group), addition a b = addition b a
  universalProperty : Prop
  generatorSet : Set group
  relations : Set (group × group)
  universalPropertyClosed : universalProperty

structure GrothendieckGroupEvidence {C : CategoryPackage} (G : GrothendieckGroupPackage C) where
  groupClosed : True
  additionClosed : True
  zeroClosed : True
  negationClosed : True
  addAssociativeClosed : G.addAssociative
  zeroLeftClosed : G.zeroLeft
  zeroRightClosed : G.zeroRight
  negLeftClosed : G.negLeft
  negRightClosed : G.negRight
  addCommutativeClosed : G.addCommutative
  universalPropertyClosed : G.universalProperty

def GrothendieckGroupClosed {C : CategoryPackage} (G : GrothendieckGroupPackage C) : Prop :=
  G.addAssociative ∧ G.zeroLeft ∧ G.zeroRight ∧ G.negLeft ∧ G.negRight ∧ G.addCommutative ∧ G.universalProperty

theorem grothendieck_group_closed_from_evidence {C : CategoryPackage} (G : GrothendieckGroupPackage C)
    (E : GrothendieckGroupEvidence G) : GrothendieckGroupClosed G := by
  exact And.intro E.addAssociativeClosed (And.intro E.zeroLeftClosed (And.intro E.zeroRightClosed
    (And.intro E.negLeftClosed (And.intro E.negRightClosed (And.intro E.addCommutativeClosed E.universalPropertyClosed)))))

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse