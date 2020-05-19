org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
    call    phrase2
    call    phrase3
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret
;Frase 1
w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 3d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase:	mov 	di, 3d
loop:	mov 	cl, [msg+di-3d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	loop
	ret
;Frase 2
w_chart:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

m_cursrr:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 9d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase2:	mov 	di, 38d
loop2:	mov 	cl, [phr+di-38d]
	call    m_cursrr
	call 	w_chart
	inc	di
	cmp 	di, len2
	jb	loop2
	ret


;Frase 3
w_char3:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

m_cur3:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 15d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase3:	mov 	di, 3d
loop3:	mov 	cl, [phr3+di-3d]
	call    m_cur3
	call 	w_char3
	inc	di
	cmp 	di, len3
	jb	loop3
	ret

section .data
msg	db 	"Sali con tu mujer"
len 	equ	$-msg+3d
phr	db 	"Que te perdone Dios, yo no lo voy a hacer"
len2 	equ	$-phr+38d
phr3	db 	"Los perdi a los dos y a la misma vez"
len3 	equ	$-phr+3d