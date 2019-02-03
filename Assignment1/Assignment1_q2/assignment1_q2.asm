include Irvine32.inc

.data
bigEndianString BYTE "bigEndian: ", 0
bigEndian BYTE 089h, 0ABh, 0CDh, 0EFh
littleEndianString BYTE "littleEndian: ", 0
littleEndian DWORD ?

.code
main proc
	mov al,BYTE PTR bigEndian+0
	mov ah,BYTE PTR bigEndian+1
	mov bl,BYTE PTR bigEndian+2
	mov bh,BYTE PTR bigEndian+3

	mov BYTE PTR littleEndian+0,bh
	mov BYTE PTR littleEndian+1,bl
	mov BYTE PTR littleEndian+2,ah
	mov BYTE PTR littleEndian+3,al

	MOV EDX, OFFSET bigEndianString
	CALL WriteString
	MOV EAX, DWORD PTR bigEndian
	CALL WriteHex
	CALL Crlf

	MOV EDX, OFFSET littleEndianString
	MOV EAX, littleEndian
	CALL WriteString
	CALL WriteHex
	CALL Crlf
	


	exit
main endp
end main