import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean

structure SurfaceTensionModel where
  surfaceTensionCoefficient : ℝ
  temperatureDependence : Prop
  surfactantEffect : Prop
  surfaceTensionPositive : surfaceTensionCoefficient > 0

structure SurfaceTensionEvidence (M : SurfaceTensionModel) where
  temperatureDependenceClosed : M.temperatureDependence
  surfactantEffectClosed : M.surfactantEffect
  surfaceTensionPositiveClosed : M.surfaceTensionPositive

def SurfaceTensionModelClosed (M : SurfaceTensionModel) : Prop :=
  M.temperatureDependence ∧ M.surfactantEffect ∧ M.surfaceTensionPositive

theorem surface_tension_model_closed_from_evidence (M : SurfaceTensionModel)
    (E : SurfaceTensionEvidence M) : SurfaceTensionModelClosed M := by
  exact And.intro E.temperatureDependenceClosed
    (And.intro E.surfactantEffectClosed E.surfaceTensionPositiveClosed)

end CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean
end HautevilleHouse