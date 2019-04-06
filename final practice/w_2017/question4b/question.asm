; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

include Irvine32.inc

.data
aVar SWORD 5
bVar SWORD 5
cVar SWORD 20
dVar SWORD 4
eVar SDWORD ?


.code
main proc
	MOV EAX, 0
	MOV ebx, 0
	mov ecx, 0
	mov edx,0

	MOV ax, aVar
	CWD				;answer is in DX:AX
	IDIV bVar		;now the answer is stored into ax

	MOV bx, ax		;store the ans into bx

	MOV ax, cVar
	CWD				;answer is in DX:AX
	IDIV dVar		;now the answer is stored into ax
	
	IMUL BX			; now the answer is stored into DX:AX

	movzx ecx, dx
	shl ecx, 16
	MOV cx, ax

	MOV EAX, ECX
	CALL WriteInt
	CALL Crlf


	exit
main ENDP

END main

