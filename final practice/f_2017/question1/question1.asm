; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

include Irvine32.inc

.data
var BYTE "return: ", 0
var1 BYTE "push: ", 0

.code
main proc

	; creating the registors needed
	mov ebx, 3 ;this represents the n
	mov ecx, 1 ;this represents the k
	mov eax, 0 ;this is the total sum

	call Recu
	call WriteDec
	CALL Crlf

	exit
main ENDP


;push ebx
;return n * fun(n-1)
Recu PROC 
;============================================================================================== This part is for tracing only
			;pop eax
			;push eax
			;mov edx, OFFSET var1
			;call WriteString
			;call WriteDec
			;CALL Crlf
			;CALL Crlf
			;MOV eax, ebx
			;call WriteDec
			;CALL Crlf
			;MOV eax, ecx
			;call WriteDec
			;CALL Crlf
			;CALL Crlf		
;=========================================================================================== left call
		;pushing the variables needed in the stack
		push ebx
		push ecx

		;if the base case is reached then just call the ret part with the ans
		cmp ebx, ecx
		je endRecursion
		cmp ecx, 0
		je endRecursion

		;modifying the variables needed using the registers
		dec ebx
		CALL Recu

;============================================================================================ right call
		;pushing the variables needed in the stack
		pop ecx
		pop ebx
		push ebx
		push ecx

		;if the base case is reached then just call the ret part with the ans
		cmp ebx, ecx
		je endRecursion
		cmp ecx, 0
		je endRecursion

		;modifying the variables needed using the registers
		dec ebx
		dec ecx
		CALL Recu
;=========================================================================================== end

		endRecursion: 
		;take the value of the answer and then return it.
		;the answer will be stored in the 
			pop ecx
			pop ebx
			
			; comparing to take into account what should be added (this should be used if we only want the end of the recursion tree)
			cmp ebx, ecx
			je calculate
			cmp ecx, 0
			je calculate
			jmp finishLine
			
			
			calculate:
			INC EAX

			finishLine:
;============================================================================================== This part is for tracing only
			;pop eax
			;push eax
			;mov edx, OFFSET var
			;call WriteString
			;call WriteDec
			;CALL Crlf
			;CALL Crlf
			;MOV eax, ebx
			;call WriteDec
			;CALL Crlf
			;MOV eax, ecx
			;call WriteDec
			;CALL Crlf
			;CALL Crlf	


			ret	
Recu ENDP

END main

