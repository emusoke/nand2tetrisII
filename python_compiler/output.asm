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
// function Sys.init
(Sys.init)
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
// go to Sys.main
@Sys.main
0;JMP
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
(LOOP)
// go to LOOP
@LOOP
0;JMP
// function Sys.main
(Sys.main)
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
// go to Sys.add12
@Sys.add12
0;JMP
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
// function Sys.add12
(Sys.add12)
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
