import CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean

structure FreeBoundaryPDEPackage where
  freeSurface : Type u
  meanCurvature : freeSurface → ℝ
  pressureJump : freeSurface → ℝ
  laplacianCondition : freeSurface → Prop
  surfaceTensionCoefficient : ℝ
  velocityField : Type v
  incompressibilityCondition : Prop
  inviscidCondition : Prop

structure FreeBoundaryPDEEvidence (P : FreeBoundaryPDEPackage) where
  meanCurvatureDetermined : P.meanCurvature = P.surfaceTensionCoefficient * P.pressureJump
  laplacianConditionClosed : P.laplacianCondition P.freeSurface
  incompressibilityClosed : P.incompressibilityCondition
  inviscidClosed : P.inviscidCondition

def FreeBoundaryPDEClosed (P : FreeBoundaryPDEPackage) : Prop :=
  (P.meanCurvature = P.surfaceTensionCoefficient * P.pressureJump) ∧
  P.laplacianCondition P.freeSurface ∧
  P.incompressibilityCondition ∧
  P.inviscidCondition

theorem free_boundary_pde_closed_from_evidence (P : FreeBoundaryPDEPackage)
    (E : FreeBoundaryPDEEvidence P) : FreeBoundaryPDEClosed P := by
  exact And.intro E.meanCurvatureDetermined
    (And.intro E.laplacianConditionClosed
      (And.intro E.incompressibilityClosed E.inviscidClosed))

end CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean
end HautevilleHouse