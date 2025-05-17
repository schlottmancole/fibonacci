

extern _start
_start:
	; need to read 8-bit input arg from stdin
	mov rdx, 1 ;read 1 bytes
	mov rcx, arg ;to arg
	mov rbx, 0 ;file 0 (stdin)
	mov rax, 3 ;sysread
	int 0x80
	
	;prepare fibonacci
	mov rax, 1
	mov rbx, 0
	mov rcx, [arg] ;put arg into rcx
do:
	add rbx, rax
	add rax, rbx
	dec rcx
	jnz do
end:
	call hexstr ;prepare result string from RAX contents
; call sysprint
	mov rdx, 19 ;length
	mov rcx, prefix ;msg addr
	mov rbx, 1 ;file descriptor (stdout)
	mov rax, 4 ;syswrite
	int 0x80
; return
	mov rax, 1 ;sysexit
	int 0x80   ;call kernel

hexstr:
	;Use CL to count rotations. 8 times we'll rotate left then translate bottom byte
	mov cl, 7
	mov rbx, 0
	mov rdx, 0
hexdo:
	mov rdx, 0
	mov dl, al
	shl dx, 1
	mov bx, [rdx + lookup] ;grab character from lookup
	mov rdx, 0
	mov dl, cl
	shl dl, 1
	mov [rdx + result], bx ;copy to string
	ror rax, 8
	dec cl
	jns hexdo
	ret

section .data
;lookup DB "0123456789ABCDEF"
lookup  DB "000102030405060708090A0B0C0D0E0F"
	DB "101112131415161718191A1B1C1D1E1F"
	DB "202122232425262728292A2B2C2D2E2F"
	DB "303132333435363738393A3B3C3D3E3F"
	DB "404142434445464748494A4B4C4D4E4F"
	DB "505152535455565758595A5B5C5D5E5F"
	DB "606162636465666768696A6B6C6D6E6F"
	DB "707172737475767778797A7B7C7D7E7F"
	DB "808182838485868788898A8B8C8D8E8F"
	DB "909192939495969798999A9B9C9D9E9F"
	DB "A0A1A2A3A4A5A6A7A8A9AAABACADAEAF"
	DB "B0B1B2B3B4B5B6B7B8B9BABBBCBDBEBF"
	DB "C0C1C2C3C4C5C6C7C8C9CACBCCCDCECF"
	DB "D0D1D2D3D4D5D6D7D8D9DADBDCDDDEDF"
	DB "E0E1E2E3E4E5E6E7E8E9EAEBECEDEEEF"
	DB "F0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF"

arg    DQ 0 ;input arg stored here
prefix DB "0x"
result DB "00000000", "00000000", `\n`
