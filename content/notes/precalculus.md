+++

title = "Precalculus"
template = "notes.html"
description = ""
draft = false

+++


## Composite functions
 
Given two functions, we can combine them in such a way so that the outputs of one function become the inputs of the other. This action defines a composite function.

```
// M composed with C
M ∘ C

M(C(a)) = (M ∘ C)(a)

```

```
// Find M composed with C

M(c) = 7c + 5;
C(a) = 10 - a;

// Ways to Compose

// Substitute C(a) for c in M(c)

M(C(a)) = 7(C(a)) + 5
        = 7(10 - a) + 5
        = 75 - 7a <--


// Evaluate inner function, substitute result into outer function

M(C(2)) 
C(2) = 10 - 2 = 8
M(8) = 7(8) + 5 = 61 <--

```
