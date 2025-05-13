        AREA    program, CODE, READONLY
        ENTRY
        
        NUM     DCD     0x90            ; Define constant data as 0x90 (144 in decimal)
        
        MOV     R0, NUM                 ; Load value of NUM into R0
        LSRS    R0, #1                  ; Logical Shift Right by 1 (check LSB)
        BCS     NEXT                    ; Branch to NEXT if Carry (odd number)
        
        MOV     R1, #0xEEEE             ; If even, store 0xEEEE in R1
        B       STOP                    ; Branch to STOP
        
NEXT    
        MOV     R1, #0x1111             ; If odd, store 0x1111 in R1
        
STOP    
        B       STOP                    ; Infinite loop
        
        END
