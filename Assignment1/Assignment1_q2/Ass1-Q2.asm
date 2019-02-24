include Irvine32.inc

.data
bigEndianString BYTE "bigEndian: ", 0
littleEndianString BYTE "littleEndian: ", 0
bigEndian BYTE 089h, 0ABh, 0CDh, 0EFh
littleEndian DWORD ?
bigEndianVar DWORD ? 


.code
main proc

	mov al, bigEndian+0
	mov ah, bigEndian+1
	mov bl, bigEndian+2
	mov bh, bigEndian+3

	mov bigEndian+4, bh
	mov bigEndian+5, bl
	mov bigEndian+6, ah
	mov bigEndian+7, al

	mov bigEndian+8, al
	mov bigEndian+9, ah
	mov bigEndian+10, bl
	mov bigEndian+11, bh

	MOV EDX, OFFSET bigEndianString
	CALL WriteString
	MOV EAX, bigEndianVar
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