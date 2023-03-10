.MODEL SMALL
.STACK 20
.DATA
NUM DB 11H, 21H, 31H, 31H, 55H, 45H, 35H, 25H
COUNT DW 0008H
.CODE
START:
MOV AX, @DATA
MOV DS, AX
MOV CX, COUNT
DEC CX
NEXT:
MOV DX, CX
MOV SI, 0000H
REPEAT:
MOV AL, NUM[SI]
CMP AL, NUM[SI + 1]
JC NOEX
XCHG AL, NUM[SI +1]
MOV NUM[SI], AL
NOEX: INC SI
DEC DX
JNZ REPEAT
LOOP NEXT
INT 3
END START
