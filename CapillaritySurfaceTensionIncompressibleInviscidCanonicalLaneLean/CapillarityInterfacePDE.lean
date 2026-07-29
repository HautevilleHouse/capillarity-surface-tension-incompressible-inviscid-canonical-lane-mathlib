import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscid

structure CapillarityInterfacePDEPackage (G : InterfacialCurvaturePackage) where
  timeParameter : Type u
  surfaceMetric : timeParameter -> Type v
  initialSurfaceConfig : Prop
  meanCurvatureFlowEquation : Prop
  capillarityEquation : Prop
  maximalTimeInterval : Prop
  surfaceTensionCoefficient : ℝ

structure CapillarityInterfacePDEEvidence {G : InterfacialCurvaturePackage}
    (F : CapillarityInterfacePDEPackage G) where
  initialSurfaceConfigClosed : F.initialSurfaceConfig
  meanCurvatureFlowEquationClosed : F.meanCurvatureFlowEquation
  capillarityEquationClosed : F.capillarityEquation
  maximalTimeIntervalClosed : F.maximalTimeInterval

def CapillarityInterfacePDEClosed {G : InterfacialCurvaturePackage}
    (F : CapillarityInterfacePDEPackage G) : Prop :=
  F.initialSurfaceConfig ∧ F.meanCurvatureFlowEquation ∧ F.capillarityEquation ∧ F.maximalTimeInterval

theorem capillarity_interface_pde_closed_from_evidence
    {G : InterfacialCurvaturePackage} (F : CapillarityInterfacePDEPackage G)
    (E : CapillarityInterfacePDEEvidence F) : CapillarityInterfacePDEClosed F := by
  exact And.intro E.initialSurfaceConfigClosed
    (And.intro E.meanCurvatureFlowEquationClosed
      (And.intro E.capillarityEquationClosed E.maximalTimeIntervalClosed))

end CapillaritySurfaceTensionIncompressibleInviscid
end HautevilleHouse