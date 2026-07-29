import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure GrothendieckSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure GrothendieckAdmittedObject where
  category : GrothendieckSpace
  additive : Prop
  k0Group : Prop
  conclusion : k0Group

structure GrothendieckEndgameState where
  object : GrothendieckAdmittedObject

def GrothendieckWitnessClosed (O : GrothendieckAdmittedObject) : Prop :=
  O.k0Group

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse