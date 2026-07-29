import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscid

structure YoungLaplaceLawPackage (G : InterfacialCurvaturePackage) where
  meanCurvature : Type w
  pressureJump : ℝ
  surfaceTensionCoefficient : ℝ
  youngLaplaceRelation : Prop
  lawDerived : Prop

structure YoungLaplaceLawEvidence {G : InterfacialCurvaturePackage}
    (Y : YoungLaplaceLawPackage G) where
  youngLaplaceRelationClosed : Y.youngLaplaceRelation
  lawDerivedClosed : Y.lawDerived

def YoungLaplaceLawClosed {G : InterfacialCurvaturePackage}
    (Y : YoungLaplaceLawPackage G) : Prop :=
  Y.youngLaplaceRelation ∧ Y.lawDerived

theorem young_laplace_law_closed_from_evidence
    {G : InterfacialCurvaturePackage} (Y : YoungLaplaceLawPackage G)
    (E : YoungLaplaceLawEvidence Y) : YoungLaplaceLawClosed Y := by
  exact And.intro E.youngLaplaceRelationClosed E.lawDerivedClosed

end CapillaritySurfaceTensionIncompressibleInviscid
end HautevilleHouse