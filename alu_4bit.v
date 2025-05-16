`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2025 14:29:57
// Design Name: 
// Module Name: alu_4bit
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


module alu_4bit(
    input  [3:0] A,        // 4-bit input A
    input  [3:0] B,        // 4-bit input B
    input  [2:0] op,       // 3-bit operation code
    output reg [3:0] result, // 4-bit result
    output reg cout,       // Carry out
    output reg zero        // Zero flag
);

    always @(*) begin
        // Default values
        result = 4'b0000;
        cout   = 1'b0;
        zero   = 1'b0;

        case (op)
            3'b000: begin // Addition
                {cout, result} = A + B;
            end
            3'b001: begin // Subtraction
                {cout, result} = A - B;
            end
            3'b010: begin // AND
                result = A & B;
                cout   = 1'b0;
            end
            3'b011: begin // OR
                result = A | B;
                cout   = 1'b0;
            end
            3'b100: begin // XOR
                result = A ^ B;
                cout   = 1'b0;
            end
            default: begin // Reserved
                result = 4'b0000;
                cout   = 1'b0;
            end
        endcase

        // Zero flag: set if result is 0
        zero = (result == 4'b0000);
    end

endmodule