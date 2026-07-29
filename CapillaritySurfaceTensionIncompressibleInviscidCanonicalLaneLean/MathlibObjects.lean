namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean

structure CapillaritySpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure CapillarityAdmittedObject where
  space : CapillaritySpace
  freeSurfaceEmbedded : Prop
  surfaceTensionWellDefined : Prop
  incompressibleInviscidFluid : Prop
  staticConfiguration : Prop
  conclusion : staticConfiguration

def CapillarityWitnessClosed (O : CapillarityAdmittedObject) : Prop :=
  O.staticConfiguration

end CapillaritySurfaceTensionIncompressibleInviscidCanonicalLaneLean
end HautevilleHouse