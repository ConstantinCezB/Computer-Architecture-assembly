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
	MOV ESI, OFFSET Vec						;1
	MOV EDI, ESI
	ADD EDI, nVar
	SUB EDi, 4								;2
	push ESI
	push EDI
	CALL Reverse							;3
	push OFFSET Vec
	push LENGTHOF Vec
	CALL Display							;4
	exit
main ENDP



Reverse PROC 
	;this is is to point and the begenning of the stack
	push ebp
	MOV ebp, esp

	;loading the variables (order depends on how they were pushed)
	MOV esi, [ebp + 12] ; This is the first item of the list
	MOV edi, [ebp + 8]	; This is the last item of the list

	inc rVar
	; base case and what it does
	CMP edi, esi
	jae else_statment
		jmp endif_statment
	else_statment:
		push ESI
		push EDI ;passing the parameters to the swap function
		CALL Swap
		ADD esi, TYPE Vec
		SUB edi, TYPE Vec
		push ESI
		push EDI 
		CALL Reverse		;callinr recursion

	; this is the end statment
	endif_statment:
		pop ebp
		ret 8 ; 4-bits per argument

Reverse ENDP

Swap PROC
	;this is is to point and the begenning of the stack
	push ebp
	MOV ebp, esp

	;loading the variables (order depends on how they were pushed)
	MOV esi, [ebp + 12] ; This is the first item of the list
	MOV edi, [ebp + 8]	; This is the last item of the list

	mov eax, [esi]
	call writedec
	call crlf
	; SWAP LOGIC HERE
	MOV ecx, [esi]
	XCHG ecx, [edi]
	MOV [esi], ecx
	; END SWAP LOGIC
	inc sVar

	pop ebp
	ret 8 ; 4-bits per argument
Swap ENDP

Display PROC  
	;this is is to point and the begenning of the stack
	push ebp
	MOV ebp, esp

	;loading the variables (order depends on how they were pushed)
	MOV esi, [ebp + 12] ; This is the first item of the list
	MOV edi, [ebp + 8]	; this is the size of the list

	MOV ebx, 0
	MOV ecx, 0
	do_while_Print:	
		MOV EAX, ebx
		CMP ebx,  edi
		JE end_do_Print

		MOV eax, [esi + ecx]
		CALL WriteDec
		MOV eax, ' '
		CALL WriteChar

		ADD ecx, TYPE Vec
		INC ebx
		JMP do_while_Print
	end_do_Print:
	pop ebp
	ret 8 ; 4-bits per argument
Display ENDP

END main

