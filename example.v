module fa(a,b,c,s,cout);
input a, b, c;
output s, cout;
//continuous assignment
assign s=a^b^c;
assign cout = (a&b)|(a&c)|(b&c);
endmodule

//testbench

module t_example;
reg t_a, t_b, t_c;
wire t_cout, t_s;
fa in1(t_a, t_b, t_c, t_s, t_cout);
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
initial
begin
$dumpfile("ex1.vcd");
$dumpvars(0, t_fa);
$monitor("inputs: a = %b, b = %b, cin = %b | outputs: cout = %b, s = %b", 
t_a, t_b, t_c, t_cout, t_s);
end
endmodule 
