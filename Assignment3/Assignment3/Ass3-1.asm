include C:\Irvine\Irvine32.inc

.data	
	message1 BYTE "What do you want to do now? > ", 0
	message2 BYTE "What is the size N of Vector? > ", 0
	message3_1 BYTE "What are the ", 0
	message3_2 BYTE " values in Vector? > ", 0
	message4 BYTE "Size of Vector is N = ", 0
	message5 BYTE "Vector = ", 0
	message6 BYTE "Stack not empty", 0
	message7 BYTE "Stack is empty", 0
	message8 BYTE "Vector is ", 0
	message9 BYTE "Stack is ", 0
	message10 BYTE "before ArrayToStack", 0
	message11 BYTE "after ArrayToStack", 0
	message12 BYTE "I am exiting... Thank you Honey... and Get lost...", 0
	message13 BYTE "What do you want to do now? > ", 0
	errorMessage1 BYTE "Already loaded", 0
	errorMessage2 BYTE "Empty stack", 0
	errorMessage3 BYTE "Load vector first!", 0
	errorMessage4 BYTE "Number must be bigger then 0!", 0 
	vector DWORD 100 DUP(0)
	vectorSize DWORD 0
	stackToPrint DWORD LENGTHOF vector DUP(0)
	isStackEmptyBool BYTE 1
	vactorHasValues BYTE 0
	space BYTE " ", 0

.code

DoSpace PROC USES edx
	mov edx, OFFSET space
	call WriteString
	; call Crlf
DoSpace ENDP
	
main proc
	
	do_while:	
		MOV edx, OFFSET message13
		CALL WriteString
		CALL ReadInt
		CALL Crlf
		CMP eax,  -1
		JE end_do

		cmp eax, 0
		JNE next_check
		CALL Option0
		next_check:
		cmp eax, 1
		JNE next_check1

	;Option 1 : loads array into stack + ui
		CMP vactorHasValues, 0 
		JE error3
		CMP isStackEmptyBool, 0 
		JE error1

		CALL Crlf
		MOV edx, OFFSET message8
		CALL WriteString
		CALL PrintVector
		MOV edx, OFFSET message10
		CALL WriteString
		CALL Crlf

		;Logic
		CALL ArrayToStack
		CALL CopyInverseToStackToPrint
		CALL EmptyVector
		;End Logic

		MOV edx, OFFSET message9
		CALL WriteString
		CALL PrintStackToPrint
		MOV edx, OFFSET message11
		CALL WriteString
		CALL Crlf

		MOV edx, OFFSET message8
		CALL WriteString
		CALL PrintVector
		MOV edx, OFFSET message11
		CALL WriteString
		CALL Crlf
		MOV isStackEmptyBool, 0
		CALL IsStackEmpty
		CALL Crlf
		CALL Crlf
		CALL DoSpace
		JMP end_if1

		error1:
		MOV edx, OFFSET errorMessage1
		CALL WriteString
		CALL Crlf
		CALL Crlf

		end_if1:
	;end option 1

		next_check1:
		cmp eax, 2
		JNE next_check2

	;Option 2 : loads stack into array + UI
		CMP vactorHasValues, 0 
		JE error3
		CMP isStackEmptyBool, 1
		JE error2


		CALL Crlf
		MOV edx, OFFSET message9
		CALL WriteString
		CALL PrintStackToPrint
		MOV edx, OFFSET message10
		CALL WriteString
		CALL Crlf

		;Logic
		CALL StackToArray
		CALL EmptyStackToPrint
		;End Logic

		MOV edx, OFFSET message8
		CALL WriteString
		CALL PrintVector
		MOV edx, OFFSET message11
		CALL WriteString
		CALL Crlf

		MOV isStackEmptyBool, 1
		CALL IsStackEmpty
		CALL Crlf
		CALL Crlf
		JMP end_if2
	
		error2:
		MOV edx, OFFSET errorMessage2
		CALL WriteString
		CALL Crlf
		CALL Crlf
		JMP end_if2
				
		error3:
		MOV edx, OFFSET errorMessage3
		CALL WriteString
		CALL Crlf
		CALL Crlf
		JMP end_if2

		end_if2:
	;End option 2

		next_check2:

		JMP do_while
	end_do:
		MOV edx, OFFSET message12
		call WriteString
		call Crlf

	exit
main endp

