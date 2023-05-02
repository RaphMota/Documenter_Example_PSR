# Ploting functions

Vamos plotar a função func, cuja equação é:

```math
func(x) = 2 x + 1
```

```julia
using Plots

x=range(0,20, length=40)
y = [func(x)]

label = ["func(x)"]

plot(x, y , label)
```