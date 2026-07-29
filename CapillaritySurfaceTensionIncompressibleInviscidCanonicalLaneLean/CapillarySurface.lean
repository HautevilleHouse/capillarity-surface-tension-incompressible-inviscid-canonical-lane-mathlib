import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscid

structure CapillaryAdmittedObject where
  carrSpace : Type
  carrTopology : TopologicalSpace carrSpace
  fluidInterface : Set carrSpace
  interfaceSmooth : Prop
  curvatureBounded : Prop
  interfaceSmoothTerm : interfaceSmooth
  curvatureBoundedTerm : curvatureBounded

def CapillaryWitnessClosed (O : CapillaryAdmittedObject) : Prop :=
  O.interfaceSmooth ∧ O.curvatureBounded

structure CapillaryAdmissibleClass where
  object : CapillaryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : CapillaryAdmissibleClass) : Prop :=
  CapillaryWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CapillaritySurfaceTensionIncompressibleInviscid
end HautevilleHouse