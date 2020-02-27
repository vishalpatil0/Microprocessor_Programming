.model small ;used of data and code segment
;-------------------------------Data segment----------------------------------
.data
m1 db 10,"This is the sine wave$"  ;message declaration   
x dd 0.0                            ;variable declaration
    xad dd 3.0
    sixty dd 30.0
    one80 dd 180.0
    hundred dd 50.0
    count dw 360                    ;for complete one rotation cycle
    xcursor dd 00
    ycursor dt 00
    
    
    row db 0
    col db 0
    x1 dw 0                         ;coloumn
;-----------------------------------code segment----------------------------------------------------
    
.code 
.386  ;80386 processor

main: mov ax,@data
     mov ds,ax
     mov ah,00                  ;set video mode
     mov al,6                   ;640*200 resoolution with color value2
     int 10h                    ;graphic mode
     
     up1:   finit               ;floating point initialization of 386 processor
     fldpi                      ;loading point initialization of 386 processor
     fdiv one80                 ;peroform division of 180with pi value
     fmul x                     ;floating point multiplication  
     fsin                       ;sine function
     fmul sixty                 ;multiply with 60
     fld hundred                ;load 100 value
     fsub st,st(1)              ;perform FP subtraction using stack pointer
     fbstp ycursor              ;set floating point bit pixel
     lea esi,ycursor            ;content of ycursor load into esi
     mov ah,0ch                 ; write graphics pixel
     mov al,05h                 ;pixel value
     mov bh,0                   ;page=0
     mov cx,x1                  ;coloumn(x co-ordinate)
     mov dx,[si]                ;row( y co-ordinate)
     int 10h
     inc x1                     ;increment x1
     fld x                      ;load float point x
     fadd xad                   ;perform floating point addition
     fst x                      ;store x value
     dec count                  ;decrement count
     jnz up1                    ;jump if not zero then go to label up1
     mov ah,09h                   ;display complete string
     lea dx,m1                    ;display m1 message
   int 21h
   
   mov ah,4ch                   ;exit procedure
   int 21h
   end main                     ;end of main program
     