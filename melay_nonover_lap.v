module melay_nonover_lap(clk,rst,din,pattern_detected);
input clk,rst;
input din;
output reg pattern_detected;
parameter s0=5'b00001;
parameter s1=5'b00010;
parameter s2=5'b00100;
parameter s3=5'b01000;
parameter s4=5'b10000;
wire [4:0] state;
reg [4:0] n_state;
assign state = n_state;
always @ (posedge clk)begin
	if(rst==1)begin
		pattern_detected=0;
		n_state = s0;
	end
	else begin
		pattern_detected = 0 ;
		case (state)
			s0:begin 
				n_state = din ? s1:s0;
			end
			s1:begin 
				n_state = din ? s1:s2;
			end
			s2:begin
				n_state = din ? s3:s0;
			end
			s3:begin
				n_state = din ? s1:s4;
			end
			s4:begin
				n_state = din ? s0:s0;
				pattern_detected = din ? 1 : 0;
			end
			endcase
	end
end
endmodule
