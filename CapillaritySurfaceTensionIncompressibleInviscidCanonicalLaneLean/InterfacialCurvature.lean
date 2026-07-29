import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscid

structure InterfacialCurvaturePackage where
  surface : Type u
  topology : TopologicalSpace surface
  metric : Type v
  meanCurvatureTensor : Type w
  gaussCurvature : Type x
  smoothTwoSurface : Prop
  metricSmooth : Prop
  meanCurvatureLawful : Prop
  gaussCurvatureDerived : Prop

structure InterfacialCurvatureEvidence (G : InterfacialCurvaturePackage) where
  smoothTwoSurfaceClosed : G.smoothTwoSurface
  metricSmoothClosed : G.metricSmooth
  meanCurvatureLawfulClosed : G.meanCurvatureLawful
  gaussCurvatureDerivedClosed : G.gaussCurvatureDerived

def InterfacialCurvatureClosed (G : InterfacialCurvaturePackage) : Prop :=
  G.smoothTwoSurface ∧ G.metricSmooth ∧ G.meanCurvatureLawful ∧ G.gaussCurvatureDerived

theorem interfacial_curvature_closed_from_evidence
    (G : InterfacialCurvaturePackage) (E : InterfacialCurvatureEvidence G) :
    InterfacialCurvatureClosed G := by
  exact And.intro E.smoothTwoSurfaceClosed
    (And.intro E.metricSmoothClosed
      (And.intro E.meanCurvatureLawfulClosed E.gaussCurvatureDerivedClosed))

end CapillaritySurfaceTensionIncompressibleInviscid
end HautevilleHouse