import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean

structure InterfaceGeometryPackage where
  surfaceTension : ℕ
  contactAngle : ℕ
  meanCurvature : Prop
  interfaceShapeRegular : Prop

structure InterfaceGeometryEvidence (P : InterfaceGeometryPackage) where
  surfaceTensionClosed : P.surfaceTension = 0
  contactAngleClosed : P.contactAngle = 0
  meanCurvatureClosed : P.meanCurvature
  interfaceShapeRegularClosed : P.interfaceShapeRegular

def InterfaceGeometryClosed (P : InterfaceGeometryPackage) : Prop :=
  P.surfaceTension = 0 ∧ P.contactAngle = 0 ∧ P.meanCurvature ∧ P.interfaceShapeRegular

theorem interface_geometry_closed_from_evidence (P : InterfaceGeometryPackage) (E : InterfaceGeometryEvidence P) : InterfaceGeometryClosed P :=
  And.intro E.surfaceTensionClosed (And.intro E.contactAngleClosed (And.intro E.meanCurvatureClosed E.interfaceShapeRegularClosed))

end CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean
end HautevilleHouse