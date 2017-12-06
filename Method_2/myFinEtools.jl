"""
FinEtools (C) 2017, Petr Krysl

Finite Element tools.  Julia implementation  of the finite element method
for continuum mechanics.
"""
module myFinEtools

###########################################################################
# General facilities
###########################################################################
using FinEtools.FTypesModule: FInt, FFlt, FCplxFlt, FFltVec, FIntVec, FFltMat, FIntMat, FMat, FVec, FDataDict
# Exported: basic numerical types, type of data dictionary
export FInt, FFlt, FCplxFlt, FFltVec, FIntVec, FFltMat, FIntMat, FMat, FVec, FDataDict

using FinEtools.BoxModule: inbox, initbox!, updatebox!, boundingbox, inflatebox!, boxesoverlap
# Exported: methods for manipulating and testing boxes
export inbox, initbox!, updatebox!, boundingbox, inflatebox!, boxesoverlap

using FinEtools.PhysicalUnitModule: phun
# Exported: function for evaluating physical units
export phun

using FinEtools.RotationUtilModule: rotmat3!, skewmat!, cross3!, cross2
# Exported: functions for 3D rotation matrix computation, skew symmetric matrix computation,  in-place  cross product of 3-vectors, and  cross product of 2-vectors
export rotmat3!, skewmat!, cross3!, cross2

using FinEtools.CSysModule: CSys, updatecsmat!
# Exported: type  for coordinate systems, methods to invoke the update callback
export CSys, updatecsmat!

using FinEtools.FESetModule: FESet,  FESet0Manifold,  FESet1Manifold,  FESet2Manifold,  FESet3Manifold, manifdim, nodesperelem, count, fromarray!, connasarray, setlabel!, subset, cat, updateconn!, bfun, bfundpar, map2parametric, inparametric, centroidparametric,  FESetP1, FESetL2, FESetL3, FESetT3, FESetQ4, FESetQ9, FESetQ8, FESetT6, FESetH8, FESetH20, FESetH27, FESetT4, FESetT10
# Exported: types of finite element sets, abstract and concrete
export FESet,  FESet0Manifold,  FESet1Manifold,  FESet2Manifold,  FESet3Manifold, FESetP1, FESetL2, FESetL3, FESetT3, FESetQ4, FESetQ9, FESetQ8, FESetT6, FESetH8, FESetH20, FESetH27, FESetT4, FESetT10
# Exported: methods for accessing dimensions and counts
export manifdim, nodesperelem, count
# Exported: methods for  manipulating connectivity  and labels
export fromarray!, connasarray, setlabel!, subset, cat, updateconn!
# Exported: methods for computing basis function values and derivatives of basis functions  with respect to the parametric coordinates, and methods for working with parametric coordinates
export bfun, bfundpar, map2parametric, inparametric, centroidparametric 

using FinEtools.FENodeSetModule: FENodeSet, spacedim, xyz3, count
# Exported: type for FE node sets, methods for accessing dimensions  and counts
export FENodeSet, spacedim, xyz3, count

using FinEtools.MeshSelectionModule: connectednodes, selectnode, selectelem, findunconnnodes
# Exported: functions to select (find) nodes and elements
export connectednodes, selectnode, selectelem, findunconnnodes

using FinEtools.MeshExportModule: vtkexportmesh
# Exported: VTK export
export vtkexportmesh

using FinEtools.MeshModificationModule: meshboundary,  fusenodes,  compactnodes,  mergemeshes, mergenmeshes, mergenodes,  renumberconn!,  meshsmoothing, mirrormesh, nodepartitioning, interior2boundary
# Exported: extraction of boundary, fusing of nodes  and merging of meshes, mesh smoothing,  node partitioning
export  meshboundary,  fusenodes,  compactnodes,  mergemeshes, mergenmeshes, mergenodes,  renumberconn!,  meshsmoothing, mirrormesh, nodepartitioning, interior2boundary

###########################################################################
# Mesh-generation functionality for various shapes
###########################################################################
using FinEtools.MeshQuadrilateralModule: Q4annulus, Q4quadrilateral, Q4elliphole, Q4block, Q4blockx, Q4refine, Q8block, Q4toQ8, Q8annulus, Q8blockx
# Exported: mesh generation functions for quadrilateral elements
export Q4annulus, Q4quadrilateral, Q4elliphole, Q4block, Q4blockx, Q4refine, Q8block, Q4toQ8, Q8annulus, Q8blockx

# My new sphere-generating function
include("Q4spheren.jl")
export Q4spheren

end
