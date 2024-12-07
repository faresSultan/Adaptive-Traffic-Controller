module counter(clk,rst_n,load,data,count);

  input clk,load,rst_n;
  input [4:0] data;
  output reg [4:0] count;
  
  always@(posedge clk,negedge rst_n) 
  begin
    if (!rst_n) begin
      count<=30;
    end
    else begin
      if(load)    
      count <= data;
    else           
      count <= count - 1;
    end
    
  end
endmodule 