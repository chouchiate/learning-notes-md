[np] -

** P Class Problem
> A problem which can be solved on polynomial time
>   * All sorting and searching algorithms
>   * verified and solved in polynomial time; easy to solve and verified
>   * trackable problem

** NP Class Problem
> A Problem which cannot be solved on polynomial time but it is verified in polynomial time
>   * Sudoku, Prime factor, scheduling, travelling salesman
>   * verified in polynomial time; hard to solve & easy to verify; exponential time
>   * intrackable problem

P is a subset of NP

## Reduction

A -- Reduce (polynomial time)--> B

> Let A and B are two problems; problem A reduces to problem B IFF there is a way
>   * to solve A by deterministic algorithm
>   * that solves B in polynomial time

Properties
    1. if A is reducible to B and B in P, then A in P
    2. A is not in P implies B is not in P

## NP Hard Problem
> A problem is NP-hard if every problem in NP can be polynomial reduced to it.
>     * Optimization Problem

## NP Complete Problem
> A problem is NP-Complete if it is in NP and it is NP-hard
>   * The class of NP-Complete problem is the intersaction of the NP and NP-hard class
>   * Decision Problem

* All NP-Complete problems are NP-hard; not all NP-hard are NP-complete


## MIT Open Course
```
          --- Super Mario Bros                            -- Partition -- Rectangle Packing
        /                                                /
3SAT --                                  -- Subset Sum --
        \                               /
          --- 3-Dimensional Matching ----- 4 Partition
                                        \
                                         -- Rectangle Packing
                                          \
                                           -- Jigsaw Puzzle

```

P = { problems solveable in polynomial n^O(1) time }
NP = { decision problems (yes or no), solvable in non-deterministic (guess) polynomial time }

* can guess one out of polynomially many options in O(1) time
* if any guess would lead to a 'yes' answer (bias)

## 3SAT
> given boolean formula of the form:
> (X1 | X3 | !X6) & (!X2 | X3 | !X7) & ...
> Xn are called literals
> ( ... ) are called clauses

can you set the variables X1, X2, .... true or false, such that the formula comes out true
(satisfying assignment?)




