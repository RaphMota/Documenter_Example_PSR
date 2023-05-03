# Ploting functions

We´re going to plot the func function, whose equation is:

```math
func(x) = 2 x + 1
```

```@eval
using PyPlot, Documenter_Example_PSR

x=range(0,20, length=40)
y = [func(x_i) for x_i in x]

label = ["func(x)"]

plot(x, y , label)
savefig("plot.svg")

nothing
```

![](plot.svg)