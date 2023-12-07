+++

title = "Algebra and Differential Calculus"
template = "notes.html"
description = ""
draft = false

+++


## Product Rule

```math

// the product rule
(fg)' = fg' + f'g

// the "long" way
f(x) = x^2-2
g(x) = x^2+x
h(x) = f(x)g(x)

h(x) = x^4 + x^3 - 2x^2 - 2x
h'(x) = 4x^3 + 3x^2 - 4x - 2 // << ANSWER

// the product rule way
f(x) = x^2-2
f'(x) = 2x
g(x) = x^2+x
g'(x) = 2x+1
h(x) = f(x)g(x)

h'(x) = (x^2-2)(2x+1) + (2x)(x^2+x)
h'(x) = 2x^3 + x^2 - 4x - 2 + 2x^3 + 2x^2
h'(x) = 4x^3 + 3x^2 - 4x - 2 // << ANSWER

```
