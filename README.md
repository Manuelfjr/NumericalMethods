
# NumericalMethods
Repository with implementation of numerical methods

## FirstTest

This material contains a class with root estimation methods.

**Note :** The class will have as argument the stopping criterion

## Usage

- .plot(f, xmin, xmax)

**xmin and xmax:** x-axis range limits, with 50 points being generated

**f :** function of interest for plotting

~~~Python

RootsMeth(10**(-8)).plot(f, xmin, xmax)

~~~

- .bis(a, b, f)

Also known as binary truncation, or Bolzano method, suppose the interval _**a**_ and _**b**_ contains a single root for _**f(x) = 0**_

~~~Python

RootsMeth(10**(-8)).bis(a, b, f)

~~~

- .fpt(a, b, f)

The false position method estimates the "midpoint" of the interval by intersection of a secant line

~~~Python

RootsMeth(10**(-8)).fpt(a, b, f)

~~~

- .nrph(x0, f, df)


- .sct(xn, xn1, f)
