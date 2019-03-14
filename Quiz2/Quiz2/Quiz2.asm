; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

include Irvine32.inc

.data 
	aVar BYTE 10
	bVar BYTE 2
	cVar BYTE 5
	rVar BYTE ?

	aVar1 WORD 10
	bVar1 WORD 2
	cVar1 WORD 5
	rVar1 DWORD ?

.code
main proc
	;lab 54
	MOV eax, 0
	MOV ebx, 0
	MOV ecx, 0
	MOV edx, 0

	MOV al, aVar
	MOV bl, bVar
	MOV cl, cVar
	IMUL bl
	IDIV cl

	MOV rVar, al

	

	CALL WriteDec
	CALL crlf

	;lab 55
	MOV eax, 0
	MOV ebx, 0
	MOV ecx, 0
	MOV edx, 0

	MOV ax, aVar1
	CWD
	MOV bx, bVar1
	IDIV bx
	MOV cx, cVar1
	IMUL cx

	CALL WriteDec
	CALL crlf

	
	;lab 52
	MOV eax, 0
	MOV ebx, 0
	MOV ecx, 0
	MOV edx, 0

	MOV al, aVar
	CBW
	MOV bl, bVar
	IDIV bl
	MOV cl, cVar
	IMUL cl

	CALL WriteDec
	CALL crlf

	exit
main endp
end main