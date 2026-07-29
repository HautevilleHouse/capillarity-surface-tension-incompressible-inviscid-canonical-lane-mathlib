import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean.RiemannianCurvature

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean

structure CapillarityPDEPackage (G : RiemannianCurvaturePackage) where
  timeParameter : Type u
  metricAt : timeParameter → Type v
  initialMetricMatches : Prop
  differentiableMetricFamily : Prop
  youngLaplaceEquation : Prop
  freeBoundaryCondition : Prop
  maximalTimeInterval : Prop

structure CapillarityPDEEvidence {G : RiemannianCurvaturePackage}
    (F : CapillarityPDEPackage G) where
  initialMetricMatchesClosed : F.initialMetricMatches
  differentiableMetricFamilyClosed : F.differentiableMetricFamily
  youngLaplaceEquationClosed : F.youngLaplaceEquation
  freeBoundaryConditionClosed : F.freeBoundaryCondition
  maximalTimeIntervalClosed : F.maximalTimeInterval

def CapillarityPDEClosed {G : RiemannianCurvaturePackage}
    (F : CapillarityPDEPackage G) : Prop :=
  F.initialMetricMatches ∧
  F.differentiableMetricFamily ∧
  F.youngLaplaceEquation ∧
  F.freeBoundaryCondition ∧
  F.maximalTimeInterval

theorem capillarity_pde_closed_from_evidence
    {G : RiemannianCurvaturePackage} (F : CapillarityPDEPackage G)
    (E : CapillarityPDEEvidence F) : CapillarityPDEClosed F := by
  exact And.intro E.initialMetricMatchesClosed
    (And.intro E.differentiableMetricFamilyClosed
      (And.intro E.youngLaplaceEquationClosed
        (And.intro E.freeBoundaryConditionClosed E.maximalTimeIntervalClosed)))

end CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean
end HautevilleHouse
