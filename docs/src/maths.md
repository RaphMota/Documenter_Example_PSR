# Ploting functions

We´re going to plot the func function, whose equation is:

```math
func(x) = 2 x + 1
```

```@eval
using PyPlot

x=range(0,20, length=40)
y = [Documenter_Example_PSR.func(x)]

label = ["func(x)"]

plot(x, y , label)
savefig("plot.svg")

nothing
```

![](plot.svg)