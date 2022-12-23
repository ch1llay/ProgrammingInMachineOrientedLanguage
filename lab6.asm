.MODEL flat, stdcall
OPTION CASEMAP:NONE ;чувствительность к регистру
include kernel32.inc
include masm32.inc
includeLib kernel32.lib
includeLib masm32.lib


.DATA
ZaprosY DB 13,10,'Input Y',13,10,0
ZaprosX DB 13,10,'Input X',13,10,0

Result DB 'Result='
ResStr DB 16 DUP (' '),0

.DATA?
Y WORD ?
X WORD ?
Z DWORD ?
Buffer DB 10 DUP (?)
inbuf DB 100 DUP (?)


.CODE


Start:
Invoke StdOut,ADDR ZaprosY ;Вывод запроса
Invoke StdIn,ADDR Buffer,LengthOf Buffer ; Ввод строки
Invoke atol,ADDR Buffer ;Строка в число EAX
mov WORD PTR Y,AX ;Запись числа по адресу Y

Invoke StdOut,ADDR ZaprosX ;Вывод запроса
Invoke StdIn,ADDR Buffer,LengthOf Buffer ; Ввод строки
Invoke atol,ADDR Buffer ;Строка в число EAX
mov WORD PTR X,AX ;Запись числа по адресу X


; —-----------------—
; Текст программы
; —-----------------—
;Z = Y/4 - X
mov ax, Y
shr ax, 2

mov bx, X
sub ax, bx
mov Z, eax

Invoke dwtoa,Z,ADDR ResStr ;Число в строку
Invoke StdOut,ADDR Result ;Вывод строки
Invoke ExitProcess,0 ;Выход с кодом 0
End Start

