using Images, Luxor, BenchmarkTools

function calc(dims)
    img = fill(RGB(0,0,0), (dims, dims))
    a = 2.24; b = 0.43; c = -0.65; d = -2.43
    x = y = z = .0
    for _ in 1:dims^2
        x, y, z = sin(a * y) - z * cos(b * x), z * sin(c * x) - cos(d * y), sin(x)
        xx = trunc(Int, rescale(x, -2., 2., 0, dims))
        yy = trunc(Int, rescale(y, -2., 2., 0, dims))
        zz = rescale(z, -1, 1, .3, .8)
        img[yy,xx] = RGB(.7xx / dims, .3yy / dims + .2, zz)
    end
    return img
end

@time save("strange.png",calc(1000))