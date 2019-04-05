; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

include Irvine32.inc

.data
var BYTE "this works", 0

.code
main proc

	; creating the registors needed
	mov ebx, 5
	mov eax, 1
	CDQ
	call Factorial
	call WriteDec
	CALL Crlf

	exit
main ENDP


;push ebx
;return n * fun(n-1)
Factorial PROC 
		;pushing the variables needed in the stack
		push ebx

		;if the base case is reached then just call the ret part with the ans
		cmp ebx, 1
		je endRecursion

		;modifying the variables needed using the registers
		dec ebx
		CALL Factorial

		endRecursion: 
		;take the value of the answer and then return it.
		;the answer will be stored in the 
			pop ebx
			mul ebx
			ret	
Factorial ENDP

END main

