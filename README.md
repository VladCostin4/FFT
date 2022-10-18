# FFT
A code written in Octave that deals with polynomial multiplication.

  The code is executed in the main file, "imul.m", which takes as parameter the name of the input file in which we give our program the polynomials we want to be multiplied.
  These are given in the following format :
N M
coef0 coef1 coef2 ... coefN-1
coef0 coef1 coef2 ... coefN-1
, meaning the degree of each polynomial, and on the next rows, the coefficients for x raised to each power from 0 to N - 1, or M - 1 respectively. (The first row corresponds to the first polynomial, etc.)

  The program applies Fast Fourier Transformation ("FFT.m") to decompose and recreate the result polynomial, displaying it in the output file with the same name as the input.
