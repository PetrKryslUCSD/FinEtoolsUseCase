# Method 1

The user creates the file `Q4spheren.jl` with the  function `Q4spheren`. The user then establishes the public interface in the module `add2FinEtools` in the file `add2FinEtools.jl`.

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