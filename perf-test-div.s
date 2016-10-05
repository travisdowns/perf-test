
; test perf overcounting, main loop has nop, imul, dec, jne

GLOBAL _start
_start:
	cmp   QWORD [rsp], 1
	je    .end
	mov   rdx, [rsp+16]       ; argv[1]
	movzx ecx, BYTE [rdx]	; argv[1][0]
	sub   ecx, '0'
	movzx edx, BYTE [rdx+1]   ; argv[1][0]
	cmp   edx, 0
	je    .one_digit
	sub   edx, '0'
	imul  ecx, 10
	add   ecx, edx
.one_digit:
	;mov   eax, 1
	;shl   rax, cl
	mov    eax, 100_000_000
	imul   rax, rcx
	mov edi, 1

.loop:
	idiv rdi
	dec rax
	nop
	jne .loop

.end:
	xor edi, edi
	mov eax, 231    ; exit(0)
	syscall


	
