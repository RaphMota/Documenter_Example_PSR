function psr_deploy_docs(repo_url, VER, langs)
    index_text ="""
    <!--This file is automatically generated by Documenter.jl-->
    <meta http-equiv="refresh" content="0; url=./stable/"/>
    
    """
    temp_path = joinpath(@__DIR__, "temp_repo")
    branch = "gh-pages"
    rm(temp_path, recursive=true, force=true)
    mkpath(temp_path)
    cd(temp_path) do 
    
        git() = "git"
        run(`$(git()) init`)
        run(`$(git()) remote add upstream $repo_url`)
    
        @show run(`$(git()) fetch upstream`)
    
        run(`$(git()) checkout -b $branch upstream/$branch`)
    
        for lang in langs
            ver_name = "v" * VER * "-" * lang
            rm(joinpath(temp_path, ver_name), recursive=true, force=true)
            cp(joinpath(@__DIR__, ver_name), joinpath(temp_path, ver_name), force=true)
        end
        if !isfile(joinpath(temp_path, "index.html"))
            open(joinpath(temp_path, "index.html"), "w") do io
                println(io, index_text)
            end
        end
        prev_versions = Set{VersionNumber}()
        if isfile(joinpath(temp_path, "versions.js"))
            lines = readlines(joinpath(temp_path, "versions.js"))
            for line in lines
                line = strip(line)
                if startswith(line, "\"v")
                    ver = parse(VersionNumber, line[2:end-2]) # like "v17.2.3",
                    push!(prev_versions, ver)
                end
            end
            rm(joinpath(temp_path, "versions.js"), force=true)
        end
        push!(prev_versions, VersionNumber(VER))
        open(joinpath(temp_path, "versions.js"), "w") do io
            println(io, "var DOC_VERSIONS = [")
            for v in sort(collect(prev_versions))
                println(io, "  \"v" * string(v) * "\",")
            end
            println(io, "];")
            max_v = maximum(prev_versions)
            println(io, "var DOCUMENTER_NEWEST = \"v" * string(max_v) * "\";")
            println(io, "var DOCUMENTER_STABLE = \"v" * string(max_v) * "\";")
        end
    
        run(`$(git()) add --all`)
    
        run(`$(git()) commit -m "build based on $VER"`)
        run(`$(git()) push -q upstream HEAD:$branch`)
    end
end