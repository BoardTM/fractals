# using Images, BenchmarkTools

# const c = complex(-.79,.15)

# function calc(z::ComplexF64)::RGB
#     for i in 1:10000
#         z = z*z + c
#         if abs(z) > 2
#             return RGB(i > 255 ? 1. : i/255, 0., 0.) 
#         end
#     end
#     return RGB(0.,0.,0.)
# end

# function main(height::Int,width::Int)::Matrix{RGB}
#     img::Matrix{RGB} = zeros(RGB,height,width)
#     for x in 1:width
#         a = x * 3.75 / width - 1.9
#         Threads.@threads for y in 1:height
#             b = y * 2.5 / height - 1.25
#             img[y,x] = calc(complex(a,b)) 
#         end
#     end
#     return img
# end

# @benchmark main(1000,1500)
# #@time save("julia.png", main(1000,1500))
using JLD
points = open("./sets/")