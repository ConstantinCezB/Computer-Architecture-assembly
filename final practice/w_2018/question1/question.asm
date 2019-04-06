; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

include Irvine32.inc

.data
vector DWORD 1, 2, 3, 5, 4
nVar DWORD 5

.code
main proc
	MOV eax, 0
	MOV ESI, OFFSET vector
	push ESI
	push nVar
	CALL FindMax

	CALL WriteDec
	CALL Crlf


	exit
main ENDP

FindMax proc
	;this is is to point and the begenning of the stack
	push ebp
	MOV ebp, esp

	;loading the variables (order depends on how they were pushed)
	MOV esi, [ebp + 12] ; this is the vector address
	MOV ecx, [ebp + 8]	; this is the  size of array

	; base case and what it does
	CMP ecx, 1
	JNE else_statment
		MOV eax, [esi]
		jmp endif_statment
	else_statment:
		MOV ebx, [esi]
		ADD ESI, 4
		dec ecx
		push esi
		push ecx
		CALL FindMax
		cmp ebx, eax
		jbe endif_statment
		MOV eax, ebx

	; this is the end statment
	endif_statment:
		pop ebp
		ret 8 ; 4-bits per argument

FindMax ENDP

END main

