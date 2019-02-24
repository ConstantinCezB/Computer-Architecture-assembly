include Irvine32.inc

.data
displayMessage1 BYTE 'Fibonacci sequence with N = ', 0
counter DWORD 0
displayMessage2 BYTE ' is:', 0
sumOfPrevTwo DWORD 0
space BYTE ' ', 0

.code
main proc
	
	; Reads N from user to determine the fib sequence
	CALL ReadDec 
	MOV counter, EAX

	; Writting the message 
	MOV EDX, OFFSET displayMessage1
	call WriteString
	CALL WriteDec
	MOV EDX, OFFSET displayMessage2
	call WriteString

	; Loading space char in register to be displayed before printing fib numbers
	MOV EDX, OFFSET space

	; Initializing the registors
	MOV EAX, 0
	MOV EBX, 1
	MOV ECX, 0
	.WHILE ECX <= counter
		INC ECX

		; Writes the decimal of the fibonacci sequence
		CALL WriteString
		CALL WriteDec 

		MOV sumOfPrevTwo, EAX
		ADD sumOfPrevTwo, EBX
		MOV EAX, EBX
		MOV EBX, sumOfPrevTwo

	.ENDW

	CALL Crlf

	exit
main endp
end main