# Method 1

The user creates the file `Q4spheren.jl` with the  function `Q4spheren`. The user then establishes the public interface in the module `add2FinEtools` in the file `add2FinEtools.jl`.

The  example file `examplemesh.jl` draws in the FinEtools package with this entire  public interface (as defined by the developer), plus the public interface of the added function `Q4spheren`:

```
using FinEtools
using add2FinEtools

radius, nperradius = 5.0, 8
fens, fes = Q4spheren(radius, nperradius)
File =  "Sphere_mesh.vtk"
vtkexportmesh(File, fes.conn, fens.xyz, FinEtools.MeshExportModule.Q4);
@async run(`"paraview.exe" $File`)
```

The user runs the example as

```
julia> include("add2FinEtools.jl")
julia> include("examplemesh.jl")
```

The file `add2FinEtools.jl` reads quite simply

```
module add2FinEtools

include("Q4spheren.jl")
export Q4spheren

end
```

to establish the public interface (function `Q4spheren`). In the file `Q4spheren.jl` the implicit resolution of the symbols from the FinEtools package as `using FinEtools` is used.

It is also possible not the change the  public interface  (as exported in the `FinEtools.jl` file) at all but to ignore it, and only use `import`, or targeted `using` to bring into scope only those functions that are  necessary, or to qualify function names with the corresponding module names.
 