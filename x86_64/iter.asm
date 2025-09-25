

extern _start
_start:
	; need to read 8-bit input arg from stdin
	mov edx, 1 ;read 1 bytes
	mov ecx, arg ;to arg
	xor ebx, ebx ;file 0 (stdin)
	mov eax, 3 ;sysread
	int 0x80
	
	;prepare fibonacci
	mov eax, 1
	xor ebx, ebx
	mov ecx, [rel arg] ;put arg into rcx
do:
	add rbx, rax
	add rax, rbx
	dec ecx
	jnz do
end:
	call hexstr ;prepare result string from RAX contents
; call sysprint
	mov edx, 19 ;length
	mov ecx, prefix ;msg addr
	mov ebx, 1 ;file descriptor (stdout)
	mov eax, 4 ;syswrite
	int 0x80
; return
	mov eax, 1 ;sysexit
	int 0x80   ;call kernel

hexstr:
	;Use CL to count rotations. 16 times we'll rotate left then translate bottom byte
	mov cl, 15
	; clear C and D
	xor edx, edx
hexdo:
	mov dl, al  ;lowest nibble to highest
	and dl, 0xF ;isolate lower nibble
	mov bl, [rdx + lookup] ;grab character from lookup
	mov [rcx + result], bl ;copy to string
	ror rax, 4
	dec cl
	jns hexdo
	ret

section .data
lookup DB "0123456789ABCDEF"
arg    DQ 0 ;input arg stored here
prefix DB "0x"
result DB "00000000", "00000000", `\n`
