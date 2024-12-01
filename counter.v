module Counter (clk,load_data,load,counter);

    input clk,load;
    input [4:0] load_data;  // 5-bit counter to count from 1 - 30
    output reg [4:0] counter;

    reg [4:0] counter_value;
    always @(posedge clk) begin
        if (load) begin
            counter_value <= load_data; 
        end
        else begin
            counter <= counter_value-1;
        end
        
    end
    
endmodule