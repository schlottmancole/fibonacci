all:
	nasm -g -O0 -f elf64 fib_x86_64.asm -o elf
	ld elf -o fib_x86_64
	rm elf
