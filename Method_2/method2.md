# Method 2

The user creates the file [`Q4spheren.jl`](Q4spheren.jl) with the  function `Q4spheren`.

The user then establishes the public interface in the module `myFinEtools` in the file [`myFinEtools.jl`](myFinEtools.jl). As an example, the complete interface of the FinEtools package is reduced to just the modules that are needed to run the example.

The user runs the example as

```
julia> include("myFinEtools.jl")
julia> include("examplemesh.jl")
```

The file [`myFinEtools.jl`](myFinEtools.jl) is now longish because it incorporates part of the public interface of the FinEtools package (but still only  one quarter of the length of the entire export part of `FinEtools.jl`).

- First the file `FinEtools.jl` file is located and copied to the user's folder under the name `myFinEtools.jl`.
- The line 

    ```
    include("allmodules.jl")
    ```

    is deleted. Then the functionality of the FinEtools package is brought in as needed:
- In this instance (as an example) the user keeps in the public exported interface all the general facilities. However, the user deletes all the mesh exporting functionality except for `vtkexportmesh`. Also deleted are the geometry data, integration rule, and base FEMM exports. Furthermore all the field-related  functionality  is not exported,  and exports of mesh import, of all the mesh generation functions  for shapes other  than quadrilateral are deleted from the public interface. All the physics-based functions for acoustics, heat diffusion, and linear deformation are also deleted.
- The user finally  attaches an export of the added  functionality of the sphere-generation function:

    ```
    # My new sphere-generating function
    include("Q4spheren.jl")
    export Q4spheren
    ```

- If there was a conflict  with one of the exported functions from FinEtools, it could have been handled with a targeted  import  and redefinition  of the name.


