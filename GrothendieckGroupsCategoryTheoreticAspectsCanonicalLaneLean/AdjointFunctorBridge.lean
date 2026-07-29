import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure AdjointFunctorBridge where
  categoryC : Type u
  categoryD : Type u
  functorF : categoryC → categoryD
  functorG : categoryD → categoryC
  adjunctionData : Prop
  unitNaturalTransformation : Prop
  counitNaturalTransformation : Prop
  triangleIdentities : Prop
  preservesExactness : Prop
  adjunctionDataTerm : adjunctionData
  unitNaturalTransformationTerm : unitNaturalTransformation
  counitNaturalTransformationTerm : counitNaturalTransformation
  triangleIdentitiesTerm : triangleIdentities
  preservesExactnessTerm : preservesExactness

structure AdjointFunctorBridgeEvidence (A : AdjointFunctorBridge) where
  adjunctionDataClosed : A.adjunctionData
  unitNaturalTransformationClosed : A.unitNaturalTransformation
  counitNaturalTransformationClosed : A.counitNaturalTransformation
  triangleIdentitiesClosed : A.triangleIdentities
  preservesExactnessClosed : A.preservesExactness

def AdjointFunctorBridgeClosed (A : AdjointFunctorBridge) : Prop :=
  A.adjunctionData ∧ A.unitNaturalTransformation ∧ A.counitNaturalTransformation ∧ A.triangleIdentities ∧ A.preservesExactness

theorem adjoint_functor_bridge_closed_from_evidence
    (A : AdjointFunctorBridge) (E : AdjointFunctorBridgeEvidence A) :
    AdjointFunctorBridgeClosed A := by
  exact And.intro E.adjunctionDataClosed
    (And.intro E.unitNaturalTransformationClosed
      (And.intro E.counitNaturalTransformationClosed
        (And.intro E.triangleIdentitiesClosed E.preservesExactnessClosed)))

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse