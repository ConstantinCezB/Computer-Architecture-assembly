TITLE Lab2
INCLUDE Irvine32.inc

.data
val1 dword 4040h
val2 dword 1555h
val3 byte "Hello World"

.code	
main PROC
	mov EDX, offset val3
	call WriteString
	call crlf

	mov EAX, val1
	add EAX, val2
	mov ECX, val2
	sub ECX, 500h
	mov EBX, 3000h
	add EAX, EBX
	sub EAX, ECX
	add val2, ECX
	mov EAX, 1111h
	add val1, EAX

	call DumpRegs
	exit
main ENDP
END main