; Author: Cezar Begu 104808191

include Irvine32.inc

.data
counter DWORD 0
sumOfPrevTwo DWORD 0
space BYTE ' ', 0
; Messages used to display info for the user
displayMessage1 BYTE 'Fibonacci sequence with N = ', 0
displayMessage2 BYTE ' is:', 0

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


	do_while:
		; Loop counter if ECX > counter
		cmp ECX, counter
		ja end_do

		INC ECX

		; Writes the decimal of the fibonacci sequence
		CALL WriteString
		CALL WriteDec 

		; Fib calculations
		MOV sumOfPrevTwo, EAX
		ADD sumOfPrevTwo, EBX
		MOV EAX, EBX
		MOV EBX, sumOfPrevTwo

		jmp do_while
	end_do:



; This is the better way to do it but since the prof wants us to practice this way.
;	.WHILE ECX <= counter
;		INC ECX
;
;		; Writes the decimal of the fibonacci sequence
;		CALL WriteString
;		CALL WriteDec 
;
;		; Fib calculations
;		MOV sumOfPrevTwo, EAX
;		ADD sumOfPrevTwo, EBX
;		MOV EAX, EBX
;		MOV EBX, sumOfPrevTwo
;
;	.ENDW

	CALL Crlf

	exit
main endp
end main