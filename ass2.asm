section .data

msg db 10,"This is my first assignment"
msglen equ $-msg
msg1 db 10,"hello world",10
msg1len equ $-msg1

%macro display 02
mov eax,04
mov ebx,01
mov ecx,%1
mov edx,%2
int 80h
%endmacro

%macro exit 00
mov eax,01
mov ebx,00
int 80h
%endmacro

section .text

global _start

_start:
	display msg,msglen
	display msg1,msg1len
	exit

