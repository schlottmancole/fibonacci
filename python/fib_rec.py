#!/usr/bin/env python
import sys

def fibonacci(n):
    match n:
        case 0: return 0
        case 1: return 1
        case _: return fibonacci(n-1) + fibonacci(n-2)

# input validation
if len(sys.argv) != 2:
    exit("expected one argument")

n = int(sys.argv[1])
print(fibonacci(n))
