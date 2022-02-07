using Images
function calc()
    width, height = 1000, 800
    img = zeros(height,width)
    a = .9
    b = -.6013
    c = 2.
    d = .8
    x = -.72
    y = -.64
    for i in 1:1000000
        x, y = x ^ 2 - y ^ 2 + a * x + b * y, 2x*y + c*x + d*y    
        img[height-trunc(Int, height*(y+2)/3), trunc(Int, width*(x+1.4)/2.0)] = 1
    end
    save("tinkerbell1.png", Gray.(img))
end
@time calc()