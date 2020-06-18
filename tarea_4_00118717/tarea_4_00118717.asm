org 	100h

section .text

	mov 	dx, msg
	call 	w_strng

	xor 	si, si 	;lo mimso que: mov si, 0000h
	mov bl,0
	mov bh,0
lupi:	call 	kb
	cmp 	al, "$"
	je	show

	mov	[300h+si], al ; CS:0300h en adelante
	
	sub al,48
	mov ah,0
	add bl,al
	inc 	si
	jmp 	lupi

show:mov 	dx, nl

	call	w_strng
	mov	byte [300h+si], "$"

	mov 	dx,msgp
	call 	w_strng
	mov		ax,0
	mov		al,bl
	mov		cl,5d
	div		cl

	cmp		al,10d
	mov		dx,msg10
	je		mostrar


	cmp		al,9d
	mov		dx,msg9
	je		mostrar

	cmp		al,8d
	mov		dx,msg8
	je		mostrar

	cmp		al,7d
	mov		dx,msg7
	je		mostrar

	cmp		al,6d
	mov		dx,msg6
	je		mostrar

	cmp		al,5d
	mov		dx,msg5
	je		mostrar

	cmp		al,4d
	mov		dx,msg4
	je		mostrar

	cmp		al,3d
	mov		dx,msg3
	je		mostrar

	cmp		al,2d
	mov		dx,msg2
	je		mostrar

	cmp		al,1d
	mov		dx,msg1
	je		mostrar


texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb: 	mov	ah, 1h
	int 	21h
	ret

w_strng:mov	ah, 09h
	int 	21h
	ret

mostrar:
	call 	w_strng

	call 	kb	; solo detenemos la ejecución
	int 	20h



section .data

msg 	db 	"Ingrese cinco numeros: $"
msgp	db	"Su promedio es: $"
msg10	db	"Perfecto solo Dios $"
msg9	db	"Siempre me esfuerzo $"
msg8	db	"Colocho $"
msg7	db	"Muy bien $"
msg6	db	"Peor es nada $"
msg5	db	"En el segundo $"
msg4	db	"Me recupero $"
msg3	db	"Hay salud $"
msg2	db	"Aun se pasa $"
msg1	db	"Solo necesito el 0 $"

nl	db 	0xA, 0xD, "$"