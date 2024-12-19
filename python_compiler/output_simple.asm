// init
@256
D=A
@SP
M=D
// call Sys.init
// set return address label
@simple_function.$ret.0
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
// go to simple_function.Sys.init
@simple_function.Sys.init
0;JMP
(simple_function.$ret.0)
// function simple_function.SimpleFunction.test
(simple_function.SimpleFunction.test)

// Adding 2 local variables
@SP
A=M
M=0
@SP
M=M+1
@SP
A=M
M=0
@SP
M=M+1
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
@R13
M=D
// retAddr = *(endFrame - 5)
@5
D=A
@R13
D=M-D
A=D
D=M
@R15
M=D
// *ARG = pop()
@0
D=A
@ARG
D=D+M
@R14
M=D
@SP
M=M-1
A=M
D=M
@R14
A=M
M=D
// SP = ARG + 1
@ARG
D=M
@SP
M=D+1
// THAT = *(endFrame - 1)
@R13
A=M-1
D=M
@THAT
M=D
// THIS = *(endFrame - 2)
@2
D=A
@R13
A=M-D
D=M
@THIS
M=D
// ARG = *(endFrame - 3)
@3
D=A
@R13
A=M-D
D=M
@ARG
M=D
// LCL = *(endFrame - 4)
@4
D=A
@R13
A=M-D
D=M
@LCL
M=D
// goto retAddr
@R15
A=M
0;JMP
