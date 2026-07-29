import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean.SurfaceTensionModel

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean

structure ContactAngleModel where
  contactAngle : ℝ
  wettingProperty : Prop
  youngEquation : Prop
  contactAngleLaw : contactAngle = Real.acos (someSurfaceEnergy / anotherSurfaceEnergy)
  contactAngleLawTerm : contactAngleLaw

structure ContactAngleEvidence (θ : ContactAngleModel) where
  wettingPropertyClosed : θ.wettingProperty
  youngEquationClosed : θ.youngEquation
  contactAngleLawClosed : θ.contactAngleLaw

def ContactAngleModelClosed (θ : ContactAngleModel) : Prop :=
  θ.wettingProperty ∧ θ.youngEquation ∧ θ.contactAngleLaw

theorem contact_angle_model_closed_from_evidence (θ : ContactAngleModel)
    (E : ContactAngleEvidence θ) : ContactAngleModelClosed θ := by
  exact And.intro E.wettingPropertyClosed
    (And.intro E.youngEquationClosed E.contactAngleLawClosed)

end CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean
end HautevilleHouse