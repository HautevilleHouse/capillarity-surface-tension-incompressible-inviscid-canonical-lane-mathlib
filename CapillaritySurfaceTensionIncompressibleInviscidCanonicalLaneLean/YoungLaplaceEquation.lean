import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean

structure YoungLaplaceEquationPackage where
  pressureJumpField : Type u
  meanCurvatureField : Type v
  surfaceTensionCoefficient : Type w
  pressureJumpDefined : Prop
  meanCurvatureDefined : Prop
  youngLaplaceLaw : Prop
  pressureJumpDefinedTerm : pressureJumpDefined
  meanCurvatureDefinedTerm : meanCurvatureDefined
  youngLaplaceLawTerm : youngLaplaceLaw

def YoungLaplaceEquationClosed (Y : YoungLaplaceEquationPackage) : Prop :=
  Y.pressureJumpDefined ∧ Y.meanCurvatureDefined ∧ Y.youngLaplaceLaw

theorem young_laplace_equation_closed (Y : YoungLaplaceEquationPackage) :
    YoungLaplaceEquationClosed Y := by
  exact And.intro Y.pressureJumpDefinedTerm (And.intro Y.meanCurvatureDefinedTerm Y.youngLaplaceLawTerm)

end CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean
end HautevilleHouse