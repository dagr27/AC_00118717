org 	100h

section .text
	call 	grafico
	xor 	si, si
	xor 	di, di

    mov 	si, 15d
	mov 	di, 30d
    mov     bx, 120d
	call 	li_vertical

    mov 	si, 90d
	mov 	di, 30d
    mov     bx, 120d
	call 	li_vertical

 	mov 	si, 30d
	mov 	di, 50d
    mov     bx, 70d
	call 	li_vertical

 	mov 	si, 75d
	mov 	di, 50d
    mov     bx, 70d
	call 	li_vertical

 	mov 	si, 30d
	mov 	di, 90d
    mov     bx, 120d
	call 	li_vertical

 	mov 	si, 75d
	mov 	di, 90d
    mov     bx, 120d
	call 	li_vertical

    mov 	si, 15d
	mov 	di, 30d
    mov     bx, 90d
	call 	li_horizontal

	mov 	si, 30d
	mov 	di, 50d
    mov     bx, 75d
	call 	li_horizontal

	mov 	si, 30d
	mov 	di, 70d
    mov     bx, 76d
	call 	li_horizontal

	mov 	si, 30d
	mov 	di, 90d
    mov     bx, 75d
	call 	li_horizontal

	mov 	si, 15d
	mov 	di, 120d
    mov     bx, 31d
	call 	li_horizontal
	
	mov 	si, 75d
	mov 	di, 120d
    mov     bx, 91d
	call 	li_horizontal
	
	call 	kb
	int 	20h

grafico:
    mov	    ah, 00h
	mov	    al, 13h
	int 	10h
	ret

pixel:	
    mov	    ah, 0Ch
	mov 	al, 0101b
	int 	10h
	ret

li_horizontal: 
lupi_horizontal:	
    mov 	cx, 0d
	add 	cx, si
	mov	    dx, di
	call 	pixel
	inc 	si
	cmp 	si, bx
	jne 	lupi_horizontal
	ret

li_vertical:
lupi_vertical:	
    mov 	cx, si
	mov	    dx, 0d
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, bx
	jne 	lupi_vertical
	ret

kb: 	
    mov	    ah, 00h
	int 	16h
	ret

section .data