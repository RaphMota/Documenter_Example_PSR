using Documenter, Documenter_Example_PSR

About = "Introduction" => "index.md"

Equations= "maths.md"

PAGES = [
    About,
    Equations
    ]

makedocs(sitename="Documenter_Example_PSR.jl")

deploydocs(repo = "github.com/RaphMota/Documenter_Example_PSR/releases/tag/v1.0-en")