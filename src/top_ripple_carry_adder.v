module top_ripple_carry_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);

    ripple_carry_adder_4bit RCA(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

endmodule