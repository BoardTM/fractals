using Images, BenchmarkTools

function calc(a,b)
    z = c = complex(a, b)
    for i in 1:3000
        z = z*z + c 
        if abs(z) > 3
            return true
        end
    end
    return false
end

function buddha(points::Array{ComplexF64}, h::Int, w::Int)
    img = zeros(RGB,w,h)
    for c::ComplexF64 in points 
        i::Int = 0
        z::ComplexF64 = c
        while abs(z) < 3 && i < 1000
            x::Int = trunc(Int,(real(z) + 2)*w/3); y::Int = trunc(Int,(imag(z) + 1.5)*h/3)
            0<x<w && 0<y<h && i > 20 ? img[x,y] += RGB(0,0,0.004) : nothing #log10(i)/3
            z = z*z + c
            i += 1
        end
    end
    return img
end

function main()
    h::Int = 8000
    w::Int = 8000
    points::Array{ComplexF64} = []
    for b in -1.5:3/h:1.5
        for a in -2.:3/w:1.
            calc(a,b) && append!(points, complex(a,b))
        end
    end
    println("Init done")
    return map(clamp01nan, buddha(points,2000,2000))
end

#@benchmark main()
@time save("./out/buddha.png", main())