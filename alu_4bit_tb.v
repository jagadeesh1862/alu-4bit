`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2025 14:32:00
// Design Name: 
// Module Name: alu_4bit_tb
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


module alu_4bit_tb;

    // Testbench signals
    reg  [3:0] A, B;
    reg  [2:0] op;
    wire [3:0] result;
    wire cout, zero;

    // Instantiate the ALU
    alu_4bit uut (
        .A(A),
        .B(B),
        .op(op),
        .result(result),
        .cout(cout),
        .zero(zero)
    );

    // Test procedure
    initial begin
        // Initialize inputs
        A  = 4'b0000;
        B  = 4'b0000;
        op = 3'b000;

        // Open VCD file for waveform
        $dumpfile("alu_4bit_tb.vcd");
        $dumpvars(0, alu_4bit_tb);

        // Test each operation
        $display("Testing 4-bit ALU...");

        // Test Addition (op = 000)
        #10;
        op = 3'b000; A = 4'b0011; B = 4'b0101; // 3 + 5 = 8
        #10;
        $display("Add: A=%b, B=%b, result=%b, cout=%b, zero=%b", A, B, result, cout, zero);
        A = 4'b1111; B = 4'b0001; // 15 + 1 = 16 (overflow)
        #10;
        $display("Add: A=%b, B=%b, result=%b, cout=%b, zero=%b", A, B, result, cout, zero);

        // Test Subtraction (op = 001)
        #10;
        op = 3'b001; A = 4'b0101; B = 4'b0011; // 5 - 3 = 2
        #10;
        $display("Sub: A=%b, B=%b, result=%b, cout=%b, zero=%b", A, B, result, cout, zero);
        A = 4'b0000; B = 4'b0000; // 0 - 0 = 0
        #10;
        $display("Sub: A=%b, B=%b, result=%b, cout=%b, zero=%b", A, B, result, cout, zero);

        // Test AND (op = 010)
        #10;
        op = 3'b010; A = 4'b1100; B = 4'b1010; // 1100 & 1010 = 1000
        #10;
        $display("AND: A=%b, B=%b, result=%b, cout=%b, zero=%b", A, B, result, cout, zero);
        A = 4'b0000; B = 4'b1111; // 0000 & 1111 = 0000
        #10;
        $display("AND: A=%b, B=%b, result=%b, cout=%b, zero=%b", A, B, result, cout, zero);

        // Test OR (op = 011)
        #10;
        op = 3'b011; A = 4'b1100; B = 4'b1010; // 1100 | 1010 = 1110
        #10;
        $display("OR:  A=%b, B=%b, result=%b, cout=%b, zero=%b", A, B, result, cout, zero);
        A = 4'b0000; B = 4'b0000; // 0000 | 0000 = 0000
        #10;
        $display("OR:  A=%b, B=%b, result=%b, cout=%b, zero=%b", A, B, result, cout, zero);

        // Test XOR (op = 100)
        #10;
        op = 3'b100; A = 4'b1100; B = 4'b1010; // 1100 ^ 1010 = 0110
        #10;
        $display("XOR: A=%b, B=%b, result=%b, cout=%b, zero=%b", A, B, result, cout, zero);
        A = 4'b1111; B = 4'b1111; // 1111 ^ 1111 = 0000
        #10;
        $display("XOR: A=%b, B=%b, result=%b, cout=%b, zero=%b", A, B, result, cout, zero);

        // Test invalid op (e.g., 101)
        #10;
        op = 3'b101; A = 4'b1010; B = 4'b0101;
        #10;
        $display("Invalid op: A=%b, B=%b, result=%b, cout=%b, zero=%b", A, B, result, cout, zero);

        // End simulation
        #10;
        $display("Test completed.");
        $finish;
    end

endmodule
