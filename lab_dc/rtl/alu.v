module alu (
	input clk,    // Clock
	input rst_n,  // Asynchronous reset active low
	input cin,
	input [1:0] a,
	input [1:0] b,
	input [1:0] alu_fun,
	output reg[2:0] out
);

always @(posedge clk or negedge rst_n) begin 
	if(~rst_n) begin
		out <= 3'b0;
	end else begin
		case (alu_fun)
			2'b00 : out <= a+b+cin;
			2'b10 :	out <= a - b;
			2'b01 :	out <= a >> 1;
			2'b11 : out <= b >> 1;
		endcase
	end
end

endmodule 