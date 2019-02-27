

include Irvine32.inc

.data
	Array SDWORD 10, 60, 20, 33, 72, 89, 45, 65, 72, 18
	Threshold SDWORD ?
	Index SDWORD 0
	Sum SDWORD 0

.code
main proc

	CALL ReadInt
	MOV Threshold, EAX

	MOV EAX, Threshold
	MOV ESI, Index
	MOV EBX, Sum
	MOV EDI, OFFSET Array


	do_while:

		CMP ESI, SIZEOF Array
		JAE end_do
		
		cmp [EDI + ESI], EAX
		JL else_
		 ;put statement 1 here
		 ADD EBX, [EDI + ESI]
		 ADD ESI, TYPE Array
		jmp end_if
		else_:
		 ;put statement 2 here
		 MOV [EDI + ESI], EAX
		end_if:
		DEC EAX

		JMP do_while
	end_do:


	exit
main endp
end main