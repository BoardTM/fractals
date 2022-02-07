import numpy as np; from numba import jit; from PIL import Image; import time
Iterations = 10000
Height, Width = 1000,2000
XZoom,YZoom,Xb,Yb = 4, 2.2, 2.5, 1.1

@jit(nopython=True)
def calculation(a,b):
    zi = 0
    zr = 0
    for i in range(Iterations):                            
        zi, zr = 2 * zr * zi + b, zr**2 - zi**2 + a        
        if (zr**2 + zi**2) > 4:
            if i < 256: return i
            else: return 255
    return 0

@jit(nopython=True, parallel=True)
def main():
    array = np.zeros((Height,Width,3), dtype=np.uint8)
    for h in range(Height):
        for w in range(Width):
            a,b = w * XZoom / Width  - Xb, h * YZoom / Height - Yb
            array[h,w,0] = calculation(a,b)
        print(h)
    return array

start_time = time.time()
im = Image.fromarray(main(), mode="RGB")
im.save("Mandelbrot_%s.png" % round(time.time()))
print("--- %s seconds ---" % (time.time() - start_time))