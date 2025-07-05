ORG 0x03CC
TEST_NUM1:  WORD 0x001
RRES1:      WORD ?
MCRES1:     WORD ? ; 0x3CE

TEST_NUM2:  WORD 0x002
RRES2:      WORD ?
MCRES2:     WORD ? ; 0x3D1

TEST_NUM3:  WORD 0xFFFF
RRES3:      WORD ?
MCRES3:     WORD ? ; 0x3D4

TEST1:      WORD ? ; 0x3D5
TEST2:      WORD ?
TEST3:      WORD ?
RESULT:     WORD ? ; 0x3D8

OV_SAVED_R: WORD ?
OV_SAVED_M: WORD ?

START:

    ; ------- block1 ------- 

    LD TEST_NUM1
    PUSH
    CALL MOV2
    POP
    ST RRES1

    LD TEST_NUM1
    WORD 0x93CE
    BVS V1
    JUMP O1
V1: LD #0x1
O1: LD #0x0
    ST OV_SAVED_M

    LD RRES1
    PUSH 
    LD MCRES1
    PUSH
    CALL CHECK_RES
    POP
    ST TEST1
    POP

    ; ------- block2 ------- 

    LD TEST_NUM2
    PUSH
    CALL MOV2
    POP
    ST RRES2

    LD TEST_NUM2
    WORD 0x93D1
    BVS V2
    JUMP O2
V2: LD #0x1
O2: LD #0x0
    ST OV_SAVED_M

    LD RRES2
    PUSH
    LD MCRES2
    PUSH
    CALL CHECK_RES
    POP
    ST TEST2
    POP

    ; ------- block3 ------- 

    LD TEST_NUM3
    PUSH
    CALL MOV2
    POP
    ST RRES3

    LD TEST_NUM3
    WORD 0x93D4
    BVS V3
    JUMP O3
V3: LD #0x1
O3: LD #0x0
    ST OV_SAVED_M

    LD RRES3
    PUSH
    LD MCRES3
    PUSH
    CALL CHECK_RES
    POP
    ST TEST3
    POP

    ; -------- sum -------- 

    LD TEST1
    AND TEST2
    AND TEST3
    ST RESULT

    HLT

TMP:    WORD ?
CHECK_RES: ; takes 2 numbers from stack, comparing them and ov_saved returns 1 number
        LD (SP+1)
        CMP (SP+2)
        BEQ OK1
        LD #0x0
        JUMP OUT1

OK1:    LD #0x1 
OUT1:    ST TMP

        LD OV_SAVED_M
        CMP OV_SAVED_R
        BEQ OK2
        LD #0x0
        JUMP OUT2

OK2:    LD TMP
OUT2:   ST (SP+1)
        RET


MOV2:
        LD (SP+1)
        ASL
        ST (SP+1)
        BVS OV1
        JUMP OV0
OV1:    LD #0x1
OV0:    LD #0x0
        ST OV_SAVED_R
        RET
