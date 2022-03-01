### C Lang C99 Complex Number Operations

* a + b * i
* Modulus of complex number a + b*i 
  * Sqrt(a*2 + b*2)
* Equality
  * a + b*i and c + d*i equals if a = c && b = d
* Addition
  * a + b*i plus c+ d*i equals (a + c) + (b + d)*i
* Multiplication
  * product of a + b*i and c + d*i equals (a*c - b*d) + (ad + bc)*i
* Division
  * dividing a + b*i by c + d*i equals
    * (ac + bd) / (c2 + d2) + ((bc - ad)/(c2 + d2))i
* Conjugate
  * conjugate of a + bi equals
    * a - bi

### Use __STDC_NO_COMPLEX__ macro to check if supported

```
#ifdef __STDC_NO_COMPLEX__
	printf("Complex arithemic is not supported.\n");
#else
	printf("Complex arithmetic is supported.\n");
#endif
```



### Supported Complex and Imaginary Types

```
float _Complex
double _Complex
long double _Complex
flaot _Imaginary
double _Imaginary

```

### Declaring Complex Numbers

```
//complex.h header defines complex as being equivalent to _Complex

double _Complex z1;	// Real and imaginary parts are type double
double complex x1;

```

### Declaring Imaginary Numbers

```

double imaginary ix = 2.4*I;

```

### Complex Functions

```
creal();	//returns the real part of a value of type double complex that's passed as the argument
cimag();	//returns the imaginary part

double real_part = creal(z1);
double imag_part = cimag(z1);

// append lowercase l when working with long double complex values 
creall();
cimagl();

//complex conjugate
conj(); conjf(); conjl();

<complex.h> cpow

```

### Create Complex Number

```
const float complex _Complex _I;
//or
const float complex I;

// I identifier can be undefined by the following
#include <complex.h>
#undef I

doube complex cx = 1.0 + 3.0*I;
double complex cy = 1.0 + 3.0*I;

```































