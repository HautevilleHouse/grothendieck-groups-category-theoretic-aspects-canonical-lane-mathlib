import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

/-!
# Grothendieck Group Construction Package

This module defines the categorical Grothendieck group construction for an
exact category or a triangulated category. The key ingredients are the
set of isomorphism classes of objects, the short exact sequences (or
distinguished triangles), and the relation that defines the group.
-/

structure GrothendieckGroupData where
  objClass : Type u
  shortExactSequences : objClass → objClass → objClass → Prop
  directSum : objClass → objClass → objClass
  zeroObject : objClass
  zeroObjectExact : shortExactSequences zeroObject zeroObject zeroObject
  directSumAssociativity : ∀ A B C : objClass, directSum (directSum A B) C = directSum A (directSum B C)
  directSumCommutativity : ∀ A B : objClass, directSum A B = directSum B A

structure GrothendieckGroup (D : GrothendieckGroupData) where
  carrier : Type v
  addition : carrier → carrier → carrier
  zero : carrier
  neg : carrier → carrier
  addCommGroup : AddCommGroup carrier
  imageOfObject : D.objClass → carrier
  relationRespected : ∀ A B C : D.objClass, D.shortExactSequences A B C →
    imageOfObject A + imageOfObject C = imageOfObject B

structure GrothendieckGroupEvidence (D : GrothendieckGroupData) (G : GrothendieckGroup D) where
  additionClosed : ∀ x y : G.carrier, x + y = G.addition x y
  zeroClosed : G.zero = (0 : G.carrier)
  negClosed : ∀ x : G.carrier, G.neg x = -x
  imageOfObjectClosed : ∀ A : D.objClass, G.imageOfObject A ∈ G.carrier
  relationRespectedClosed : ∀ A B C : D.objClass, D.shortExactSequences A B C →
    G.imageOfObject A + G.imageOfObject C = G.imageOfObject B

def GrothendieckGroupClosed (D : GrothendieckGroupData) (G : GrothendieckGroup D) : Prop :=
  (∀ x y : G.carrier, x + y = G.addition x y) ∧
  (G.zero = (0 : G.carrier)) ∧
  (∀ x : G.carrier, G.neg x = -x) ∧
  (∀ A : D.objClass, G.imageOfObject A ∈ G.carrier) ∧
  (∀ A B C : D.objClass, D.shortExactSequences A B C →
    G.imageOfObject A + G.imageOfObject C = G.imageOfObject B)

theorem grothendieck_group_closed_from_evidence (D : GrothendieckGroupData)
    (G : GrothendieckGroup D) (E : GrothendieckGroupEvidence D G) :
    GrothendieckGroupClosed D G := by
  exact And.intro E.additionClosed
    (And.intro E.zeroClosed
      (And.intro E.negClosed
        (And.intro E.imageOfObjectClosed E.relationRespectedClosed)))

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse