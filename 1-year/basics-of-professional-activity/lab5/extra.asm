ORG 0x500;

ITER: WORD 0x010;
COUNTER: WORD 20;
CUR: WORD ?;
NUMBER: WORD ?;

START: 
CLA;

L:
IN 7;
AND #0x040;
BEQ L;
IN 6;

SXTB;

ST NUMBER;

LD #0x010;
ST ITER;

LD NUMBER;

BPL AWAY;
LD #0x01A;
ST ITER;

AWAY:
LD #20;
ST COUNTER;


CYCLE: 
LD NUMBER;
BPL POSITIVE;
LD -(ITER);
SWAB;
JUMP CONT;
POSITIVE:
LD (ITER)+;
CONT:
ST CUR;

L1:
IN  0x11;
AND #0x040;
BEQ L1;
LD  CUR;
OUT 0x10;

SWAB;
ST CUR;

AND -(COUNTER);
BMI OUTER;

L2:
IN  0x11;
AND #0x040;
BEQ L2;
LD  CUR;
OUT 0x10;

LOOP COUNTER;
JUMP CYCLE;

OUTER: JUMP L;

HLT;

ORG 0x010;
WORD  0x1e00;
WORD  0x0e0e;
WORD  0x3d0f;
WORD  0x7e7f;
WORD  0x7e7e;
WORD  0x5e7e;
WORD  0x3d6f;
WORD  0x0e1f;
WORD  0x0e0e;
WORD  0x000e;