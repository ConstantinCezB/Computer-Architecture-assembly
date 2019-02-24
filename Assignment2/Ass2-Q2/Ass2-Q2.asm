include Irvine32.inc

.data
string BYTE 128 DUP (0)

.code
main proc
	
	; Reads the string from the user
	MOV EDX, OFFSET string
	MOV ECX, SIZEOF string - 1
	CALL ReadString

	MOV EDX, 0
	.WHILE EDX < ECX
		MOV AL, [string + EDX]
		
		.IF AL != 0
			CALL WriteChar
			CALL Crlf
			INC EDX
		.ELSE
			MOV EDX, ECX
		.ENDIF
	.ENDW

	MOV EDX,  OFFSET string
	CALL WriteString

	exit
main endp
end main