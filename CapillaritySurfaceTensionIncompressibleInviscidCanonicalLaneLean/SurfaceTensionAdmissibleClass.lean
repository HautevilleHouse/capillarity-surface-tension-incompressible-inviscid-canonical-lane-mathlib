import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscid

structure SurfaceTensionAdmissibleClass where
  admittedObject : CapillarityAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def SurfaceTensionAdmittedClosure (A : SurfaceTensionAdmissibleClass) : Prop :=
  CapillarityWitnessClosed A.admittedObject ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CapillaritySurfaceTensionIncompressibleInviscid
end HautevilleHouse