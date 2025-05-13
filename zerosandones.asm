        AREA    program, CODE, READONLY
        ENTRY
        
        MOV     R0, #0x12345678    ; Load immediate value into R0
        MOV     R1, #0x1F          ; Initialize counter register (31)
        
label   
        MOVS    R0, R0, LSR #1     ; Logical right shift of R0 by 1, updates flags
        ADDCS   R3, R3, #1         ; If Carry Set (1), increment R3 (count ones)
        ADDCC   R4, R4, #1         ; If Carry Clear (0), increment R4 (count zeros)
        
        SUB     R1, R1, #1         ; Decrement counter value
        CMP     R1, #0x00          ; Compare counter with 0
        BNE     label              ; Repeat until counter is 0
        
        END
