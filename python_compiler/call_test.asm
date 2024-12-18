// init
@256
D=A
@SP
M=D
// call Sys.init
// set return address
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save segments
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// save segments
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// save segments
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// save segments
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// reposition arg
@5
D=A
@SP
D=M-D
@ARG
M=D
// reposition local
@SP
D=M
@LCL
M=D
// go to Sys.init
@Sys.init
0;JMP
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// call SimpleFunction.test
// set return address
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// save segments
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// save segments
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// save segments
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// save segments
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// reposition arg
@7
D=A
@SP
D=M-D
@ARG
M=D
// reposition local
@SP
D=M
@LCL
M=D
// go to SimpleFunction.test
@SimpleFunction.test
0;JMP
// function SimpleFunction.test
(SimpleFunction.test)
// push local 0
@0
D=A
@LCL
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@LCL
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add 
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// not 
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// push argument 0
@0
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
// add 
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 1
@1
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub 
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1
// return 
@LCL
D=M
@endFrame
M=D
// retAddr = *(endFrame - 5)
@5
D=A
@endFrame
D=M-D
@retAddr
M=D
// *ARG = pop()
@0
D=A
@ARG
D=D+M
@target
M=D
@SP
M=M-1
A=M
D=M
@target
A=M
M=D
// SP = ARG + 1
@ARG
D=M
@SP
M=D+1
// THAT = *(endFrame - 1)
@endFrame
A=M-1
D=M
@THAT
M=D
// THIS = *(endFrame - 2)
@2
D=A
@endFrame
A=M-D
D=M
@THIS
M=D
// ARG = *(endFrame - 3)
@3
D=A
@endFrame
A=M-D
D=M
@ARG
M=D
// LCL = *(endFrame - 4)
@4
D=A
@endFrame
A=M-D
D=M
@LCL
M=D
// goto retAddr
@retAddr
A=M
0;JMP