; promts user to enter the vector
Option0 PROC USES esi eax ebx ecx edx
	MOV edx, OFFSET message2
	CALL WriteString

	CALL ReadInt
	MOV vectorSize, eax
	CMP vectorSize, 1
	JL errorOption1

	MOV edx, OFFSET message3_1
	CALL WriteString

	CALL WriteDec

	MOV edx, OFFSET message3_2
	CALL WriteString

	;Taking in the values for the vector
	MOV ecx, 0
	MOV ebx, 0
	do_while_Read:	
		CMP ebx,  vectorSize
		JE end_do_Read

		CALL ReadDec
		MOV [vector + ecx], eax

		ADD ecx, TYPE vector
		INC ebx
		JMP do_while_Read
	end_do_Read:

	CALL Crlf
	MOV edx, OFFSET message4
	CALL WriteString
	MOV eax, vectorSize
	CALL WriteDec
	CALL Crlf

	MOV edx, OFFSET message5
	CALL WriteString
	CALL PrintVector
	CALL Crlf

	CALL IsStackEmpty
	CALL Crlf
	CALL Crlf
	MOV isStackEmptyBool, 1
	MOV vactorHasValues, 1
	JMP end_option1

	errorOption1:
	CALL Crlf
	MOV edx, OFFSET errorMessage4
	CALL WriteString
	CALL Crlf
	CALL Crlf

	end_option1:
	RET
Option0 ENDP

; displays if the stack is empty or not
IsStackEmpty PROC 
	CMP isStackEmptyBool, 1
	JE is_empty
	MOV edx, OFFSET message6
	CALL WriteString
	JMP end_if_empty
	is_empty:
	MOV edx, OFFSET message7
	CALL WriteString
	end_if_empty:
	RET
IsStackEmpty ENDP

;prints the vector
PrintVector PROC 
	MOV ecx, 0
	MOV ebx, 0
	do_while_Print:	
		CMP ebx,  vectorSize
		JE end_do_Print

		MOV eax, [vector + ecx]
		CALL WriteDec
		MOV eax, ' '
		CALL WriteChar

		ADD ecx, TYPE vector
		INC ebx
		JMP do_while_Print
	end_do_Print:
	RET
PrintVector ENDP

; prints the emulated stack (only used for siplay and not storage)
PrintStackToPrint PROC 
	MOV ecx, 0
	MOV ebx, 0
	do_while_Print:	
		CMP ebx,  vectorSize
		JE end_do_Print

		MOV eax, [stackToPrint + ecx]
		CALL WriteDec
		MOV eax, ' '
		CALL WriteChar

		ADD ecx, TYPE vector
		INC ebx
		JMP do_while_Print
	end_do_Print:
	RET
PrintStackToPrint ENDP

;replaces all values with 0
EmptyVector PROC
	MOV ecx, 0
	MOV ebx, 0
	do_while_Empty:	
		CMP ebx, vectorSize
		JE end_do_Empty

		MOV [vector + ecx], 0

		ADD ecx, TYPE vector
		INC ebx
		JMP do_while_Empty
	end_do_Empty:
	RET
EmptyVector ENDP

; movest the array values to a stack
ArrayToStack PROC
	POP edx
	MOV ecx, 0
	MOV edi, 0
	MOV EBX,vectorSize
	MOV ESI, OFFSET vector

	do_while_PUSH:	
		CMP edi, EBX
		JE end_do_PUSH

		MOV eax, [ESI + ecx]
		PUSH eax

		ADD ecx, TYPE vector
		INC edi
		JMP do_while_PUSH
	end_do_PUSH:
	PUSH edx
	RET
ArrayToStack ENDP

;moves the stack values to a array
StackToArray proc
	POP	edi
	MOV EBX, vectorSize
	MOV eax, EBX 
	MOV edx, TYPE vector
	MUL edx
	SUB eax, TYPE vector
	POP ecx 
	POP ecx
	MOV ESI, OFFSET vector
	do_while_POP:	
		POP ecx
		MOV [ESI + eax], ecx

		CMP eax, 0
		JE end_do_POP

		SUB eax, TYPE vector
		JMP do_while_POP
	end_do_POP:
	PUSH edi
	RET
StackToArray ENDP

;used to reverse the fake stack so that it can emulate the real one
CopyInverseToStackToPrint proc
	POP ebx

	MOV ecx, 0
	MOV edx, 0
	do_while_PUSH:	
		CMP edx, vectorSize
		JE end_do_PUSH

		MOV eax, [vector + ecx]
		PUSH eax

		ADD ecx, TYPE vector
		INC edx
		JMP do_while_PUSH
	end_do_PUSH:

	MOV ecx, 0
	MOV edx, 0
	do_while_POP:	
		CMP edx, vectorSize
		JE end_do_POP
		
		POP eax
		MOV [stackToPrint + ecx], eax
		
		ADD ecx, TYPE vector
		INC edx
		JMP do_while_POP
	end_do_POP:
	PUSH ebx
	RET
CopyInverseToStackToPrint ENDP

;emptis the fake stack
EmptyStackToPrint PROC
	MOV ecx, 0
	MOV ebx, 0
	do_while_Empty:	
		CMP ebx, vectorSize
		JE end_do_Empty

		MOV [stackToPrint + ecx], 0

		ADD ecx, TYPE vector
		INC ebx
		JMP do_while_Empty
	end_do_Empty:
	RET
EmptyStackToPrint ENDP

end main
