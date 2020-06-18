org 	100h

section .text

	mov 	dx, msg
	call 	w_strng

	xor 	si, si 	
	mov bl,0
	mov bh,0

lupi:	
        call 	kb
        cmp 	al, "$"
        je	print
        mov	[300h+si], al 
        sub al,48
        mov ah,0
        add bl,al
        inc 	si
        jmp 	lupi

print:
        mov 	dx, nl
        call	w_strng
        mov	byte [300h+si], "$"
        mov 	dx,msgp
        call 	w_strng
        mov		ax,0
        mov		al,bl
        mov		cl,5d
        div		cl
        cmp		al,10d
        mov		dx,msg1
        je		seeme
        cmp		al,9d
        mov		dx,msg2
        je		seeme
        cmp		al,8d
        mov		dx,msg3
        je		seeme
        cmp		al,7d
        mov		dx,msg4
        je		seeme
        cmp		al,6d
        mov		dx,msg5
        je		seeme
        cmp		al,5d
        mov		dx,msg6
        je		seeme
        cmp		al,4d
        mov		dx,msg7
        je		seeme
        cmp		al,3d
        mov		dx,msg8
        je		seeme
        cmp		al,2d
        mov		dx,msg9
        je		seeme
        cmp		al,1d
        mov		dx,msg10
        je		seeme


texto:	
        mov 	        ah, 00h
        mov	        al, 03h
        int 	        10h
        ret

kb: 	
        mov	        ah, 1h
	int             21h
	ret

w_strng:
        mov	        ah, 09h
	int             21h
	ret

seeme:
	call 	w_strng
	call 	kb	
	int 	20h



section .data

msg 	db 	"Ingrese los cinco numeros de su carnet: $"
msgp	db	"Su promedio es: $"
msg1	db	"Perfecto solo Dios $"
msg2	db	"Siempre me esfuerzo $"
msg3	db	"Colocho $"
msg4	db	"Muy bien $"
msg5	db	"Peor es nada $"
msg6	db	"En el segundo $"
msg7	db	"Me recupero $"
msg8	db	"Hay salud $"
msg9	db	"Aun se pasa $"
msg10	db	"Solo necesito el 0 $"
nl	db 	0xA, 0xD, "$"
