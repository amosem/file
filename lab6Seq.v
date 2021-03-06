/*******************************************************************************/
/*Program Name: lab6Seq.v */
/*Description: Verilog description and test bench for a combinational circuit*/
/*Author: Eithne Amos */
/*Person number: 50209909 */
/*Date of completion: 12/8/2017 */
/*******************************************************************************/

module seq(x, clk, reset, out);
input x, clk, reset;
output reg out;
reg [2:0] state;

parameter s0=3'b000,
	  s1=3'b001,
	  s2=3'b010,
	  s3=3'b011,
	  s4=4'b100;

always @(posedge reset or posedge clk)
	if (reset) begin state = s0; end
	else
		case (state)
			s0: begin out=0;
				if (x) state = s4; 
				else state = s1; 
			end

			s1: begin out=0;
				if (x) state = s2;
				else state = s1;
			end

			s2: begin out = 1; 
				if (x) state = s4;
				else state = s3;
			end

			s3: begin out = 1;
				if (x) state = s2;
				else state = s1;
			end

			s4: begin out = 0;
				if (x) state = s4;
				else state = s3;
			end
		endcase

endmodule

module test;
reg t_x, t_clk, t_reset;
wire t_out;

seq in1(t_x, t_clk, t_reset, t_out);

initial begin
	t_x = 0;
	t_clk = 0;
	t_reset = 1;
	#10 t_reset = 0;


	repeat (32) begin
		t_x = ~t_x;
		#10 t_clk=~t_clk;
		#10 t_clk=~t_clk;
	end
		
		

end

// produce file
initial 
begin
$dumpfile("test.vcd");
$dumpvars(0, test);
$monitor("x: %b out: %b", t_x, t_out);
end
endmodule
