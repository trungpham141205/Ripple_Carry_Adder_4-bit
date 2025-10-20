# Ripple_Carry_Adder_4bit

This project implements a 4-bit Ripple Carry Adder (RCA) using Verilog HDL.
It extends the Full Adder design by cascading four 1-bit full adders, forming a 4-bit arithmetic circuit capable of performing binary addition on two 4-bit numbers with carry propagation.

The project demonstrates a complete digital design flow, including RTL design, functional verification, logic synthesis, and timing analysis using Intel Quartus Prime and ModelSim/QuestaSim.



1. Specification

Objective: To design and verify a 4-bit Ripple Carry Adder with

Inputs:

            A[3:0], B[3:0] – 4-bit binary numbers

            Cin – 1-bit carry input

Outputs:

            Sum[3:0] – 4-bit result

            Cout – 1-bit carry output

The Ripple Carry Adder performs: 

            Sum = A + B + Cin

Circuit diagram:


![Circuit Diagram](https://github.com/trungpham141205/Ripple_Carry_Adder_4-bit/blob/main/images/circuit_diagram.png)



2. Behavioral Description

Behavioral RTL description of Ripple Carry Adder written in Verilog.


![Behavioral Model](https://github.com/trungpham141205/Ripple_Carry_Adder_4-bit/blob/main/images/ripple_carry_adder_4bit.png)



3. Verification

The design was verified through a self-checking Verilog testbench, iterating through all possible input combinations of A, B, and Cin.

Simulation performed using QuestaSim.

Testbench Features:

Loops through all 4-bit combinations (A, B, Cin).

Auto-checks output with expected values.

Displays PASS/FAIL results in console.

![Simulation Result](https://github.com/trungpham141205/Ripple_Carry_Adder_4-bit/blob/main/images/ripple_carry_adder_4bit_tb.png)

Simulation Result:

All 512 possible input cases (16×16×2) were successfully verified with 0 failed cases.

![Simulation Result](https://github.com/trungpham141205/Ripple_Carry_Adder_4-bit/blob/main/images/stimulate%20(2).png)

![Simulation Result](https://github.com/trungpham141205/Ripple_Carry_Adder_4-bit/blob/main/images/stimulate.png)



4. Simulation & Debug

Tool: QuestaSim

Waveform Simulation

Waveform shows propagation of carry and sum bits through the adder chain, confirming correct sequential carry behavior.

![Waveform Simulation](https://github.com/trungpham141205/Ripple_Carry_Adder_4-bit/blob/main/images/wave.png) 



5. Synthesis

Tool Used: Intel Quartus Prime

Objective:
Translate the RTL Verilog description into a logic gate-level netlist and verify the synthesis results.

RTL Viewer:
Shows a hierarchical structure of four Full Adders connected in series, each consisting of XOR, AND, and OR gates.

![RTL Viewer](https://github.com/trungpham141205/Ripple_Carry_Adder_4-bit/blob/main/images/rtl_viewer.png)



6. Static Timing Analysis

Tool: Intel Quartus Prime

Timing and resource utilization are analyzed post-synthesis using Quartus STA tool.

The design meets all timing requirements with positive slack, indicating successful synthesis and implementation.

Check Fmax Summary

![Fmax Report](https://github.com/trungpham141205/Ripple_Carry_Adder_4-bit/blob/main/images/fmax_report.png)

Datasheet Report

![Datasheet](https://github.com/trungpham141205/Ripple_Carry_Adder_4-bit/blob/main/images/datasheet_report.png)



7. Conclusion

The 4-bit Ripple Carry Adder was successfully:

Designed using modular Verilog HDL.

Simulated and verified with full test coverage.

Synthesized and analyzed in Quartus.

Ready for FPGA implementation.

This project extends the Full Adder concept to multi-bit arithmetic, illustrating carry propagation and paving the way for more advanced adders such as Carry Lookahead Adders or Parallel Prefix Adders.