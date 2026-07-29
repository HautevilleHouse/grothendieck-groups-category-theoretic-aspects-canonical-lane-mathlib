import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean

structure CategoryPackage where
  objects : Type u
  morphisms : objects → objects → Type v
  identity : ∀ (X : objects), morphisms X X
  composition : ∀ {X Y Z : objects}, morphisms X Y → morphisms Y Z → morphisms X Z
  idLeft : ∀ {X Y : objects} (f : morphisms X Y), composition (identity X) f = f
  idRight : ∀ {X Y : objects} (f : morphisms X Y), composition f (identity Y) = f
  associativity : ∀ {W X Y Z : objects} (f : morphisms W X) (g : morphisms X Y) (h : morphisms Y Z),
    composition (composition f g) h = composition f (composition g h)

structure CategoryEvidence (C : CategoryPackage) where
  objectsClosed : True
  morphismsClosed : True
  identityClosed : True
  compositionClosed : True
  idLeftClosed : C.idLeft
  idRightClosed : C.idRight
  associativityClosed : C.associativity

def CategoryClosed (C : CategoryPackage) : Prop :=
  (∀ {X Y : objects C} (f : morphisms C X Y), composition C (identity C X) f = f) ∧
  (∀ {X Y : objects C} (f : morphisms C X Y), composition C f (identity C Y) = f) ∧
  (∀ {W X Y Z : objects C} (f : morphisms C W X) (g : morphisms C X Y) (h : morphisms C Y Z),
    composition C (composition C f g) h = composition C f (composition C g h))

theorem category_closed_from_evidence (C : CategoryPackage) (E : CategoryEvidence C) : CategoryClosed C := by
  exact And.intro E.idLeftClosed (And.intro E.idRightClosed E.associativityClosed)

end GrothendieckGroupsCategoryTheoreticAspectsCanonicalLaneLean
end HautevilleHouse