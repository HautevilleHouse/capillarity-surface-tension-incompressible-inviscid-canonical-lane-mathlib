import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean

structure InviscidFlowEnergyPackage where
  kineticEnergy : Prop
  surfaceEnergy : Prop
  totalEnergyConserved : Prop
  kineticEnergyTerm : kineticEnergy
  surfaceEnergyTerm : surfaceEnergy
  totalEnergyConservedTerm : totalEnergyConserved

def InviscidFlowEnergyClosed (I : InviscidFlowEnergyPackage) : Prop :=
  I.kineticEnergy ∧ I.surfaceEnergy ∧ I.totalEnergyConserved

theorem inviscid_flow_energy_closed (I : InviscidFlowEnergyPackage) :
    InviscidFlowEnergyClosed I := by
  exact And.intro I.kineticEnergyTerm (And.intro I.surfaceEnergyTerm I.totalEnergyConservedTerm)

end CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean
end HautevilleHouse