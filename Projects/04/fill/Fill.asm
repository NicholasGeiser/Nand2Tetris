// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
    @8191
    D=A
    @R0//put 8191 into R0, need to run through 8192 times and 1 is out of the loop
    M=D
(WHITE)//make the whole screen white
    D=0
    @SCREEN
    M=0//make that section of the screen white
    @R0
    D=D-M//start by making it negative because we add 8191 at the start
(WLOOP)
    @R0
    D=D+M//get D back to the counting number
    @SCREEN
    D=D+1//increment D 
    A=A+D//Use the incremented D to get the next address
    M=0//make the pixels white for this section
    @R0
    D=D-M//subtract 8191 and then jump if it is less than zero
    @WLOOP//when it hits zero it will continue to KEYB
    D;JLT
(KEYB)//tests if a key is pressed, turns the screen black or white accordingly
    @KBD//the memory address of the keyboard input
    D=M
    @WHITE
    D;JEQ//jump back to the start and set the screen white
(BLACK)//set the whole screen black
    D=0
    @SCREEN
    M=-1//set this section black, -1 is all 1's
    @R0
    D=D-M
(BLOOP)//This works the same as WLOOP
    @R0
    D=D+M
    @SCREEN
    D=D+1
    A=A+D
    M=-1
    @R0
    D=D-M
    @BLOOP
    D;JLT
    @KEYB//jump back up to see if a key is still pressed or to write white
    0;JMP

