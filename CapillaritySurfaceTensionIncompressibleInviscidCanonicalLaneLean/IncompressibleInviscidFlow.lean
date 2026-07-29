import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscid.NormalStressBalance

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscid

structure IncompressibleInviscidFlowPackage (A : CapillaryAdmissibleClass) (Y : YoungLaplacePackage A) (N : NormalStressBalancePackage A Y) where
  flowDomain : Type u
  flowTopology : TopologicalSpace flowDomain
  velocityField : Type v
  pressureField : Type w
  incompressibility : Prop
  inviscidCondition : Prop
  incompressibilityTerm : incompressibility
  inviscidConditionTerm : inviscidCondition

structure IncompressibleInviscidFlowEvidence (A : CapillaryAdmissibleClass) (Y : YoungLaplacePackage A) (N : NormalStressBalancePackage A Y)
    (F : IncompressibleInviscidFlowPackage A Y N) where
  incompressibilityClosed : F.incompressibility
  inviscidConditionClosed : F.inviscidCondition

def IncompressibleInviscidFlowClosed (A : CapillaryAdmissibleClass) (Y : YoungLaplacePackage A) (N : NormalStressBalancePackage A Y)
    (F : IncompressibleInviscidFlowPackage A Y N) : Prop :=
  F.incompressibility ∧ F.inviscidCondition

theorem incompressible_inviscid_flow_closed_from_evidence (A : CapillaryAdmissibleClass) (Y : YoungLaplacePackage A) (N : NormalStressBalancePackage A Y)
    (F : IncompressibleInviscidFlowPackage A Y N) (E : IncompressibleInviscidFlowEvidence A Y N) :
    IncompressibleInviscidFlowClosed A Y N F := by
  exact And.intro E.incompressibilityClosed E.inviscidConditionClosed

end CapillaritySurfaceTensionIncompressibleInviscid
end HautevilleHouse