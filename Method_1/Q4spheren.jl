# Here we use implicit resolution of symbols from FinEtools:
using FinEtools

# Alternatively one could explicitly import needed functionality: 
# import FinEtools.MeshQuadrilateralModule: Q4quadrilateral
# import FinEtools.MeshModificationModule: mergemeshes
# import FinEtools.FESetModule: cat
# import FinEtools.FENodeSetModule: count


function onto_sphere!(fens, radius)
    # Project nodes onto a sphere of given radius.
    for j = 1:count(fens)
        fens.xyz[j,:] = fens.xyz[j,:]*radius/norm(fens.xyz[j,:]);
    end
    return fens;
end

"""
    Q4spheren(radius, nperradius)

Create a surface mesh of 1/8 of a sphere with a given number of elements per circumference.  
"""
function Q4spheren(radius, nperradius)
    if (nperradius % 2 != 0)
        nperradius = nperradius+1;
    end
    nL=Int(nperradius/2); nW=Int(nperradius/2); 
    a=sqrt(2.0)/2;
    b=1/sqrt(3.0);
    c=0.6*a;
    d=0.6*b;
    xyz=[1 0 0; 0 1 0; 0 0 1; a a 0; 0 a a; a 0 a; b b b];
    conn=[1 4 7 6; 4 2 5 7; 3 6 7 5];
    fens, fes = Q4quadrilateral(xyz[conn[1,:],:], nL, nW);
    fens1, fes1 = Q4quadrilateral(xyz[conn[2,:],:], nL, nW);
    fens, fes1, fes2 = mergemeshes(fens1, fes1, fens, fes, norm(xyz)/1000)
    fes = cat(fes1,fes2);
    fens1, fes1 = Q4quadrilateral(xyz[conn[3,:],:], nL, nW);
    fens, fes1, fes2 = mergemeshes(fens1, fes1, fens, fes, norm(xyz)/1000)
    fes = cat(fes1,fes2);
    fens= onto_sphere!(fens, radius)
    return fens, fes
end