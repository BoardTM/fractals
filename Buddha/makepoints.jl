using JLD

function calc(c::ComplexF64)::Bool
    z = c
    for i in 1:1000
        z = z*z + c
        if abs(z) > 2
            return true
        end
    end
    return false
end

function main()
    pw = 1000
    points::Vector{ComplexF64} = []
    for b in -1.5:3/pw:1.5
        for a in -2.:3/pw:1.
            c = complex(a,b)
            calc(c) && append!(points, c)
        end
    end
    println(length(points))
    save("./sets/1k.jld","points", points)
    return nothing
end

@time main()