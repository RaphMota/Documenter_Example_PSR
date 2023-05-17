import Documenter
# using Documenter_Example_PSR

PAGES = [
    "Introduction" => "index.md",
    "maths.md",
    ]

Documenter.makedocs(
    sitename = "Example PSR",
    format = Documenter.HTML(;
        mathengine = Documenter.MathJax2(),
        collapselevel = 1,
        # assets = ["assets/extra_styles.css"],
        footer = "Powered by [PSR](https://www.psr-inc.com/en/)",
        # analytics = "",
        sidebar_sitename = true,
        description = "PSR docs experiments",
        warn_outdated = true,
    ),
)

Documenter.deploydocs(
    repo = "github.com/RaphMota/Documenter_Example_PSR",
    push_preview = true,    
)