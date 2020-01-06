section .data

msg db 10,"This is my first assignment"
msglen equ $-msg
msg1 db 10,"hello world",10
msg1len equ $-msg1

section .text

global _start

_start:
	mov eax,04
	mov ebx,01
	mov ecx,msg
	mov edx,msglen
	int 80h
	
	mov eax,04
	mov ebx,01
	mov ecx,msg1
	mov edx,msg1len
	int 80h
	

	;to exit
	mov eax,01
	mov ebx,00
	int 80h
	
