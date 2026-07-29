import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GrothendieckWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse