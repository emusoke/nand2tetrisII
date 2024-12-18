// init
@256
D=A
@SP
M=D
// call Sys.init
// set return address label
@nest.$ret.0
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
// go to nest.Sys.init
@nest.Sys.init
0;JMP
(nest.$ret.0)
// function nest.Sys.init
(nest.Sys.init)

// Adding 0 local variables
// push constant 4000
@4000
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@0
D=A
@THIS
D=A
@target
M=D
@SP
M=M-1
A=M
D=M
@target
A=M
M=D
// push constant 5000
@5000
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@1
D=A
@THAT
D=A
@target
M=D
@SP
M=M-1
A=M
D=M
@target
A=M
M=D
// call Sys.main
// set return address label
@nest.Sys.init$ret.1
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
// go to nest.Sys.main
@nest.Sys.main
0;JMP
(nest.Sys.init$ret.1)
// pop temp 1
@1
D=A
@5
D=D+A
@target
M=D
@SP
M=M-1
A=M
D=M
@target
A=M
M=D
(nest.Sys.init$LOOP)
// go to LOOP
@LOOP
0;JMP
// function nest.Sys.main
(nest.Sys.main)

// Adding 5 local variables
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
@SP
A=M
M=0
@SP
M=M+1
// push constant 4001
@4001
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@0
D=A
@THIS
D=A
@target
M=D
@SP
M=M-1
A=M
D=M
@target
A=M
M=D
// push constant 5001
@5001
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@1
D=A
@THAT
D=A
@target
M=D
@SP
M=M-1
A=M
D=M
@target
A=M
M=D
// push constant 200
@200
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@LCL
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
// push constant 40
@40
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@LCL
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
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 3
@3
D=A
@LCL
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
// push constant 123
@123
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.add12
// set return address label
@nest.Sys.main$ret.2
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
// go to nest.Sys.add12
@nest.Sys.add12
0;JMP
(nest.Sys.main$ret.2)
// pop temp 0
@0
D=A
@5
D=D+A
@target
M=D
@SP
M=M-1
A=M
D=M
@target
A=M
M=D
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
// push local 2
@2
D=A
@LCL
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@3
D=A
@LCL
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 4
@4
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
A=M
0;JMP
// function nest.Sys.add12
(nest.Sys.add12)

// Adding 0 local variables
// push constant 4002
@4002
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@0
D=A
@THIS
D=A
@target
M=D
@SP
M=M-1
A=M
D=M
@target
A=M
M=D
// push constant 5002
@5002
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@1
D=A
@THAT
D=A
@target
M=D
@SP
M=M-1
A=M
D=M
@target
A=M
M=D
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
// push constant 12
@12
D=A
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
A=M
0;JMP
