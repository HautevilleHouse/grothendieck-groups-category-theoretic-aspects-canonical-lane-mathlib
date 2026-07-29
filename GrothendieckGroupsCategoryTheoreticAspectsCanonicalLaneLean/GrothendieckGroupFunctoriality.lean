import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

/-!
# Grothendieck Group Functoriality Package

This module defines the functoriality of the Grothendieck group construction:
an exact functor between exact categories induces a group homomorphism between
their Grothendieck groups.
-/

structure ExactFunctor (D1 D2 : GrothendieckGroupData) where
  objMap : D1.objClass → D2.objClass
  exactPreserving : ∀ A B C : D1.objClass, D1.shortExactSequences A B C →
    D2.shortExactSequences (objMap A) (objMap B) (objMap C)
  directSumPreserving : ∀ A B : D1.objClass, objMap (D1.directSum A B) = D2.directSum (objMap A) (objMap B)
  zeroPreserving : objMap D1.zeroObject = D2.zeroObject

structure InducedHomomorphism (D1 D2 : GrothendieckGroupData) (G1 : GrothendieckGroup D1)
    (G2 : GrothendieckGroup D2) (F : ExactFunctor D1 D2) where
  hom : G1.carrier → G2.carrier
  addCommGroupHom : AddCommGroupHom G1.carrier G2.carrier
  homConsistent : ∀ A : D1.objClass, hom (G1.imageOfObject A) = G2.imageOfObject (F.objMap A)

structure InducedHomomorphismEvidence (D1 D2 : GrothendieckGroupData)
    (G1 : GrothendieckGroup D1) (G2 : GrothendieckGroup D2) (F : ExactFunctor D1 D2)
    (H : InducedHomomorphism D1 D2 G1 G2 F) where
  homClosed : ∀ x : G1.carrier, H.hom x = H.addCommGroupHom x
  homConsistentClosed : ∀ A : D1.objClass, H.hom (G1.imageOfObject A) = G2.imageOfObject (F.objMap A)

def InducedHomomorphismClosed (D1 D2 : GrothendieckGroupData)
    (G1 : GrothendieckGroup D1) (G2 : GrothendieckGroup D2) (F : ExactFunctor D1 D2)
    (H : InducedHomomorphism D1 D2 G1 G2 F) : Prop :=
  (∀ x : G1.carrier, H.hom x = H.addCommGroupHom x) ∧
  (∀ A : D1.objClass, H.hom (G1.imageOfObject A) = G2.imageOfObject (F.objMap A))

theorem induced_homomorphism_closed_from_evidence
    (D1 D2 : GrothendieckGroupData) (G1 : GrothendieckGroup D1) (G2 : GrothendieckGroup D2)
    (F : ExactFunctor D1 D2) (H : InducedHomomorphism D1 D2 G1 G2 F)
    (E : InducedHomomorphismEvidence D1 D2 G1 G2 F H) : InducedHomomorphismClosed D1 D2 G1 G2 F H := by
  exact And.intro E.homClosed E.homConsistentClosed

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse