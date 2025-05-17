# Welcome
With this repository I will be writing various programs to calculate fibonacci numbers.

## Conventions
The fibonacci sequence starts like so:
f(0) = 0
f(1) = 1
f(2) = 1
f(3) = 2
f(4) = 5
f(5) = 8

## Fibonacci Journey
Here I document the major steps of the fibonacci programming journey.

### 17 May 2025 - fib_x86_64
First working example of a fibonacci program. Written in intel ASM.
Accepts 1 input byte through STDIN.
Calculated fibonacci index is 2\*(in)+1
Outputs a 64-bit answer in ASCII hex to STDOUT.
Works up to f(92) (input of 0x2E). But printf only works up to f(91).
Results checked visually against https://planetmath.org/listoffibonaccinumbers
###### Example Usage:
echo -e "\x2D" | ./fib_x86_64 | xargs printf "%d\n"
