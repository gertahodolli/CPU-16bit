`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2024 04:27:21 PM
// Design Name: 
// Module Name: ALU_w_BonusOp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_w_BonusOp(
    input [15:0] A,
    input [15:0] B,
    input [2:0] Operacioni,
    input AInvert,
    input BNegate,
    output Zero,
    output Overflow,
    output CarryOut,
    output [15:0] Result
    );
    
    wire[15:0] ALUResult;
    wire[15:0] SLLt;
    wire[15:0] SRAt;
    
    ALU16 ALUKryesore (A, B, Operacioni, AInvert, BNegate, Zero, Overflow, CarryOut, ALUResult);
    
    SLL sllF (A, B, SLLt);
    SRA sraF (A, B, SRAt);
    
    mux3n1 muxBonus (ALUResult, SLLt, SRAt, Operacioni, Result);
    
endmodule
