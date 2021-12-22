# COMPUTER LABS 2
## EXERCISE 2

### Liarmakopoulos Michail, ph2566
### Deadline: 13.10.05
---

#### Problem
In Fresnel difraction the following integrals appear that don't have analytic solution (written in Mathematica code):

```Mathematica
C[u0_] := Integral[Cos[x^2], {x, 0, u0}]

S[u0_] := Integral[Sin[x^2], {x, 0, u0}]
```

For given `u0 > 0` I'll calculate the above integrals using the Simnpson method.


#### Simpson method

For the integral of the function with `x` in `[0, N]` and for step `h`:

```LaTeX
I ~ (h/3) * (f_0 + 4*(f_1 + f_3 +...+ f_n-1) + 2*(f_2 + f_4 +...+ f_n-2) + f_n)
```

#### Documentation
- https://en.wikipedia.org/wiki/Fresnel_integral
- https://en.wikipedia.org/wiki/Simpson%27s_rule