# MIPS CPU — Logisim-evolution

A digital logic implementation of a MIPS-style CPU datapath built in Logisim-evolution 4.1.0. This project explores computer architecture at the circuit level, using registers, combinational logic, multiplexers, and memory components.

## Architecture

- 32-bit datapath and program counter (PC)
- Register file with 32 numbered register positions
- Arithmetic logic unit (ALU) with arithmetic, bitwise logic, shifting, and comparison components
- Instruction memory (ROM) and data memory (RAM), each configured for 32-bit data
- Instruction-field splitting and jump-address construction
- Multiplexers, decoders, and signal routing for datapath selection

## Repository

| File | Description |
| --- | --- |
| `mips_cpu.circ` | Original Logisim-evolution circuit design |

## Getting started

1. Install [Logisim-evolution](https://github.com/logisim-evolution/logisim-evolution/releases) (the circuit was saved in version 4.1.0).
2. Clone this repository or download `mips_cpu.circ`.
3. Open the circuit using **File > Open** in Logisim-evolution.
4. Inspect the `main` circuit, its input pins, the register file, ALU, and memory blocks.
5. Use the simulation controls to explore signal propagation and register updates.

## Engineering concepts

Digital logic design, sequential and combinational circuits, register-based storage, instruction decoding, memory organization, and CPU datapath design.

## Verification status

The original circuit is preserved in this repository. The architecture description is based on inspection of the saved circuit; instruction-set coverage and execution correctness have not been independently verified. No simulation test results are claimed.

## MIPS assembly exercises

The [`assembly/`](assembly/) directory contains nine original MIPS assembly exercises covering register usage, array indexing, control flow, recursion, stack frames, and function calls.

| File | Intended operation |
| --- | --- |
| [`mips1.asm`](assembly/mips1.asm) | Center an array by subtracting its integer mean |
| [`mips2.asm`](assembly/mips2.asm) | Test inclusive range membership using alternative implementations |
| [`mips3.asm`](assembly/mips3.asm) | Recursive factorial |
| [`mips4.asm`](assembly/mips4.asm) | Double array elements in place |
| [`mips5.asm`](assembly/mips5.asm) | Sum array elements |
| [`mips6.asm`](assembly/mips6.asm) | Calculate an integer mean using a sum routine |
| [`mips7.asm`](assembly/mips7.asm) | Remove array elements within a specified range |
| [`mips8.asm`](assembly/mips8.asm) | Shift array elements left in memory |
| [`mips9.asm`](assembly/mips9.asm) | Call two functions and divide their results |

These are independent educational source examples, not a verified test suite for the Logisim CPU. Some require helper routines, an entry-point test harness, or corrections before assembly/execution. For example, `mips2.asm` contains two definitions of `between`, and the recursive factorial and array-removal bounds require review. Source files are preserved as submitted; no execution results are claimed.
