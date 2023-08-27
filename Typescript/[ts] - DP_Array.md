[typescript] - DP Array

* Determine the meaning of the subscript of the DP array: here dp[i] represents the value corresponding to the i-th item
* Determine the recursion formula: it has been given in the title, and the conversion into code is dp[i] = dp[i - 1] + dp[i - 2]
* Determine the DP array initialization value: already given in the title, dp[0] = 0 and dp[1] = 1
* Determine the traversal order: Since we seek dp[n], we traverse from left to right
```typescript
    const fib = (n) => {
        const dp = [0, 1];
        for (let i = 2; i < n; i += 1) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n]
    }

```