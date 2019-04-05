include Irvine32.inc

.data
	eVar REAL4 ?
	aVar REAL4 3.2
	cVar REAL4 4.2

	fVar DWORD 20
	bVar DWORD 2
	dVar DWORD 2

; e = f - ( (a/b) x (c + d) )
; e , a , c are single point precision numbers
; f , b , d are double - word integers

; 20 - ( (3.2/2) x (4.2 + 2) ) = 10.2

.code
main proc

	; (a/b) = 1.6
	FLD aVar
	FIDIV bVar
	CALL WriteFloat
	CALL Crlf
	CALL Crlf

;====================================
	;st			(a/b)
;====================================

	; (c+d) = 6.2
	FLD cVar
	FIADD dVar
	CALL WriteFloat
	CALL Crlf
	CALL Crlf

;====================================
	;ST			(c+d)
	;st(1)		(a/b)
;====================================

	; ((a/b) x (c+d)) = 9.92
	FMUL ST, ST(1)
	CALL WriteFloat
	CALL Crlf
	CALL Crlf

;====================================
	;ST			(c+d) x (a/b)
	;st(1)		(a/b)
;====================================

	; f - ((a/b) x (c+d)) = 10.08
	FILD fVar
	FSUB ST, ST(1)
	CALL WriteFloat
	CALL Crlf
	CALL Crlf

;====================================
	;ST			f - ((a/b) x (c+d))
	;ST(1)		(c+d) x (a/b)
	;st(2)		(a/b)
;====================================
	
	; e = f - ((a/b) x (c+d))   ; e = 10.08
	FSTP eVar
	CALL WriteFloat
	CALL Crlf
	CALL Crlf

	exit
main ENDP
END main

