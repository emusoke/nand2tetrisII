// push constant 90
@90
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 2
@2
D=A
@5
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
