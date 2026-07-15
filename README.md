<div align="center">
  <h1>🔗 4-bit Ripple-Carry Adder</h1>
  <p><strong>Structural arithmetic RTL built from a reusable full-adder chain</strong></p>
  <p>
    <img src="https://img.shields.io/badge/HDL-Verilog-2563EB?style=for-the-badge" alt="Verilog" />
    <img src="https://img.shields.io/badge/Architecture-Structural%20RCA-8B5CF6?style=for-the-badge" alt="Structural RCA" />
    <img src="https://img.shields.io/badge/Verification-Exhaustive%20512%2F512-22C55E?style=for-the-badge" alt="Exhaustive 512 of 512 verification" />
    <img src="https://img.shields.io/badge/Flow-Intel%20Quartus-0EA5E9?style=for-the-badge" alt="Intel Quartus" />
  </p>
</div>

---

A structural 4-bit ripple-carry adder built from four 1-bit full adders. The project includes exhaustive functional verification and an Intel Quartus educational implementation flow.

## Design status

| Item | Status |
|---|---|
| Hierarchical RTL | Implemented |
| Exhaustive self-checking testbench | Implemented (512 combinations) |
| Quartus project/reports | Included |
| Timing constraints | Included |

## Specification

| Property | Value |
|---|---|
| Design type | Combinational arithmetic datapath |
| Operand width | 4 bits |
| Function | `{cout, sum} = a + b + cin` |
| Latency | Combinational; no clock cycles |
| Core module | `ripple_carry_adder_4bit` |
| FPGA wrapper | `top_ripple_carry_adder` |

### Interface

| Port | Direction | Width | Description |
|---|---|---:|---|
| `a` | Input | 4 | First operand |
| `b` | Input | 4 | Second operand |
| `cin` | Input | 1 | Carry input |
| `sum` | Output | 4 | Low four result bits |
| `cout` | Output | 1 | Final carry |

## Architecture

```text
cin -> FA0 -> c0 -> FA1 -> c1 -> FA2 -> c2 -> FA3 -> cout
        |sum0       |sum1       |sum2       |sum3
```

Each full adder calculates one result bit. The critical combinational path may pass through all four carry stages; this simple regular structure trades speed for low design complexity.

![Ripple-carry structure](images/circuit_diagram.png)

![RTL implementation](images/ripple_carry_adder_4bit.png)

## Repository structure

```text
.
├── src/
│   ├── full_adder.v
│   ├── ripple_carry_adder_4bit.v
│   └── top_ripple_carry_adder.v
├── sim/
│   ├── ripple_carry_adder_4bit_tb.v
│   └── run.tcl
├── constraints/ripple_carry_adder_4bit.sdc
├── quartus_project/
├── results/sim/
└── images/
```

## Verification

The self-checking testbench exhaustively iterates through:

```text
a   : 0 to 15
b   : 0 to 15
cin : 0 to 1
```

It compares `{cout, sum}` with a 5-bit behavioral reference. Total expected cases: `16 x 16 x 2 = 512`.

```text
Total tests: 512 | Passed: 512 | Failed: 0
```

![Testbench](images/ripple_carry_adder_4bit_tb.png)

![Simulation result](images/stimulate%20%282%29.png)

![Waveform](images/wave.png)

### Run with Questa/ModelSim

```bash
vsim -do sim/run.tcl
```

Or:

```tcl
vlib work
vlog src/full_adder.v src/ripple_carry_adder_4bit.v
vlog sim/ripple_carry_adder_4bit_tb.v
vsim -c work.ripple_carry_adder_4bit_tb -do "run -all; quit -f"
```

## Synthesis and timing

![Quartus RTL Viewer](images/rtl_viewer.png)

![Fmax report](images/fmax_report.png)

![Datasheet report](images/datasheet_report.png)

For a wider or higher-frequency datapath, compare the ripple architecture with CLA or parallel-prefix adders. Do not extrapolate the committed timing report to a different FPGA or ASIC library.
