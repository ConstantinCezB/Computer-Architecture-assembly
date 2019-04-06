; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

include Irvine32.inc

.data
aVar WORD 5
bVar WORD 5
cVar WORD 5
dVar WORD 4
eVar DWORD ?


.code
main proc
	MOV EAX, 0
	MOV EBX, 0
	MOV EDX, 0
	MOV ax, aVar
	MUL bVar		; now the answer is stored in DX:AX
	DIV cVar		; takes the answer from DX:AX and stored it into AX
	MUL dVar		;takes the answer form AX and stores it into DX:AX
	MOVZX ebx, dx	;takes the dx and stores it into the first part of ebx
	SHL ebx, 16		;push the edx
	MOV bx, ax		;puts the ax in the first part of ebx

	MOV EAX, EBX
	CALL WriteDec
	CALL Crlf
	


	exit
main ENDP

END main

