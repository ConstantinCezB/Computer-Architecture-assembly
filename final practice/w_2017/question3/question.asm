; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

include Irvine32.inc

.data

aVar REAL4 33.4
eVar REAL4 12.5
fVar REAL4 ?

bVar SDWORD 40
dVar SDWORD 25

.code
main proc

	;part 1
	FLD aVar
	FLD aVar
	FMUL
	FCOS 

	;part2
	FLDPI
	FSIN
	FMUL ST,ST
	FIMUL bVar

	;part3
	FADD ST(1), ST

	;part4
	FILD dVar
	FLD eVar
	FLD eVar
	FMUL
	FMUL eVar
	FSUB ST(1), ST
	FSTP fVar

	;part5
	FDIV 
	FCHS
	FSTP F


	exit
main ENDP

END main

