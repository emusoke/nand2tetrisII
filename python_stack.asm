// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq 
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@true1
D;JEQ
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
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq 
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@true2
D;JEQ
@false2
0;JMP
(true2)
@0
D=A-1
@end2
0;JMP
(false2)
@0
D=A
(end2)
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq 
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@true3
D;JEQ
@false3
0;JMP
(true3)
@0
D=A-1
@end3
0;JMP
(false3)
@0
D=A
(end3)
@SP
A=M
M=D
@SP
M=M+1
// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
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
@true4
D;JLT
@false4
0;JMP
(true4)
@0
D=A-1
@end4
0;JMP
(false4)
@0
D=A
(end4)
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 892
@892
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
@true5
D;JLT
@false5
0;JMP
(true5)
@0
D=A-1
@end5
0;JMP
(false5)
@0
D=A
(end5)
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
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
@true6
D;JLT
@false6
0;JMP
(true6)
@0
D=A-1
@end6
0;JMP
(false6)
@0
D=A
(end6)
@SP
A=M
M=D
@SP
M=M+1
// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
//JGT
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@true7
D;JGT
@false7
0;JMP
(true7)
@0
D=A-1
@end7
0;JMP
(false7)
@0
D=A
(end7)
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
//JGT
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@true8
D;JGT
@false8
0;JMP
(true8)
@0
D=A-1
@end8
0;JMP
(false8)
@0
D=A
(end8)
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
//JGT
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@true9
D;JGT
@false9
0;JMP
(true9)
@0
D=A-1
@end9
0;JMP
(false9)
@0
D=A
(end9)
@SP
A=M
M=D
@SP
M=M+1
// push constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 53
@53
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
// push constant 112
@112
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
// neg 
@SP
M=M-1
A=M
D=M
@0
D=A-D
@SP
A=M
M=D
@SP
M=M+1
// and 
@SP
M=M-1
A=M
D=M
@placeholder
M=D
@SP
M=M-1
A=M
D=M
@placeholder
D=D&M
@SP
A=M
M=D
@SP
M=M+1
// push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// or 
@SP
M=M-1
A=M
D=M
@placeholder
M=D
@SP
M=M-1
A=M
D=M
@placeholder
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// not 
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
