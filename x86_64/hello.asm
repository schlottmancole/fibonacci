.text
.global _start
_start:
mov $len,%edx #message length
lea msg,%ecx #message ptr
mov $1,%ebx   #file descriptor (stdout)
mov $4,%eax   #sys_write code
int $0x80     #call kernel

mov $0,%ebx   # return code
mov $1,%eax   #sys_exit code
int $0x80     #call kernel

.data
msg:
.ascii "Hello, world!"
len = . - msg
