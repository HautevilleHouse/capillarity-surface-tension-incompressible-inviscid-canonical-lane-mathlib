import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscid.YoungLaplaceEquation

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscid

structure NormalStressBalancePackage (A : CapillaryAdmissibleClass) (Y : YoungLaplacePackage A) where
  stressTensor : Type u
  normalComponent : Type v
  balanceCondition : Prop
  balanceConditionTerm : balanceCondition

structure NormalStressBalanceEvidence (A : CapillaryAdmissibleClass) (Y : YoungLaplacePackage A) (N : NormalStressBalancePackage A Y) where
  balanceConditionClosed : N.balanceCondition

def NormalStressBalanceClosed (A : CapillaryAdmissibleClass) (Y : YoungLaplacePackage A) (N : NormalStressBalancePackage A Y) : Prop :=
  N.balanceCondition

theorem normal_stress_balance_closed_from_evidence (A : CapillaryAdmissibleClass) (Y : YoungLaplacePackage A) (N : NormalStressBalancePackage A Y) (E : NormalStressBalanceEvidence A Y N) :
    NormalStressBalanceClosed A Y N := by
  exact E.balanceConditionClosed

end CapillaritySurfaceTensionIncompressibleInviscid
end HautevilleHouse