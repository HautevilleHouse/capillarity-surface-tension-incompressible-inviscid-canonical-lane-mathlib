import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean

structure EulerFluidPackage where
  velocityField : Type u
  pressureField : Type v
  incompressibilityCondition : Prop
  inviscidMomentumEquation : Prop

structure EulerFluidEvidence (F : EulerFluidPackage) where
  incompressibilityConditionClosed : F.incompressibilityCondition
  inviscidMomentumEquationClosed : F.inviscidMomentumEquation

def EulerFluidClosed (F : EulerFluidPackage) : Prop :=
  F.incompressibilityCondition ∧ F.inviscidMomentumEquation

theorem euler_fluid_closed_from_evidence (F : EulerFluidPackage) (E : EulerFluidEvidence F) : EulerFluidClosed F :=
  And.intro E.incompressibilityConditionClosed E.inviscidMomentumEquationClosed

end CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean
end HautevilleHouse