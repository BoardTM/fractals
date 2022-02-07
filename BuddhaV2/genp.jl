using JLD, FLoops

function calc(c)
    z = c 
    for _ in 1:15000
        z = z^2 + c 
        abs(z) > 2 && return true
    end
    false
end

function main(dim)::Vector{ComplexF64}
    @floop for b in -1.5:3/dim:1.5
        for a in -2.:3/dim:1.
            c = complex(a, b)
            calc(c) && @reduce(points = append!([], c))
        end
        println(b)
    end
    println(length(points))
    points
end

@time save("./out/20k.jld", "points", main(20000))