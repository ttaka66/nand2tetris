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

// NOTE: I don't know how to make sure it works correctly.

@SCREEN
  D=A
  @screen_address
  M=D
  @KBD
  D=M
  @BLACK
  D;JNE
(WHITE)
  @screen_address
  D=M
  @24575
  D=D-A
  @0
  D;JGE
  @screen_address
  A=M
  M=0
  @screen_address
  M=M+1
  @WHITE
  0;JMP
(BLACK)
  @screen_address
  D=M
  @24575
  D=D-A
  @0
  D;JGE
  @screen_address
  A=M
  M=-1
  @screen_address
  M=M+1
  @BLACK
  0;JMP
