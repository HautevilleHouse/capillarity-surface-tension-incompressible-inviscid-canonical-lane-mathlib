import canonicalLaneMathlib.AdmissibleClass
import CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean.CapillarySurfaceBridge
import CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean.YoungLaplaceEquation
import CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean.InviscidFlowEnergy

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CapillarySurfaceClosed (A.object)

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

def ConstrainedCapillarityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_capillarity_endgame (A : AdmissibleClass) :
    ConstrainedCapillarityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean
end HautevilleHouse