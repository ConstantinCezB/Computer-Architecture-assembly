

include Irvine32.inc

.data
	works BYTE 'works', 0
	arr DWORD 0, 1, 2, 3
	sizeVec = LENGTHOF arr * 2
	vec DWORD sizeVec DUP (0)

.code
main proc
	 MOV EDX, 0
	 MOV EBX, 0
	 MOV ESI, OFFSET arr
	 MOV EDI, OFFSET vec

	 ; Creating the first half of the array
	 do_while:

		CMP EDX, SIZEOF arr
		JE end_do
		
		MOV ECX, [ESI + EDX]
		MOV [EDI + EDX], ECX
		

		ADD EDX, TYPE arr
		JMP do_while

	end_do:
	MOV EBX, EDX

	; Creating seccond hakf of the array
	MOV EDX ,SIZEOF arr
	do_while1:
		SUB EDX, TYPE arr
		MOV ECX, [ESI + EDX]
		MOV [EDI + EBX], ECX		 
		ADD EBX, TYPE arr
		CMP EDX, 0
		JE end_do1
		JMP do_while1

	end_do1:


	; Printing the result
	MOV EAX, 0
	MOV EBX, 0
	do_while2:

		CMP EBX, SIZEOF vec
		JE end_do2
		
		MOV EAX, [EDI + EBX]
		CALL WriteDec
		CALL Crlf

		ADD EBX, TYPE arr
		JMP do_while2

	end_do2:

	exit
main endp
end main