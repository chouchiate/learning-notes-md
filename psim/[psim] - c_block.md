# [psim] - c block, simplified c block learning notes

### C block

#### Variable/Function Definitions
* defines and global variable definitions
```c
#include <Stdlib.h>
#include <String.h>

// inputs
double a;
double b;

// output
double z;

// step counter
int g_nStepCount=0;
```

#### OpenSimUser Fcn
* run one time at start of simulation
```c
/*
 definition
 void OpenSimUser(const char *szId, const char * szNetlist, int nInputCount, int nOutputCount, int *pnError, char * szErrorMsg)
*/

a = 0;
b = 0;
z = 0;

// In case of error, uncomment next two lines. Set *pnError to 1 and copy Error message to szErrorMsg
//*pnError=1;
//strcpy(szErrorMsg, "Place Error description here.");
```



#### RunSimUser Fcn
* run at each time step of simulation
```c

/**
 * @brief void RunSimUser(double t, double delt, double *in, double *out, int *pnError, char * szErrorMsg)
 * @param double t - simulation time
 * @param double delt - time step of simulation
 * @param double *in - input array, size of array depends on number of input defined
 * @param double *out - output array, size of array depends on number of output defined
 * @param int *pnError - 
 * @param char *szErrorMsg - 
 * @return 
 * 
 */

a = in[0];
b = in[1];

if (a >= 1) {
	a = 1;
} else if (a <= 0) {
	a = 0.00001;
}
// z = b;
// z = a + b;
 z = sin(w * t * a * b);
out[0] = z;
out[1] = t;

// In case of error, uncomment next two lines. Set *pnError to 1 and copy Error message to szErrorMsg
//*pnError=1;
//strcpy(szErrorMsg, "Place Error description here.");

```

#### CloseSimUser fcn
* execute at the end of simulation
```c
/**
 * @brief void CloseSimUser(const char *szId)
 * @param const char *szId
 * @return void
 * 
 * 

// no definition

```


### sine wave generation (simplified c block)

```c
int n = 0;

float w = 2 * 3.1419526;
int freq[4];
float amp[4];
float temp = 0;

amp[0] = x2;
amp[1] = x3;
amp[2] = x4;
amp[3] = x5;
//amp[4] = x6;

// build array of frequencies
for (n = 0; n < 4; n++) {
  freq[n] = x1 * (n + 1);
}

// build sine wave from predefined frequency components
for (n = 0; n < 4; n++) {
  temp = temp + amp[n] * sin(w * t * freq[n]);
}

y1 = temp;
```