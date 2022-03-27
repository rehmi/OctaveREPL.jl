using OctaveREPL
using Documenter

DocMeta.setdocmeta!(OctaveREPL, :DocTestSetup, :(using OctaveREPL); recursive=true)

makedocs(;
    modules=[OctaveREPL],
    authors="Rehmi Post <rehmi.post@gmail.com> and contributors",
    repo="https://github.com/rehmi/OctaveREPL.jl/blob/{commit}{path}#{line}",
    sitename="OctaveREPL.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
