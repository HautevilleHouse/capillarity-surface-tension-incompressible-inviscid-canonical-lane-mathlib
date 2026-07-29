import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscid

structure CapillaritySurfaceTensionPackage where
  surfaceTension : Type u
  interfaceCurvature : Type v
  youngLaplaceEquation : Prop
  surfaceTensionPositive : Prop
  interfaceSmooth : Prop

structure CapillaritySurfaceTensionEvidence (C : CapillaritySurfaceTensionPackage) where
  youngLaplaceEquationClosed : C.youngLaplaceEquation
  surfaceTensionPositiveClosed : C.surfaceTensionPositive
  interfaceSmoothClosed : C.interfaceSmooth

def CapillaritySurfaceTensionClosed (C : CapillaritySurfaceTensionPackage) : Prop :=
  C.youngLaplaceEquation ∧ C.surfaceTensionPositive ∧ C.interfaceSmooth

theorem capillarity_surface_tension_closed_from_evidence (C : CapillaritySurfaceTensionPackage)
    (E : CapillaritySurfaceTensionEvidence C) : CapillaritySurfaceTensionClosed C := by
  exact And.intro E.youngLaplaceEquationClosed (And.intro E.surfaceTensionPositiveClosed E.interfaceSmoothClosed)

end CapillaritySurfaceTensionIncompressibleInviscid
end HautevilleHouse