include Irvine32.inc

.data
question1 BYTE "What is the value of C: ", 0
question2 BYTE "What is the value of D: ", 0
dispayFormula BYTE "Z = (A + B) - (C - D)", 0
separator BYTE "   ;   ", 0
A DWORD 543210d
B DWORD 3210d
Cval DWORD ?
D DWORD ?
Z DWORD ?
 
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
	MOV D, EAX
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
	MOV EAX, B
	ADD Z, EAX
	CALL WriteInt
	CALL WriteString
	MOV EAX, Cval
	CALL WriteInt
	CALL WriteString
	SUB EAX, D
	SUB Z, EAX
	MOV EAX, D
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