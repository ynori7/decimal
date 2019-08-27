#include "textflag.h"

// func clz(x int64) (n int64)
TEXT ·clz(SB),4,$0-16
        BSRQ  x+0(FP), AX
        JZ zero
        SUBQ  $63, AX
        NEGQ AX
        MOVQ AX, ret+8(FP)
        RET
zero:
        MOVQ $64, ret+8(FP)
        RET

// func ctz(x uint64) uint64
TEXT ·ctz(SB),4,$0-16
        BSFQ  x+0(FP), AX
        JZ zero
        MOVQ AX, ret+8(FP)
        RET
zero:
        MOVQ $64, ret+8(FP)
        RET

