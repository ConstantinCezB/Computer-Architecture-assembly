; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

include Irvine32.inc

.data
Vec DWORD 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
nVar DWORD SIZEOF Vec
sVar DWORD 0
rVar DWORD 0

.code
main proc

	; creating the registors needed

	CALL PrintVector
	CALL Crlf
	CALL Crlf

	MOV eax, OFFSET Vec
	MOV ebx, 0
	MOV ecx, nVar
	SUB ecx, TYPE Vec
	call Recu

	MOV eax, sVar
	CALL WriteDec
	CALL Crlf
	CALL Crlf

	MOV eax, rVar
	CALL WriteDec
	CALL Crlf
	CALL Crlf

	CALL PrintVector
	CALL Crlf
	CALL Crlf


	exit
main ENDP



Recu PROC 
		;pushing the variables needed in the stack
		push ebx ;this is the F value
		push ecx ;this is the n value
		inc rVar

		;if the base case is reached then just call the ret part with the ans
		; to end recursion it needs F > L
		; thus ebx > ecx
		cmp ebx, ecx
		ja endRecursion
		inc sVar

		; swap
		MOV edx, [eax + ebx]
		MOV EBP, [eax + ecx]
		MOV [eax + ebx], EBP
		MOV [eax + ecx], edx
		; end swap

		;modifying the variables needed using the registers
		ADD ebx, TYPE Vec
		SUB ecx, TYPE Vec
		CALL Recu
	
		endRecursion: 
		;take the value of the answer and then return it.
		;the answer will be stored in the 
			pop ecx
			pop ebx
			ret	
Recu ENDP

PrintVector PROC USES ecx edx eax
	MOV ecx, 0
	MOV ebx, 0
	do_while_Print:	
		CMP ebx,  LENGTHOF Vec
		JE end_do_Print

		MOV eax, [Vec + ecx]
		CALL WriteDec
		MOV eax, ' '
		CALL WriteChar

		ADD ecx, TYPE Vec
		INC ebx
		JMP do_while_Print
	end_do_Print:
	RET
PrintVector ENDP

END main

