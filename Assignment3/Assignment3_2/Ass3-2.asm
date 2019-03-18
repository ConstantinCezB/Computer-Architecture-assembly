; Members:
; ---------
; Affan Haq (104808247)
; Ahmad Ouerfelli (104804669)
; Cezar Begu (104808191)
; Zito Namuro (104828980)

TITLE Assignment 3 - Question 2

INCLUDE Irvine32.inc

.data
p_prompt BYTE "What do you want to do? ", 0
p_exit BYTE "Thank you, Sweetey Honey Bun", 0 
p_error BYTE "Get Lost, you Sweetey Honey Bun", 0

.code
main PROC

  mov edx, OFFSET p_prompt
  call WriteString
  call ReadChar
  call WriteChar
  call Crlf

  cmp al, 57h ; 'W'
  je do_output
  cmp al, 77h ; 'w'
  je do_output

  cmp al, 52h ; 'R'
  je do_input
  cmp al, 72h ; 'r'
  je do_input

  mov edx, OFFSET p_error
  jmp end_main

  do_output:
    call ReadDec
    mov ebx, eax
    call HexOutput
    jmp do_exit
  
  do_input:
    call HexInput
    call WriteBin
    call Crlf
    jmp do_exit
  
  do_exit:
    mov edx, OFFSET p_exit

  end_main:
    call WriteString
    call Crlf

  exit
main ENDP

HexOutput PROC USES eax ebx ecx edx
 
  mov ecx, 8
  do_loop:
    rol ebx, 4
    mov dl, bl
    and dl, 0Fh

    cmp dl, 10d
    jl do_else

    add dl, 55 ; 'A'..'F'
    jmp do_display

    do_else:
      add dl, 48 ; '0'..'9'

    do_display:
      mov al, dl
      call WriteChar

  loop do_loop

  mov al, 'h'
  call WriteChar
  call Crlf

  ret
HexOutput ENDP

HexInput PROC USES ebx

  xor ebx, ebx
  do_loop:
    call ReadChar
    call WriteChar
    cmp al, 68h ; 'h' (instead of 0Dh)
    je end_loop

    cmp al, 41h ; 'A'
    jl end_convert
    sub al, 57h

    end_convert:
      and al, 0Fh
      shl ebx, 4
      or bl, al

    jmp do_loop
  end_loop:

  call Crlf
  mov eax, ebx

  ret
HexInput ENDP

END main
