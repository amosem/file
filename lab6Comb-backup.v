/*******************************************************************************/
/*Program Name: lab6Comb.v */
/*Description: Verilog description and test bench for a combinational circuit*/
/*Author: Eithne Amos */
/*Person number: 50209909 */
/*Date of completion: 12/8/2017 */
/*******************************************************************************/
module f_comb(a, b, c, f);
//inputs
input a, b, c;
//outputs
output f;
wire b_n, c_n, d_n, x_1, x_2, x_3, or_1;
//primitives
not(b_n, b);
not(c_n, c);
not(d_n, d);
xor(x_1, a, b_n);
xor(x_2, b, c_n);
xor(x_3, c, d_n);
or(or_1, x_1, x_2);
or(f, or_1, x_3);
endmodule

//testbench
module test_f;
reg t_a, t_b, t_c;
wire t_f;
f_comb in1(t_a, t_b, t_c, t_f);
initial
begin
t_a = 0; t_b = 0; t_c = 0;
#20
t_c = 1; 
#20
t_b = 1; t_c = 0;
#20
t_c = 1;
#20
t_a = 1; t_b = 0; t_c = 0;
#20
t_c = 1;
#20
t_b = 1; t_c = 0;
#20
t_c = 1;
end

// produce file
initial 
begin
$dumpfile("lab6Comb.vcd");
$dumpvars(0, test_f);
$monitor("inputs: a = %b, b = %b, c = %b | outputs: f = %b", t_a, t_b, t_c, t_f);
end
endmodule


