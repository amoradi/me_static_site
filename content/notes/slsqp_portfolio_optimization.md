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

## Full Example: Optimizing an 8-Stock Portfolio

```python
import numpy as np
import pandas as pd
from scipy.optimize import minimize

# 8 stocks: tech, finance, healthcare, energy, consumer
symbols = ['AAPL', 'MSFT', 'JPM', 'GS', 'JNJ', 'PFE', 'XOM', 'KO']

# Assume prices is a DataFrame of adjusted close prices (dates x symbols)
# prices = get_data(symbols, date_range)

def portfolio_sharpe(weights, prices):
    """Calculate negative Sharpe ratio (for minimization)."""
    # Normalize prices and compute portfolio value
    normalized = prices / prices.iloc[0]
    portfolio_value = (normalized * weights).sum(axis=1)

    # Daily returns
    daily_returns = portfolio_value.pct_change().dropna()

    # Sharpe ratio (annualized)
    mean_return = daily_returns.mean()
    std_return = daily_returns.std()
    sharpe = np.sqrt(252) * (mean_return / std_return)

    return -sharpe  # negative for minimization

# Number of assets
n = len(symbols)

# Initial guess: equal weights
x0 = np.full(n, 1/n)  # [0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125]

# Run optimization
result = minimize(
    fun=portfolio_sharpe,
    x0=x0,
    args=(prices,),
    method='SLSQP',
    bounds=[(0, 1)] * n,  # no short selling
    constraints=[
        {'type': 'eq', 'fun': lambda w: np.sum(w) - 1.0}  # fully invested
    ],
    options={'disp': True}
)

# Check success
if result.success:
    optimal_weights = result.x
    print("Optimal allocation:")
    for sym, weight in zip(symbols, optimal_weights):
        if weight > 0.001:  # only show meaningful allocations
            print(f"  {sym}: {weight:.1%}")
else:
    print(f"Optimization failed: {result.message}")
```

### Sample Output

```
Optimal allocation:
  AAPL: 22.3%
  MSFT: 18.7%
  JNJ: 31.2%
  XOM: 12.4%
  KO: 15.4%
```

Note how the optimizer may zero out some stocks entirely (JPM, GS, PFE in this example) if they don't contribute favorably to the risk-adjusted return.

## Sources

- [SciPy minimize docs](https://docs.scipy.org/doc/scipy/reference/generated/scipy.optimize.minimize.html)
- [SLSQP method reference](https://docs.scipy.org/doc/scipy/reference/optimize.minimize-slsqp.html)
- [Portfolio Optimization with SciPy - Towards Data Science](https://towardsdatascience.com/portfolio-optimization-with-scipy-aa9c02e6b937/)
