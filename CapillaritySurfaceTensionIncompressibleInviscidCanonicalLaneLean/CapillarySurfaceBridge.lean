import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean

structure CapillarySurfacePackage where
  fluidDomain : Type u
  interfaceSurface : Type v
  surfaceTensionField : Type w
  interfaceGeometryControlled : Prop
  contactAngleBound : Prop
  meanCurvatureSatisfies : Prop
  interfaceGeometryControlledDefined : interfaceGeometryControlled
  contactAngleBoundDefined : contactAngleBound
  meanCurvatureSatisfiesDefined : meanCurvatureSatisfies

structure CapillarySurfaceEvidence (P : CapillarySurfacePackage) where
  interfaceGeometryControlledClosed : P.interfaceGeometryControlled
  contactAngleBoundClosed : P.contactAngleBound
  meanCurvatureSatisfiesClosed : P.meanCurvatureSatisfies

def CapillarySurfaceClosed (P : CapillarySurfacePackage) : Prop :=
  P.interfaceGeometryControlled ∧ P.contactAngleBound ∧ P.meanCurvatureSatisfies

theorem capillary_surface_closed_from_evidence (P : CapillarySurfacePackage) (E : CapillarySurfaceEvidence P) :
    CapillarySurfaceClosed P := by
  exact And.intro E.interfaceGeometryControlledClosed (And.intro E.contactAngleBoundClosed E.meanCurvatureSatisfiesClosed)

end CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean
end HautevilleHouse