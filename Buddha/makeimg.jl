using Images, JLD

function main()
    w = 2000
    h = 2000
    points = load("./sets/15k.jld", "points")
    img = zeros(RGB,w,h)
    for c::ComplexF64 in points 
        i::Int = 0
        z::ComplexF64 = c
        while abs(z) < 3 && i < 5000
            x::Int = trunc(Int,(real(z) + 2)*w/3); y::Int = trunc(Int,(imag(z) + 1.5)*h/3)
            0<x<w && 0<y<h && i > 0 ? img[x,y] += RGB(0.0005,0,0) : nothing #log10(i)/3
            z = z*z + c
            i += 1
        end
    end
    return map(clamp01nan, img)
end

@time save("./out/buddhared.png", main())