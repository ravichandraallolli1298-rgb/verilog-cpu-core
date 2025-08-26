# 19-bit Verilog CPU Core

This project is a **19-bit CPU core** implemented in Verilog HDL.  
It demonstrates the basic working of a custom CPU, including instruction fetch, decode, execution, and register operations.  
Simulation is done using **Icarus Verilog**, and results are viewed using **GTKWave**.

---

## Features
- 19-bit architecture  
- **Program Counter (PC)** for instruction sequencing  
- **Instruction Memory** for program storage  
- **Register File** for operand storage  
- **ALU (Arithmetic Logic Unit)** for arithmetic and logic operations  
- Waveform verification with `.vcd` output  

---

## Project Structure
src/ → All Verilog source files
testbench/ → Testbench files for simulation
simulationfile/ → waveforms

---

## How to Run
1. Install **Icarus Verilog** and **GTKWave**.  
2. Open terminal in the project directory.  
3. Compile and run:
   ```bash
   iverilog -o cpu_sim src/*.v testbench/*.v
   vvp cpu_sim
   gtkwave cpu.vcd
