.model flat, c

include msvcrt.inc
includelib msvcrt.lib

.data
	string db 20 dup (?)
	resStr db 20 dup (?)
	firstSpace DD ?
	lastSpace DD ?


.code
FindWords proc
mov ecx, 0
.while ecx < 20
	movsx ebx, byte ptr[offset string + ecx]
	.if ebx  == ' '
		mov firstSpace, ecx
		.break
	.endif
	inc ecx
.endw

mov ecx, 19
.while ecx > 0
	movsx ebx, byte ptr[offset string + ecx]
	.if ebx == ' '
		mov lastSpace, ecx
		.break
	.endif
	dec ecx
.endw

;пишем первое слово
mov ecx, 0
lea esi, resStr
.while ecx < firstSpace
	movsx ebx, byte ptr[offset string + ecx]
	mov [esi], ebx
	inc esi
	inc ecx
.endw

;пишем послднее слово

mov ecx, lastSpace
.while ecx < 20
	movsx ebx, byte ptr[offset string + ecx]
	mov [esi], ebx
	inc esi
	inc ecx
.endw




invoke crt_printf, addr resStr
invoke crt_exit, 0
ret
FindWords endp
main proc
invoke crt_gets, addr string
invoke FindWords
main endp
end