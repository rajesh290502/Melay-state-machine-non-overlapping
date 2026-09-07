`include "melay_nonover_lap.v"
module tb;
reg clk,rst,din;
wire pattern_detected;
integer count ; 
integer seed = 32474;
melay_nonover_lap dut(clk,rst,din,pattern_detected);
initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin
	rst=1;
	din=0;
	count = 0;
	@(posedge clk);
	@(posedge clk);
	rst = 0;
	repeat (540) begin
		@(posedge clk);
		din = $random;
	end
	#100;
	$display("total patterns detected = %0d",count);
	$finish;
end
always @(posedge pattern_detected)
count = count + 1;
endmodule
