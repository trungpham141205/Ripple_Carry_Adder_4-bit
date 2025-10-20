// =====================================
// Ripple Carry Adder 4bit - RTL Design
// Author: Pham Quoc Trung
// Date: 2025-10-15
// =====================================

module ripple_carry_adder_4bit(
    input wire [3:0]a,
    input wire [3:0]b,
    input wire cin,
    output wire [3:0]sum,
    output wire cout
);

    wire c[2:0];

    full_adder FA0(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c[0]));
    full_adder FA1(.a(a[1]), .b(b[1]), .cin(c[0]), .sum(sum[1]), .cout(c[1]));
    full_adder FA2(.a(a[2]), .b(b[2]), .cin(c[1]), .sum(sum[2]), .cout(c[2]));
    full_adder FA3(.a(a[3]), .b(b[3]), .cin(c[2]), .sum(sum[3]), .cout(cout));

endmodule