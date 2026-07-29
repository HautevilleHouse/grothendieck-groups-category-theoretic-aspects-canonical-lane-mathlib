import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure AdjointFunctorPackage {C D : CategoryPackage} where
  leftAdjoint : C.objects → D.objects
  rightAdjoint : D.objects → C.objects
  unit : ∀ (X : C.objects), morphisms C X (rightAdjoint (leftAdjoint X))
  counit : ∀ (Y : D.objects), morphisms D (leftAdjoint (rightAdjoint Y)) Y
  triangleLeft : ∀ (X : C.objects), composition C (unit X) (rightAdjoint (counit (leftAdjoint X))) = identity C X
  triangleRight : ∀ (Y : D.objects), composition D (leftAdjoint (unit (rightAdjoint Y))) (counit Y) = identity D Y
  unitClosed : ∀ (X : C.objects), unit X = unit X
  counitClosed : ∀ (Y : D.objects), counit Y = counit Y
  triangleLeftClosed : triangleLeft
  triangleRightClosed : triangleRight

structure AdjointFunctorEvidence {C D : CategoryPackage} (A : AdjointFunctorPackage C D) where
  unitClosed : A.unitClosed
  counitClosed : A.counitClosed
  triangleLeftClosed : A.triangleLeftClosed
  triangleRightClosed : A.triangleRightClosed

def AdjointFunctorClosed {C D : CategoryPackage} (A : AdjointFunctorPackage C D) : Prop :=
  A.triangleLeft ∧ A.triangleRight

theorem adjoint_functor_closed_from_evidence {C D : CategoryPackage} (A : AdjointFunctorPackage C D)
    (E : AdjointFunctorEvidence A) : AdjointFunctorClosed A := by
  exact And.intro E.triangleLeftClosed E.triangleRightClosed

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse