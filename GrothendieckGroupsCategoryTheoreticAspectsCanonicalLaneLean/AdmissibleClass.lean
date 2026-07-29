import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure GrothendieckAdmittedObject where
  category : Type u
  abelianCategory : Prop
  exactSequence : Type v
  grothendieckGroup : Type w
  grothendieckGroupIsAbelianGroup : Prop
  conclusion : grothendieckGroupIsAbelianGroup

def grothendieckWitnessClosed (O : GrothendieckAdmittedObject) : Prop :=
  O.grothendieckGroupIsAbelianGroup

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse