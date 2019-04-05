include Irvine32.inc

.data
lVar DWORD 3
mVar DWORD 3
nVar DWORD 2

iVar DWORD 1
jVar DWORD 1
kVar DWORD 1

.code
main proc

	MOV eax, 1
	MOV edx, iVar

	do_while_1:
		CMP edx, lVar
		je end_do_while_1
		MOV ebx, jVar

			;statment for do_while_1
			do_while_2:
				CMP ebx, mVar
				je end_do_while_2
				MOV ecx, kVar

					;statment for do_while_2
						do_while_3:
							CMP ecx, nVar
							je end_do_while_3

								;statment for do_while_3
									; Since 42 = 2^1 + 2^3 + 2^5
									MOV esi, eax
									MOV edi, eax
									SHL eax, 1
									SHL esi, 3
									SHL edi, 5
									add eax, esi
									add eax, edi
								;end statment for do_while_3

							inc ecx
							jmp do_while_3
						end_do_while_3:
					;end statment for do_while_2

				inc ebx
				jmp do_while_2
			end_do_while_2:
			;end statment for do_while_1

		inc edx
		jmp do_while_1
	end_do_while_1:

	CALL WriteDec
	CALL Crlf
	exit
main ENDP
END main