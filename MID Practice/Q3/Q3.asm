

include Irvine32.inc

.data
	Vector DWORD 1 , 1 , 2,3,5,8,13,21,34,55
	bool DWORD 1
	message1 BYTE 'this is not aaa fib lookalike', 0
	message2 BYTE 'this is aaa fib', 0

.code
main proc

	CMP Vector, 2
	JBE else_
		
		MOV EBX, OFFSET Vector
		MOV ESI, TYPE Vector * 2

		do_while:
			CMP ESI, SIZEOF Vector
			JE end_while

				MOV ECX,ESI
				SUB ECX, TYPE Vector * 1
				MOV EDX, ESI
				SUB EDX, TYPE Vector * 2

				MOV EAX, [EBX + ECX]
				ADD EAX, [EBX + EDX]

				CMP EAX, EBX
				JE else_2
					MOV bool, 0
				else_2:

			ADD ESI, TYPE Vector
			JMP do_while
		end_while:




		CMP bool, 0
		JE else_3
			MOV EDX, OFFSET message2
			CALL WriteString
			CALL Crlf
		else_3:
			MOV EDX, OFFSET message1
			CALL WriteString
			CALL Crlf

	JMP if_end
	else_:

	if_end:

	exit
main endp
end main