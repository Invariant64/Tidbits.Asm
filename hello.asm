; template for masm for DOS (16 bit) programming using simplified segment definition
title Hello

.model small
.stack 100h

.data
    promptMessage db 'Hello BJUT x86 MASM assembly programming!', '$'
    inputBuffer db 0ffh, ?, 0ffh dup(?), '$'

.code
start:
    mov ax, @data
    mov ds, ax

    lea dx, promptMessage
    call WriteString

    call Crlf

    lea dx, inputBuffer
    call ReadString

    call Crlf

    lea dx, inputBuffer + 2
    add dl, [inputBuffer + 1]
    call EndString

    lea dx, inputBuffer + 2
    call WriteString

    call Terminate


; Append $ to end of the string
EndString proc
    mov bx, dx
    mov byte ptr [bx], '$'
EndString endp


; Read a character from standard input
ReadChar proc
    mov ah, 01h
    int 21h
    ret
ReadChar endp


; Write a character to standard output
WriteChar proc
    mov ah, 02h
    int 21h
    ret
WriteChar endp


; Write carry-return line-feed to standard output
Crlf proc
    mov dl, 0dh
    call WriteChar

    mov dl, 0ah
    call WriteChar

    ret
Crlf endp


; Read an integer from standard input
ReadInt proc
    ; TODO
    ret
ReadInt endp


; Write an integer to standard output
WriteInt proc
    ; TODO
    ret
WriteInt endp


; Read a string from standard input
ReadString proc
    mov ah, 0ah
    int 21h
    ret
ReadString endp


; Write a string to standard output
WriteString proc
    mov ah, 09h
    int 21h
    ret
WriteString endp


; Terminate the program
Terminate proc
    mov ah, 4ch
    int 21h
    ret
Terminate endp


    end start