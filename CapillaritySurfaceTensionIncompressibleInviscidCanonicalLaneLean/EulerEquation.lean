import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscid.CapillaritySurfaceTension

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscid

structure EulerEquationPackage (C : CapillaritySurfaceTensionPackage) where
  fluidDomain : Type u
  velocityField : Type v
  pressureField : Type w
  eulerEquation : Prop
  incompressibility : Prop
  inviscidCondition : Prop

structure EulerEquationEvidence (C : CapillaritySurfaceTensionPackage)
    (E : EulerEquationPackage C) where
  eulerEquationClosed : E.eulerEquation
  incompressibilityClosed : E.incompressibility
  inviscidConditionClosed : E.inviscidCondition

def EulerEquationClosed (C : CapillaritySurfaceTensionPackage) (E : EulerEquationPackage C) : Prop :=
  E.eulerEquation ∧ E.incompressibility ∧ E.inviscidCondition

theorem euler_equation_closed_from_evidence (C : CapillaritySurfaceTensionPackage)
    (E : EulerEquationPackage C) (Ev : EulerEquationEvidence C E) : EulerEquationClosed C E := by
  exact And.intro Ev.eulerEquationClosed (And.intro Ev.incompressibilityClosed Ev.inviscidConditionClosed)

end CapillaritySurfaceTensionIncompressibleInviscid
end HautevilleHouse