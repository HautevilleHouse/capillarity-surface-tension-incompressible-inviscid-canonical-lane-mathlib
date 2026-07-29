import HautevilleHouse.CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean.CapillarityPDEPackage

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean

structure EquilibriumShapesPackage {G : RiemannianCurvaturePackage}
    {F : CapillarityPDEPackage G} where
  equilibriumCondition : Prop
  surfaceMinimizing : Prop
  youngLaplaceSolution : Prop
  bifurcationAnalysis : Prop

structure EquilibriumShapesEvidence {G : RiemannianCurvaturePackage}
    {F : CapillarityPDEPackage G} (E : EquilibriumShapesPackage F) where
  equilibriumConditionClosed : E.equilibriumCondition
  surfaceMinimizingClosed : E.surfaceMinimizing
  youngLaplaceSolutionClosed : E.youngLaplaceSolution
  bifurcationAnalysisClosed : E.bifurcationAnalysis

def EquilibriumShapesClosed {G : RiemannianCurvaturePackage}
    {F : CapillarityPDEPackage G} (E : EquilibriumShapesPackage F) : Prop :=
  E.equilibriumCondition ∧ E.surfaceMinimizing ∧ E.youngLaplaceSolution ∧ E.bifurcationAnalysis

theorem equilibrium_shapes_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : CapillarityPDEPackage G}
    (E : EquilibriumShapesPackage F) (Ev : EquilibriumShapesEvidence E) :
    EquilibriumShapesClosed E := by
  exact And.intro Ev.equilibriumConditionClosed
    (And.intro Ev.surfaceMinimizingClosed
      (And.intro Ev.youngLaplaceSolutionClosed Ev.bifurcationAnalysisClosed))

end CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean
end HautevilleHouse
