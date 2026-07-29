import GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean.ExactSequences

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure UniversalPropertyPackage where
  grothendieckGroup : Type u
  additiveFunctor : Type v
  universalProperty : Prop
  uniqueFactorization : Prop

structure UniversalPropertyEvidence (U : UniversalPropertyPackage) where
  universalPropertyClosed : U.universalProperty
  uniqueFactorizationClosed : U.uniqueFactorization

def UniversalPropertyClosed (U : UniversalPropertyPackage) : Prop :=
  U.universalProperty ∧ U.uniqueFactorization

theorem universal_property_closed_from_evidence (U : UniversalPropertyPackage) (Ev : UniversalPropertyEvidence U) :
    UniversalPropertyClosed U := by
  exact And.intro Ev.universalPropertyClosed Ev.uniqueFactorizationClosed

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse