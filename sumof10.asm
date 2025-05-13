        AREA    armEx, CODE, READONLY
        EXPORT  load

load    
        LDR     r8, =SOURCE        ; Load address of SOURCE into r8
        LDR     r0, [r8]           ; Load value at SOURCE into r0
        MOV     r1, #0x00          ; Initialize r1 to 0

Loop    
        ADD     r1, r0             ; Add r0 to r1
        SUB     r0, #0x01          ; Decrement r0 by 1
        CMP     r0, #0x00          ; Compare r0 with 0
        BNE     Loop               ; Branch to Loop if r0 is not zero

stop    
        B       stop               ; Infinite loop

        AREA    destination, DATA, READWRITE
dest    
        SPACE   32                 ; Allocate 32 bytes of space

        AREA    blockData, CODE, READONLY
SOURCE  
        DCD     0xA                ; Define a word with value 0xA

        END
