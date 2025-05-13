  AREA armEx, CODE, READONLY
  EXPORT load
load
  LDR r8, =SOURCE
  LDR r0, [r8] Load to register r0
  LDR r1, [r8, #4] Load to register r1
  mul r7,r0,r1 Multiply 2 register value and save in r7
store
  LDR r8, =dest Load Data into r8
  STR r7, [r8] write r7 content into r8
  AREA destination, DATA, READWRITE
dest
  SPACE 32
AREA blockData, CODE, READONLY
SOURCE ;source data
  DCD 0x0000AAAA, 0x0000BBBB
end