import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscid.CapillaritySurfaceTension
import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscid.EulerEquation
import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscid.FreeBoundary

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscid

structure GravityWavePackage {C : CapillaritySurfaceTensionPackage}
    {E : EulerEquationPackage C} {F : FreeBoundaryPackage E} where
  dispersionRelation : Prop
  amplitudeSmall : Prop
  waveSpeed : Prop

structure GravityWaveEvidence {C : CapillaritySurfaceTensionPackage}
    {E : EulerEquationPackage C} {F : FreeBoundaryPackage E}
    (G : GravityWavePackage F) where
  dispersionRelationClosed : G.dispersionRelation
  amplitudeSmallClosed : G.amplitudeSmall
  waveSpeedClosed : G.waveSpeed

def GravityWaveClosed {C : CapillaritySurfaceTensionPackage}
    {E : EulerEquationPackage C} {F : FreeBoundaryPackage E}
    (G : GravityWavePackage F) : Prop :=
  G.dispersionRelation ∧ G.amplitudeSmall ∧ G.waveSpeed

theorem gravity_wave_closed_from_evidence {C : CapillaritySurfaceTensionPackage}
    {E : EulerEquationPackage C} {F : FreeBoundaryPackage E}
    (G : GravityWavePackage F) (Ev : GravityWaveEvidence G) : GravityWaveClosed G := by
  exact And.intro Ev.dispersionRelationClosed (And.intro Ev.amplitudeSmallClosed Ev.waveSpeedClosed)

end CapillaritySurfaceTensionIncompressibleInviscid
end HautevilleHouse