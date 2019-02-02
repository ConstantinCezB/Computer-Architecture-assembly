TITLE Lab2
INCLUDE Irvine32.inc

.data
	myArray DWORD 0001h, 0002h, 0003h, 0004h, 0005h, 0006h
	myArraySize DWORD SIZEOF myArray
	myArrayLength DWORD LENGTHOF myArray
	myByte1 BYTE "a"
	myByte2 BYTE ?,0
	myArray2 SDWORD 10 DUP(-71)

.code	
main PROC
	MOV AL, myByte1
	SUB AL, 20h
	MOV myByte2, AL
	CALL WriteChar
	CALL Crlf

	MOV EAX, myArraySize
	CALL WriteDec 
	CALL Crlf

	MOV EAX, myArrayLength
	CALL WriteDec
	CALL Crlf

	MOV myArray2+4, 11112222h
	MOV EAX, myArray2+4
	CALL WriteHex
	CALL Crlf

	MOV BX, WORD PTR myArray2+6

	call DumpRegs
	exit
main ENDP
END main