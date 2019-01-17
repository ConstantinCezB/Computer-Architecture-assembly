; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

include Irvine32.inc

.code
main proc
	mov	eax,5				
	add	eax,6				

	call dumpregs
	exit
main endp
end main