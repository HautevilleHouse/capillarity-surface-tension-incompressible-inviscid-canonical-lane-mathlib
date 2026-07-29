import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscid.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscid

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CapillaritySurfaceTensionClosed A.capillarity ∧
  EulerEquationClosed A.capillarity A.euler ∧
  FreeBoundaryClosed A.freeBoundary ∧
  WellPosednessClosed A.wellPosedness ∧
  GravityWaveClosed A.gravityWave

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  have hcap : CapillaritySurfaceTensionClosed A.capillarity :=
    capillarity_surface_tension_closed_from_evidence A.capillarity A.capillarityEvidence
  have heuler : EulerEquationClosed A.capillarity A.euler :=
    euler_equation_closed_from_evidence A.capillarity A.euler A.eulerEvidence
  have hfree : FreeBoundaryClosed A.freeBoundary :=
    free_boundary_closed_from_evidence A.freeBoundary A.freeBoundaryEvidence
  have hwell : WellPosednessClosed A.wellPosedness :=
    well_posedness_closed_from_evidence A.wellPosedness A.wellPosednessEvidence
  have hgrav : GravityWaveClosed A.gravityWave :=
    gravity_wave_closed_from_evidence A.gravityWave A.gravityWaveEvidence
  exact And.intro hcap (And.intro heuler (And.intro hfree (And.intro hwell hgrav)))

end CapillaritySurfaceTensionIncompressibleInviscid
end HautevilleHouse