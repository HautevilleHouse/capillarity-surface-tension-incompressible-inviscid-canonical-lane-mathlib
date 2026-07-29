import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean.YoungLaplaceEquation
import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean.ContactAngleModel

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean

structure CapillaryRiseSolutionPackage {σ : SurfaceTensionModel}
    {Y : YoungLaplaceEquationPackage σ} {θ : ContactAngleModel} where
  tubeRadius : ℝ
  liquidDensity : ℝ
  gravitationalAcceleration : ℝ
  riseHeight : ℝ
  youngLaplaceSolution : Prop
  contactAngleApplied : θ.contactAngleLaw
  solutionConsistent : riseHeight = (2 * σ.surfaceTensionCoefficient * Real.cos θ.contactAngle) /
    (liquidDensity * gravitationalAcceleration * tubeRadius)
  solutionConsistentTerm : solutionConsistent

structure CapillaryRiseSolutionEvidence {σ : SurfaceTensionModel}
    {Y : YoungLaplaceEquationPackage σ} {θ : ContactAngleModel}
    (C : CapillaryRiseSolutionPackage σ Y θ) where
  youngLaplaceSolutionClosed : C.youngLaplaceSolution
  contactAngleAppliedClosed : C.contactAngleApplied
  solutionConsistentClosed : C.solutionConsistent

def CapillaryRiseSolutionClosed {σ : SurfaceTensionModel}
    {Y : YoungLaplaceEquationPackage σ} {θ : ContactAngleModel}
    (C : CapillaryRiseSolutionPackage σ Y θ) : Prop :=
  C.youngLaplaceSolution ∧ C.contactAngleApplied ∧ C.solutionConsistent

theorem capillary_rise_solution_closed_from_evidence
    {σ : SurfaceTensionModel} {Y : YoungLaplaceEquationPackage σ}
    {θ : ContactAngleModel} (C : CapillaryRiseSolutionPackage σ Y θ)
    (E : CapillaryRiseSolutionEvidence C) : CapillaryRiseSolutionClosed C := by
  exact And.intro E.youngLaplaceSolutionClosed
    (And.intro E.contactAngleAppliedClosed E.solutionConsistentClosed)

end CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean
end HautevilleHouse