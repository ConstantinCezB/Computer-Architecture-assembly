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
	CALL ReadDec
	MOV Cval, EAX
	MOV EDX, OFFSET question2
	CALL WriteString
	CALL ReadDec
	MOV D, al

	MOV EDX, OFFSET dispayFormula
	CALL WriteString
	CALL Crlf

	MOV EDX, OFFSET separator
	MOV EAX, A
	MOV Z, EAX
	CALL WriteDec
	CALL WriteString 

	MOVZX EAX, B
	ADD Z, EAX
	CALL WriteDec
	CALL WriteString

	MOV EAX, Cval
	CALL WriteDec
	CALL WriteString

	MOVZX EDX, D
	SUB EAX, EDX
	SUB Z, EAX
	MOV EAX, EDX
	CALL WriteDec
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