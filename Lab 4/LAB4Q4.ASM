.MODEL SMALL
.STACK 20
.CODE
START:
CALL READKB
MOV BL,AL
CALL NXTLINE
CALL READKB
MUL BL
MOV BL, AL
CALL NXTLINE
CALL DISP
MOV AH, 4CH
INT 21H
READKB PROC NEAR
MOV AH, 01
INT 21H
CALL ASCHEX
RET
READKB ENDP
ASCHEX PROC NEAR
CMP AL, 3AH
JC SUB30
SUB AL, 07H
SUB30:
SUB AL, 30H
AND AL, 0FH
RET
ASCHEX ENDP
NXTLINE PROC NEAR
MOV AH, 2
MOV DL, 0AH
INT 21H
MOV DL, 0DH
INT 21H
RET
NXTLINE ENDP
DISP PROC NEAR
MOV AL, BL
AND AL, 0F0H
ROR AL, 4
CALL HEXASC
MOV DL, AL
MOV AH, 02
INT 21H
MOV AL, BL
AND AL, 0FH
CALL HEXASC
MOV DL, AL
MOV AH, 02
INT 21H
RET
DISP ENDP
HEXASC PROC NEAR
CMP AL, 07
NUM:
ADD AL, 30H
RET
HEXASC ENDP
END START
