        AREA    SQUARE, CODE, READONLY
        ENTRY                           ; Mark first instruction
        
START   
        LDR     R0, =TABLE1             ; Load start address of Lookup table into R0
        LDR     R1, =7                  ; Load the desired number (7) into R1
        MOV     R1, R1, LSL #0x2        ; Multiply R1 by 4 (each entry is 4 bytes)
        ADD     R0, R0, R1              ; Calculate address of the 7th square in the table
        LDR     R3, [R0]                ; Load square of 7 into R3
        
back    
        B       back                    ; Infinite loop

; Lookup table containing squares of numbers from 0 to 10 (in hex)
TABLE1  
        DCD     0x00000000              ; Square of 0 = 0
        DCD     0x00000001              ; Square of 1 = 1
        DCD     0x00000004              ; Square of 2 = 4
        DCD     0x00000009              ; Square of 3 = 9
        DCD     0x00000010              ; Square of 4 = 16
        DCD     0x00000019              ; Square of 5 = 25
        DCD     0x00000024              ; Square of 6 = 36
        DCD     0x00000031              ; Square of 7 = 49
        DCD     0x00000040              ; Square of 8 = 64
        DCD     0x00000051              ; Square of 9 = 81
        DCD     0x00000064              ; Square of 10 = 100

        END
