# 4-Bit ALU in Verilog

A 4-bit Arithmetic Logic Unit (ALU) designed in Verilog, capable of performing addition, subtraction, AND, OR, and XOR operations. The project includes a testbench for verification and waveform outputs analyzed with GTKWave.

## Features
- Inputs: Two 4-bit inputs ( A , B ), 3-bit operation code ( op )
- Outputs: 4-bit result, carry-out ( cout ), zero flag ( zero )
- Operations:
  -  op=000 : Addition
  -  op=001 : Subtraction
  -  op=010 : AND
  -  op=011 : OR
  -  op=100 : XOR
-   Tools  : Xilinx Vivado 2023.2, GTKWave

## Project Structure
-  src/alu_4bit.v : ALU module
-  testbench/alu_4bit_tb.v : Testbench
-  waveforms/alu_4bit_tb.vcd : Waveform data
-  waveforms/screenshots/ : Waveform images
-  docs/alu_diagram.png : ALU block diagram

## Setup Instructions
1. Install Xilinx Vivado (2023.2 or later).
2. Create a new Vivado project and add  src/alu_4bit.v  and  testbench/alu_4bit_tb.v .
3. Run behavioral simulation (Flow Navigator > Run Simulation > Run Behavioral Simulation).
4. Execute  run all  to simulate.
5. View waveforms in Vivado or open  waveforms/alu_4bit_tb.vcd  in GTKWave:
      bash
   gtkwave waveforms/alu_4bit_tb.vcd
