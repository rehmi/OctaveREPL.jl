# OctaveREPL

This package adds a sticky REPL mode to allow direct interaction with an inferior Octave process.



```
julia> using OctaveREPL
REPL mode Octave mode initialized. Press , to enter and backspace to exit.

julia> # Now type ',' to enter Octave REPL mode
octave> whos
Variables visible from the current scope:

variables in scope: top scope

   Attr Name        Size                     Bytes  Class
   ==== ====        ====                     =====  =====
        ans         1x1                         12  cell

Total is 1 element using 12 bytes


octave> # Now type <backspace> or <delete> to return to Julia REPL
julia>
```

A string macro is provided to allow execution of abritrary octave code

```
# The inferior Octave prints its result to stdout by default
# while Julia also prints the return result to stdout
julia> oct"atan(0.5)"
ans = 0.4636
0.46364760900080615

# Suppress Julia result printout
julia> oct"atan(0.5)";
ans = 0.4636

# Suppress Octave result printout
julia> oct"atan(0.5);"
0.46364760900080615

# Suppress both printouts and save the return value in a Julia variable
julia> a = oct"atan(0.5);";

julia> a
0.46364760900080615

```

## Installation


To install, simply do

```
julia> import Pkg; Pkg.add("https://github.com/rehmi/OctaveREPL.jl.git")
```
