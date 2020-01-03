
SECTION .DATA
;this is for variable declaration

	hello:     db 'Hello world!',10
;db is define byte
	helloLen:  equ $-hello
;helloLen is length of given msg and equ is method to calculate length
;if os is 64 bit then use extended version
SECTION .TEXT


;section test is for code 



	GLOBAL _start 

_start:
	mov eax,4       
	mov ebx,1
	mov ecx,hello        
	mov edx,helloLen    
	int 80h             

	;to terminate the program 
	mov eax,1            
	mov ebx,0      
	int 80h          
