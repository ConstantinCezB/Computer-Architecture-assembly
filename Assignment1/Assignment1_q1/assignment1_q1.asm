include Irvine32.inc

.data
question1 BYTE "What is the value of C: ", 0
question2 BYTE "What is the value of D: ", 0
dispayFormula BYTE "Z = (A + B) - (C - D)", 0
separator BYTE "   ;   ", 0
A DWORD 543210d
B WORD 3210d
Cval DWORD ?
D BYTE ?
Z DWORD ?
temp DWORD ? 
 
.code
main proc
	MOV EDX, OFFSET question1
	CALL WriteString
	CALL ReadInt
	MOV Cval, EAX
	CALL Crlf
	MOV EDX, OFFSET question2
	CALL WriteString
	CALL ReadInt
	MOV temp, EAX
	MOV al, BYTE PTR temp
	MOV BYTE PTR D, al
	CALL Crlf

	MOV EDX, OFFSET dispayFormula
	CALL WriteString
	CALL Crlf
	CALL Crlf

	MOV EDX, OFFSET separator
	MOV EAX, A
	MOV Z, EAX
	CALL WriteInt
	CALL WriteString

	MOV temp, 0h
	MOV AX, B
	MOV WORD PTR temp, AX
	MOV EAX, temp
	ADD Z, EAX
	CALL WriteInt
	CALL WriteString

	MOV EAX, Cval
	CALL WriteInt
	CALL WriteString

	MOV temp, 0
	MOV AL, D
	MOV BYTE PTR temp, al
	SUB EAX, temp
	SUB Z, EAX
	MOV EAX, temp
	CALL WriteInt
	CALL Crlf
	CALL Crlf

	MOV EAX, Z
	CALL WriteBin
	CALL Crlf
	CALL WriteDec
	CALL Crlf
	CALL WriteHex
	CALL Crlf

	exit
main endp
end main