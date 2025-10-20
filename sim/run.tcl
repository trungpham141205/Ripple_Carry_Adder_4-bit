set OUTPUT_DIR "results/sim"

if { ![file isdirectory $OUTPUT_DIR] } {
    file mkdir $OUTPUT_DIR
}

transcript file ${OUTPUT_DIR}/transcript

cd $OUTPUT_DIR
file delete ../../transcript

vlog ../../src/full_adder.v
vlog ../../src/ripple_carry_adder_4bit.v
vlog ../../sim/ripple_carry_adder_4bit_tb.v

vsim -voptargs="+acc" work.ripple_carry_adder_4bit_tb

add wave *
run -all
wave zoom full