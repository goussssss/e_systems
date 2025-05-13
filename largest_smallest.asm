        AREA    LARGEST, CODE, READONLY
        ENTRY                           ; Mark first instruction to execute

START   
        MOV     R5, #6                  ; Initialize counter to 6 (N = 7)
        LDR     R1, =VALUE1             ; Load the address of the array into R1
        LDR     R2, [R1], #4            ; Load first value from array into R2
        
LOOP    
        LDR     R4, [R1], #4            ; Load next value from array into R4
        CMP     R2, R4                  ; Compare current largest with new value
        BHI     LOOP1                   ; If R2 > R4, skip update
        MOV     R2, R4                  ; If R2 < R4, update R2 with new largest
        
LOOP1   
        SUBS    R5, R5, #1              ; Decrement counter
        CMP     R5, #0                  ; Check if counter is zero
        BNE     LOOP                    ; Repeat loop if not zero
        
        LDR     R4, =RESULT             ; Load the address of RESULT
        STR     R2, [R4]                ; Store the largest value in RESULT
        NOP                             ; No operation
        
back    
        B       back                    ; Infinite loop

; Array of 32-bit numbers (N=7)
VALUE1  
        DCD     0x44444444
        DCD     0x22222222
        DCD     0x11111111
        DCD     0x33333333
        DCD     0xAAAAAAAA
        DCD     0x88888888
        DCD     0x99999999

        AREA    DATA2, DATA, READWRITE  ; Area to store result
RESULT  
        DCD     0x0                     ; Initialize result with 0
        
        END
