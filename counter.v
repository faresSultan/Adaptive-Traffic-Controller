module counter(clk,load,data,count);

  input clk,load;
  input [4:0] data;
  output reg [4:0] count;
  
  always@(posedge clk) 
  begin
    if(load)    
      count <= data;
    else           
      count <= count - 1;
  end
endmodule 