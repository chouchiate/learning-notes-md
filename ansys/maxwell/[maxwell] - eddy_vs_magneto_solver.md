# [maxwell] - Eddy Current Solver vs Magnetostatic Solver

* All solvers solve both linear and non-linear materials.
*

## Magneto-Static solver vs Eddy Current Solver vs Transient Solver

|Magneto-static Solver|Eddy Current Solver|Transient Solver|
|---|---|---|
|Solve Static Magnetic Field caused by DC current| Solve sinusoidal varying magnetic fields in frequency domain. Skin and proximity effects are also considered | Solve transient magnetic fields caused by time varying electrical sources. Fields due to skin and proximity effects are also considered.|
|Assume steady state DC current & Permanant Magnet as an excitation|Assume steady AC current as an excitation|
|Steady DC current in windings create steady field and static flux linkage| AC Current in windings create steady state AC magnetic field |

## Type of Excitations
1. voltage
  - for transformer
2. current
  - for inductor
3. external
  - for parallel winding

