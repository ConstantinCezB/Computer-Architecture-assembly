; Author: Cezar Begu 104808191

include Irvine32.inc

.data
string BYTE 128 DUP (0)
numberOFChar DWORD 0
numberOfUpper DWORD 0
; Messages used as display for this program
message BYTE 'Enter a string of at most 128 characters: ', 0
message1 BYTE 'Here it is, with all lowercases and uppercases flipped, and in reverse order:', 0
message2 BYTE 'There are ', 0
message3 BYTE ' upper-case letters after conversion.', 0
message4 BYTE 'There are ', 0
message5 BYTE ' characters in the string.', 0

.code
main proc
	; Prompts the user to enter a string according to specifications
	MOV EDX, OFFSET message
	CALL WriteString
	
	; Reads the string from the user
	MOV EDX, OFFSET string
	MOV ECX, SIZEOF string - 1
	CALL ReadString

	; Convers the upper letter to lower case letters
	MOV EDX, 0
	.WHILE EDX < ECX
		MOV AL, [string + EDX]
		.IF AL != 0
			; Converts lower to upper
			.IF AL >= 'a' && AL <= 'z'
				INC numberOfUpper
				SUB AL, 20h
				MOV [string + EDX], AL
			; Converts upper to lower
			.ELSEIF AL >= 'A' && AL <= 'Z'
				ADD AL, 20h
				MOV [string + EDX], AL
			.ENDIF
			INC numberOFChar
			INC EDX
		.ELSE
			MOV EDX, ECX
		.ENDIF
	.ENDW

	; Lets the user know that the output bellow is the ans
	CALL Crlf
	MOV EDX, OFFSET message1
	CALL WriteString
	CALL Crlf

	; Prints the string entered in reverse order
	; number 200 can be used since the max string can be 128 (much lower then 200)
	MOV EDX, numberOFChar
	DEC EDX
	.WHILE EDX != 200
		MOV AL, [string + EDX]
		CALL WriteChar

		.IF EDX != 0
			DEC EDX
		.ELSE 
			MOV EDX, 200
		.ENDIF
	.ENDW
	CALL Crlf
	CALL Crlf

	; Prints the number of upper case letters
	MOV EDX,  OFFSET message2
	CALL WriteString
	MOV EAX, numberOfUpper
	CALL WriteDec
	MOV EDX,  OFFSET message3
	CALL WriteString
	CALL Crlf

	; Prints the number of characters in the inputed string
	MOV EDX,  OFFSET message4
	CALL WriteString
	MOV EAX, numberOFChar
	CALL WriteDec
	MOV EDX,  OFFSET message5
	CALL WriteString
	CALL Crlf

	exit
main endp
end main