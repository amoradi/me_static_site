+++

title = "SLSQP: A Quick Guide for Portfolio Optimization"
template = "notes.html"
description = "Natural, Integers, Rational and Real"
draft = false
+++

## What is SLSQP?

**Sequential Least Squares Programming** - an algorithm that can handle:
- Bounds (e.g., weights between 0 and 1)
- Equality constraints (e.g., weights sum to 1)
- Inequality constraints (e.g., minimum return threshold)

It's ideal for portfolio optimization because you always have constraints.

## Basic Usage Pattern

```python
from scipy.optimize import minimize

result = minimize(
    fun=objective_function,      # what to minimize
    x0=initial_guess,            # starting point
    method='SLSQP',
    bounds=[(0, 1)] * n_assets,  # each weight 0-1
    constraints=[
        {'type': 'eq', 'fun': lambda x: np.sum(x) - 1.0}  # sum to 1
    ]
)

optimal_weights = result.x
```

## The "Maximize by Minimizing" Trick

Since `minimize()` only minimizes, to **maximize** Sharpe ratio:

```python
def objective(weights):
    return -1 * sharpe_ratio(weights)  # negate it!
```

## Common Gotchas

1. **Local minima** - SLSQP can get stuck. Try different starting points or use equal weights as a safe default.

2. **Check `result.success`** - Always verify the optimizer converged:
   ```python
   if not result.success:
       print(result.message)
   ```

3. **Constraint format** - Must be a list of dicts with `type` and `fun` keys. Easy to mess up.

4. **Numerical precision** - Constraints like `sum(x) == 1` are checked with tolerance. Don't expect exact equality.

5. **No leverage** - If you want short selling, change bounds to `(-1, 1)` or similar.

## Sources

- [SciPy minimize docs](https://docs.scipy.org/doc/scipy/reference/generated/scipy.optimize.minimize.html)
- [SLSQP method reference](https://docs.scipy.org/doc/scipy/reference/optimize.minimize-slsqp.html)
- [Portfolio Optimization with SciPy - Towards Data Science](https://towardsdatascience.com/portfolio-optimization-with-scipy-aa9c02e6b937/)
