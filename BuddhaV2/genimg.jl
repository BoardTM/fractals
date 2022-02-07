using JLD, Images

function main(dim)
    points = load("./out/20k.jld", "points")
    img = zeros(RGB,dim,dim)
    for c in points
        z = c
        while abs(z) < 2 
            x = trunc(Int,(real(z) + 2)*dim/3); y = trunc(Int,(imag(z) + 1.5)*dim/3)
            0<x<dim>y>0 && (img[x,y] += RGB(0.0005,0,0))
            z = z^2 + c
        end
    end
    return map(clamp01nan, img)
end

@time save("./images/t1.png", main(1500))