import CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean.FreeBoundaryPDE

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean

structure GeometricExistencePackage (P : FreeBoundaryPDEPackage) where
  initialSurfaceConfigured : Prop
  localInTimeExistence : Prop
  regularityOfFreeSurface : Prop
  uniquenessOfSolution : Prop

structure GeometricExistenceEvidence {P : FreeBoundaryPDEPackage} (G : GeometricExistencePackage P) where
  initialSurfaceConfiguredClosed : G.initialSurfaceConfigured
  localInTimeExistenceClosed : G.localInTimeExistence
  regularityOfFreeSurfaceClosed : G.regularityOfFreeSurface
  uniquenessOfSolutionClosed : G.uniquenessOfSolution

def GeometricExistenceClosed {P : FreeBoundaryPDEPackage} (G : GeometricExistencePackage P) : Prop :=
  G.initialSurfaceConfigured ∧ G.localInTimeExistence ∧ G.regularityOfFreeSurface ∧ G.uniquenessOfSolution

theorem geometric_existence_closed_from_evidence {P : FreeBoundaryPDEPackage}
    (G : GeometricExistencePackage P) (E : GeometricExistenceEvidence G) :
    GeometricExistenceClosed G := by
  exact And.intro E.initialSurfaceConfiguredClosed
    (And.intro E.localInTimeExistenceClosed
      (And.intro E.regularityOfFreeSurfaceClosed E.uniquenessOfSolutionClosed))

end CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean
end HautevilleHouse