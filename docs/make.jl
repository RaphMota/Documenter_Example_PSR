import Documenter
# using Documenter_Example_PSR


VER = "17.2.3"

for lang in ["en", "es"]
    PAGES = [
        "Introduction" => joinpath(lang, "index.md"),
        joinpath(lang, "maths.md"),
        ]

    Documenter.makedocs(
        sitename = "Example PSR " * lang,
        build   = "v" * VER * "-" * lang,
        format = Documenter.HTML(;
            mathengine = Documenter.MathJax2(),
            collapselevel = 1,
            # assets = ["assets/extra_styles.css"],
            footer = "Powered by [PSR](https://www.psr-inc.com/en/)",
            # analytics = "",
            sidebar_sitename = true,
            # description = "PSR docs experiments",
            warn_outdated = true,
        ),
    )

end
# Documenter.deploydocs(
#     repo = "github.com/RaphMota/Documenter_Example_PSR",
#     push_preview = true,    
# )

# TODO:

# 1 - Git clone this REPO but in branch gh-pages
# If: it is a commit in master: 
# 2 - Move the 3 folders to the root dir of the cloned repo (might need to delete the previous ones with same name)
# 3 - Update versions.js file
# 4 - Push the updated branch of gh-pages
# ElseIf: it is a PR
# 2 - Move the 3 folders to the preview/PR$(PRNUM) dir of the cloned repo
# 3 - Push the updated branch of gh-pages
