# Welcome
With this repository I will be writing various programs to calculate fibonacci numbers.
![Fibonacci Spiral](https://upload.wikimedia.org/wikipedia/commons/9/93/Fibonacci_spiral_34.svg)

## Conventions
The fibonacci sequence starts like so:
| **n**    |0|1|2|3|4|5|6| 7| 8| 9|10|11| 12| 13| 14| 15| 16|
|----------|-|-|-|-|-|-|-|--|--|--|--|--|---|---|---|---|---|
| **F(n)** |0|1|1|2|3|5|8|13|21|34|55|89|144|233|377|610|987|

## Fibonacci Journey
Here I document the major steps of the fibonacci programming journey.

### <ins>17-5-2025</ins>
First working example of a fibonacci program (fib_x86_64.asm).
Written in intel ASM.
Accepts 1 input byte through STDIN.
Calculated fibonacci index is 
```math
n=2*in+1
```
Outputs a 64-bit answer in ASCII hex to STDOUT.
Works up to $f(93)$. But printf only works up to $f(91)$.
Results checked visually against https://planetmath.org/listoffibonaccinumbers
###### Example Usage:
``` bash
$ echo -e "\x2E" | ./fib_x86_64 
0xA94FAD42221F2702
$ echo -e "\x2D" | ./fib_x86_64 | xargs printf "%d\n"
4660046610375530309
```

### <ins>25-9-2025</ins>
I decided to switch to python and work from the top down to develop algorithms
then implement them at lower levels as practice.

I set up a testbench that allows up to 1 second for the python algorithm to complete its calculation.

Starting with a recursive implementation in python/fib_rec.py,
It gets to f(35) = 9_227_465

With an iterative implementation in python/fib_iter.py,
I changed the test inputs to grow polynomially.

After f(20_449), the results pass 4_300 digit default limit for integer string conversion.
