.MODEL flat, stdcall
OPTION CASEMAP:NONE ;���������������� � ��������
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
Invoke StdOut,ADDR ZaprosY ;����� �������
Invoke StdIn,ADDR Buffer,LengthOf Buffer ; ���� ������
Invoke atol,ADDR Buffer ;������ � ����� EAX
mov WORD PTR Y,AX ;������ ����� �� ������ Y

Invoke StdOut,ADDR ZaprosX ;����� �������
Invoke StdIn,ADDR Buffer,LengthOf Buffer ; ���� ������
Invoke atol,ADDR Buffer ;������ � ����� EAX
mov WORD PTR X,AX ;������ ����� �� ������ X


; �-----------------�
; ����� ���������
; �-----------------�
;Z = Y/4 - X
mov ax, Y
shr ax, 2

mov bx, X
sub ax, bx
mov Z, eax

Invoke dwtoa,Z,ADDR ResStr ;����� � ������
Invoke StdOut,ADDR Result ;����� ������
Invoke ExitProcess,0 ;����� � ����� 0
End Start

