// init
@256
D=A
@SP
M=D
// call Sys.init
// set return address label
@finobacci_elem.$ret.0
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
// go to finobacci_elem.Sys.init
@finobacci_elem.Sys.init
0;JMP
(finobacci_elem.$ret.0)
// function finobacci_elem.Main.fibonacci
(finobacci_elem.Main.fibonacci)

// Adding 0 local variables
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
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
//JLT
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@true1
D;JLT
@false1
0;JMP
(true1)
@0
D=A-1
@end1
0;JMP
(false1)
@0
D=A
(end1)
@SP
A=M
M=D
@SP
M=M+1
// if-goto N_LT_2
@SP
M=M-1
A=M
D=M
@N_LT_2
D;JGT
// go to N_GE_2
@finobacci_elem.Main.fibonacci$N_GE_2

0;JMP
(finobacci_elem.Main.fibonacci$N_LT_2)
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
(finobacci_elem.Main.fibonacci$N_GE_2)
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
// push constant 2
@2
D=A
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
// call Main.fibonacci
// set return address label
@finobacci_elem.Main.fibonacci$ret.1
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
@6
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
// go to finobacci_elem.Main.fibonacci
@finobacci_elem.Main.fibonacci
0;JMP
(finobacci_elem.Main.fibonacci$ret.1)
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
// push constant 1
@1
D=A
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
// call Main.fibonacci
// set return address label
@finobacci_elem.Main.fibonacci$ret.2
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
@6
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
// go to finobacci_elem.Main.fibonacci
@finobacci_elem.Main.fibonacci
0;JMP
(finobacci_elem.Main.fibonacci$ret.2)
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
// function finobacci_elem.Sys.init
(finobacci_elem.Sys.init)

// Adding 0 local variables
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Main.fibonacci
// set return address label
@finobacci_elem.Sys.init$ret.3
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
@6
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
// go to finobacci_elem.Main.fibonacci
@finobacci_elem.Main.fibonacci
0;JMP
(finobacci_elem.Sys.init$ret.3)
(finobacci_elem.Sys.init$END)
// go to END
@finobacci_elem.Sys.init$END

0;JMP
