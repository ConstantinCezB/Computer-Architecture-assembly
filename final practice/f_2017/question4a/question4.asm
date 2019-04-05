include Irvine32.inc

; E = ( A % B ) x ( C x D )

.data
	; creating the variables
	aVar SBYTE 10
	bVar SBYTE 5
	cVar SBYTE 2
	dVar SBYTE 20
	eVar SDWORD 0


.code
main proc
	MOV EAX, 0
	MOV EBX, 0
	MOV ECX, 0
	MOV EDX, 0

	;mutiplication and stuff
	MOV al, aVar
	CBW				;This is now 16 bits
	IDIV bVar		;answer is now 8 bits

	IMUL cVar		;This is now 16 bit's and the answer is stored in AX
	IMUL dVar		;Now the answer is stored in DX:AX so 32 bits


	CALL WriteInt
	CALL Crlf
	CALL Crlf

	MOVZX ECX, DX
	SHL ECX, 16
	OR ECX, EAX
	
	MOV eVar, ECX
	MOV EAX, eVar

	; displaying the variables
	CALL WriteInt
	CALL Crlf
	CALL Crlf

	exit
main ENDP
END main