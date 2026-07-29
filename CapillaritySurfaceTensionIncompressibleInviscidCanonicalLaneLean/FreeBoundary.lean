import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscid.CapillaritySurfaceTension
import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscid.EulerEquation

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscid

structure FreeBoundaryPackage {C : CapillaritySurfaceTensionPackage}
    {E : EulerEquationPackage C} where
  interfacePosition : Type u
  kinematicCondition : Prop
  dynamicCondition : Prop
  contactAngle : Prop

structure FreeBoundaryEvidence {C : CapillaritySurfaceTensionPackage}
    {E : EulerEquationPackage C} (F : FreeBoundaryPackage E) where
  kinematicConditionClosed : F.kinematicCondition
  dynamicConditionClosed : F.dynamicCondition
  contactAngleClosed : F.contactAngle

def FreeBoundaryClosed {C : CapillaritySurfaceTensionPackage}
    {E : EulerEquationPackage C} (F : FreeBoundaryPackage E) : Prop :=
  F.kinematicCondition ∧ F.dynamicCondition ∧ F.contactAngle

theorem free_boundary_closed_from_evidence {C : CapillaritySurfaceTensionPackage}
    {E : EulerEquationPackage C} (F : FreeBoundaryPackage E) (Ev : FreeBoundaryEvidence F) :
    FreeBoundaryClosed F := by
  exact And.intro Ev.kinematicConditionClosed (And.intro Ev.dynamicConditionClosed Ev.contactAngleClosed)

end CapillaritySurfaceTensionIncompressibleInviscid
end HautevilleHouse