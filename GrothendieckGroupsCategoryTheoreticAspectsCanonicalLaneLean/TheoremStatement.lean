import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean.FinalTheorem

/-!
# Theorem Statement Layer

This module internalizes the theorem-facing object for the Grothendieck Groups
Category Theoretic Aspects domain.
-/

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure GrothendieckAdmittedObject where
  category : Type u
  exactCategory : Prop
  k0Group : Type v
  k0Class : Prop
  conclusion : k0Class

def GrothendieckWitnessClosed (O : GrothendieckAdmittedObject) : Prop :=
  O.k0Class

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse
