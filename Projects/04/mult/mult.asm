// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

    @R2
    M=0
    //The simulator will set R0 and R1 so dont reset those
(LOOP)
    @R1
    D=M
    @END
    D;JEQ
    @R2
    D=M //store the current sum in R2
    @R0
    D=D+M //add the operand to the sum
    @R2
    M=D //store the current sum in memory
    @R1
    M=M-1//take one away to represent having added once
    @LOOP
    0;JMP//jump back to the loop
@END 
    @END //loop forever so it doesn't mess with memory
    0;JMP

