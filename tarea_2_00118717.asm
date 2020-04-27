org 100h

;EJ 1 Carnet= 118717 = 25/6 =4
mov     ax,0000h
add     ax, 1d
add     ax, 1d
add     ax, 8d
add     ax, 7d
add     ax, 1d
mov     ax, 7d
mov     ax, 6d

; 4 = ME RECUPERO
mov     cl, "M"
mov     [203h], cl

mov     cl, "e"
mov     [204h], cl

mov     cl, "R"
mov     [206h], cl

mov     cl, "e"
mov     [207h], cl

mov     cl, "c"
mov     [208h], cl

mov     cl, "u"
mov     [209h], cl

mov     cl, "p"
mov     [20Ah], cl

mov     cl, "e"
mov     [20Bh], cl

mov     cl, "r"
mov     [20Ch], cl

mov     cl, "o"
mov     [20Dh], cl

;Ej 2
                mov     ax, 0000h
                mov     al, 2d
                mov     bx, 210h
                mov     cx, 2d
esti:        mul     cx
                mov     [bx], ax
                cmp     ah, 00h
                ja      segundo
                je      primero
primero:        add     bx, 2h
                jmp     siguiente
primero:        add     bx, 1h
siguiente:      cmp     bx, 21Fh
                jb      esti

;Ej 3
                    mov     ax, 0000h 
                    mov     bx, 0000h
                    mov     cx, 0000h
                    mov     ax, 0d
                    mov     di, 0d
                    mov     cx, 0015d
                    mov     dx, 1d

    fib:      mov    [di + 220h], ax
    
                    inc     di
    
                    mov     bx,ax
                    add     ax, dx
                    mov     dx, bx

                    loop    fib

int 20h



