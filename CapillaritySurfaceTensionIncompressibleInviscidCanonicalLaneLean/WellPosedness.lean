import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscid.CapillaritySurfaceTension
import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscid.EulerEquation
import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscid.FreeBoundary

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscid

structure WellPosednessPackage {C : CapillaritySurfaceTensionPackage}
    {E : EulerEquationPackage C} {F : FreeBoundaryPackage E} where
  localExistence : Prop
  uniqueness : Prop
  continuousDependence : Prop

structure WellPosednessEvidence {C : CapillaritySurfaceTensionPackage}
    {E : EulerEquationPackage C} {F : FreeBoundaryPackage E}
    (W : WellPosednessPackage F) where
  localExistenceClosed : W.localExistence
  uniquenessClosed : W.uniqueness
  continuousDependenceClosed : W.continuousDependence

def WellPosednessClosed {C : CapillaritySurfaceTensionPackage}
    {E : EulerEquationPackage C} {F : FreeBoundaryPackage E}
    (W : WellPosednessPackage F) : Prop :=
  W.localExistence ∧ W.uniqueness ∧ W.continuousDependence

theorem well_posedness_closed_from_evidence {C : CapillaritySurfaceTensionPackage}
    {E : EulerEquationPackage C} {F : FreeBoundaryPackage E}
    (W : WellPosednessPackage F) (Ev : WellPosednessEvidence W) : WellPosednessClosed W := by
  exact And.intro Ev.localExistenceClosed (And.intro Ev.uniquenessClosed Ev.continuousDependenceClosed)

end CapillaritySurfaceTensionIncompressibleInviscid
end HautevilleHouse