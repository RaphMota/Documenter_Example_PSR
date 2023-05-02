# Ploting functions

We´re going to plot the func function, whose equation is:

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