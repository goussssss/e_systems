        AREA    ASCENDING, CODE, READONLY
        ENTRY                           ; Mark first instruction to execute

START   
        MOV     R5, #5                  ; Initialize counter to 5 (N = 6)
        LDR     R0, =A                  ; Load the address of the array into R0

NXTPASS 
        MOV     R4, R5                  ; Initialize inner loop counter

NXTCOMP 
        LDR     R2, [R0]                ; Load current element into R2
        MOV     R1, R2                  ; Copy current value to R1
        ADD     R0, #4                  ; Point to the next element
        LDR     R2, [R0]                ; Load next element
        
        CMP     R1, R2                  ; Compare the two values
        BLS     NOEXG                   ; If in order, skip exchange
        
        STR     R1, [R0], #-4           ; Swap the values (write R1 back)
        STR     R2, [R0], #4            ; Write R2 to previous location

NOEXG  
        SUBS    R4, #1                  ; Decrement inner loop counter
        BNE     NXTCOMP                 ; Continue inner loop if not zero
        
        SUBS    R5, #1                  ; Decrement outer loop counter
        BNE     NXTPASS                 ; Repeat outer loop if not zero

B1      
        B       B1                      ; Infinite loop

; Array of 32-bit numbers (N=6)
A       DCD     0x40000000              ; Array starts at this memory location
        
        END
