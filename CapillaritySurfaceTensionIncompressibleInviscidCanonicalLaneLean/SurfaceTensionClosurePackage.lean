import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean.EquilibriumShapesPackage

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean

structure SurfaceTensionClosurePackage {G : RiemannianCurvaturePackage}
    {F : CapillarityPDEPackage G} {E : EquilibriumShapesPackage F} where
  surfaceTensionCoexistence : Prop
  contactAngleBoundary : Prop
  nucleationBarrier : Prop
  stabilityCriterion : Prop

structure SurfaceTensionClosureEvidence {G : RiemannianCurvaturePackage}
    {F : CapillarityPDEPackage G} {E : EquilibriumShapesPackage F}
    (S : SurfaceTensionClosurePackage E) where
  surfaceTensionCoexistenceClosed : S.surfaceTensionCoexistence
  contactAngleBoundaryClosed : S.contactAngleBoundary
  nucleationBarrierClosed : S.nucleationBarrier
  stabilityCriterionClosed : S.stabilityCriterion

def SurfaceTensionClosureClosed {G : RiemannianCurvaturePackage}
    {F : CapillarityPDEPackage G} {E : EquilibriumShapesPackage F}
    (S : SurfaceTensionClosurePackage E) : Prop :=
  S.surfaceTensionCoexistence ∧ S.contactAngleBoundary ∧ S.nucleationBarrier ∧ S.stabilityCriterion

theorem surface_tension_closure_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : CapillarityPDEPackage G} {E : EquilibriumShapesPackage F}
    (S : SurfaceTensionClosurePackage E) (Ev : SurfaceTensionClosureEvidence S) :
    SurfaceTensionClosureClosed S := by
  exact And.intro Ev.surfaceTensionCoexistenceClosed
    (And.intro Ev.contactAngleBoundaryClosed
      (And.intro Ev.nucleationBarrierClosed Ev.stabilityCriterionClosed))

end CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean
end HautevilleHouse
