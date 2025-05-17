
.global _start
.text
_start:
mov $3,%rax
# result in rbx and rcx
mov $1,%rbx
mov $1,%rcx
while:
# we're done if rax is 0
cmp $0,%rax
je done
# check %rax modulo 2
mov %rax,%rdx
and $1,%rdx
je even
# odd case
odd:
add %rcx,%rbx
jmp decrement
#even case
even:
add %rbx,%rcx
decrement:
sub $1,%rax
# keep repeating until rax is 0
jmp while
done:
# result is in %rbx
mov $1,%rax # sys_exit
int $0x80
