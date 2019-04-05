include Irvine32.inc

; E = ( A x B ) % ( C % D )

.data
	; creating the variables
	aVar WORD 10
	bVar WORD 5		;50

	cVar WORD 2		;25
	dVar WORD 5		;5
	eVar BYTE 0

	;16
	;32		DX:AX
	;16		AX
	;8		AL

.code
main proc
	MOV EAX, 0

	MOV AX, aVar
	MUL bVar		;the answer is 32 bits thus stored in DX:AX
	DIV cVar		;This will take the DX:AX answer and then store it in AX
	DIV dVar		;Since it takes the part from ax and then stores the ans AL

	MOV eVar, al

	MOV EAX,0
	MOV al, eVar

	CALL WriteDec
	CALL Crlf

	exit
main ENDP
END main