#!/usr/bin/env python
import sys

def fibonacci(n):
    # base cases
    if n < 2: return n

    # iterate for n >= 2
    fib = (1, 0);
    for i in range(n-1):
        fib = (fib[0] + fib[1], fib[0]) 

    return fib[0]

# input validation
if len(sys.argv) != 2: exit("expected one argument")

n = int(sys.argv[1])
print(fibonacci(n))
