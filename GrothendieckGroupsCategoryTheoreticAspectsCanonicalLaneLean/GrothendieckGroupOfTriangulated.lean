import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

/-!
# Grothendieck Group of a Triangulated Category Package

This module specializes the Grothendieck group construction to triangulated
categories, where distinguished triangles replace short exact sequences.
-/

structure TriangulatedCategoryData where
  objClass : Type u
  distinguishedTriangles : objClass → objClass → objClass → Prop
  shift : objClass → objClass
  zeroObject : objClass
  zeroTriangle : distinguishedTriangles zeroObject zeroObject zeroObject
  rotationAxiom : ∀ X Y Z : objClass, distinguishedTriangles X Y Z → distinguishedTriangles Y Z (shift X)

structure TriangulatedGrothendieckGroup (T : TriangulatedCategoryData) where
  carrier : Type v
  addition : carrier → carrier → carrier
  zero : carrier
  neg : carrier → carrier
  addCommGroup : AddCommGroup carrier
  imageOfObject : T.objClass → carrier
  triangleRelation : ∀ X Y Z : T.objClass, T.distinguishedTriangles X Y Z →
    imageOfObject X + imageOfObject Z = imageOfObject Y
  shiftInvariance : ∀ X : T.objClass, imageOfObject (T.shift X) = -imageOfObject X

structure TriangulatedGrothendieckGroupEvidence (T : TriangulatedCategoryData)
    (G : TriangulatedGrothendieckGroup T) where
  additionClosed : ∀ x y : G.carrier, x + y = G.addition x y
  zeroClosed : G.zero = (0 : G.carrier)
  negClosed : ∀ x : G.carrier, G.neg x = -x
  triangleRelationClosed : ∀ X Y Z : T.objClass, T.distinguishedTriangles X Y Z →
    G.imageOfObject X + G.imageOfObject Z = G.imageOfObject Y
  shiftInvarianceClosed : ∀ X : T.objClass, G.imageOfObject (T.shift X) = -G.imageOfObject X

def TriangulatedGrothendieckGroupClosed (T : TriangulatedCategoryData)
    (G : TriangulatedGrothendieckGroup T) : Prop :=
  (∀ x y : G.carrier, x + y = G.addition x y) ∧
  (G.zero = (0 : G.carrier)) ∧
  (∀ x : G.carrier, G.neg x = -x) ∧
  (∀ X Y Z : T.objClass, T.distinguishedTriangles X Y Z →
    G.imageOfObject X + G.imageOfObject Z = G.imageOfObject Y) ∧
  (∀ X : T.objClass, G.imageOfObject (T.shift X) = -G.imageOfObject X)

theorem triangulated_grothendieck_group_closed_from_evidence
    (T : TriangulatedCategoryData) (G : TriangulatedGrothendieckGroup T)
    (E : TriangulatedGrothendieckGroupEvidence T G) :
    TriangulatedGrothendieckGroupClosed T G := by
  exact And.intro E.additionClosed
    (And.intro E.zeroClosed
      (And.intro E.negClosed
        (And.intro E.triangleRelationClosed E.shiftInvarianceClosed)))

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse