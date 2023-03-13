# Romberg Integration Implementation in MATLAB

This project involves implementing Romberg integration in MATLAB to approximate definite integrals of a given function over a specified interval with an error estimate. The Romberg function is designed to have the form [int,err,ier]=romberg(f,a,b,tol).

## Files

erfderiv.m: This file contains a one-line function to be integrated over the intervals [0, 1] and [0, 3] for computing the error function.

logderiv.m: This file contains a one-line function to be integrated over the interval [1, e], where e = exp(1), for computing the natural logarithm derivative.

pifunc.m: This file contains a one-line function to be integrated over the interval [0, 1] for computing the value of π.

romberg.m: This file contains the main function romberg to implement the Romberg integration method with an error estimate. The input arguments are the function handle f, the limits of integration a and b, and the tolerance tol. The output arguments are the approximate integral int, the error estimate err, and the flag ier indicating if the tolerance was reached. The composite trapezoidal rule is used as the initial approximation with a step size of h = (b-a)/4.

diary: This file contains the output produced by running romberg with the test functions provided for pifunc.m, logderiv.m, and erfderiv.m.

## Usage

To use the romberg function, simply call the function and provide the required input arguments as shown below:

[int,err,ier] = romberg(@f,a,b,tol)

where f is a function handle for the function to be integrated, a and b are the limits of integration, and tol is the error between the last two Romberg approximations.

## Test Functions

The following test functions are provided in the directory:

1. pifunc.m: This function computes the integral over the interval [0, 1] to approximate the value of π.

2. logderiv.m: This function computes the integral over the interval [1, e] to approximate the value of the natural logarithm derivative.

3. erfderiv.m: This function computes the integral over the intervals [0, 1] and [0, 3] to approximate the values of the error function.


To run these test functions, simply call romberg with the provided test functions and a tolerance of tol = 1e-14 as shown below:

[int,err,ier] = romberg(@pifunc,0,1,1e-14)
[int,err,ier] = romberg(@logderiv,1,exp(1),1e-14)
[int1,err1,ier1] = romberg(@erfderiv,0,1,1e-14)
[int2,err2,ier2] = romberg(@erfderiv,0,3,1e-14)

## Output

The romberg function outputs the approximate integral int, the error estimate err, and the flag ier indicating if the tolerance was reached. The output produced by running romberg with the test functions provided for pifunc.m, logderiv.m, and erfderiv.m is contained in the diary file.

## Conclusion

The Romberg integration method is a powerful numerical method for approximating integrals. The implementation of the method in MATLAB can be done using the provided romberg function, which has been designed to handle composite trapezoid rule, extrapolation and error estimation. The romberg function has been tested on three functions with different integration intervals, and it produced good approximations with a tolerance of 1e-14. This project provides a good opportunity to practice programming skills, as well as gain a deeper understanding of numerical integration methods.

## Academic Integrity Statement
Please note that all work included in this project is the original work of the author, and any external sources or references have been properly cited and credited. It is strictly prohibited to copy, reproduce, or use any part of this work without proper attribution and permission from the author.

If you choose to use any part of this work as a reference or resource, you are responsible for ensuring that you do not plagiarize or violate any academic integrity policies or guidelines. The author of this work cannot be held liable for any legal or academic consequences resulting from the misuse or misappropriation of this work.

In summary, any unauthorized copying or use of this work may result in serious consequences, including but not limited to academic penalties, legal action, and damage to personal and professional reputation. Therefore, please use this work only as a reference and always ensure that you properly cite and attribute any sources or references used.
