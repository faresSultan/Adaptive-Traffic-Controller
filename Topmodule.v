module Topmodule (
    clk,rst_n,
    Sa,Sb,Sc,Sd,
    Ta,Tb,Tc,Td
);

    input clk,rst_n;
    input [1:0] Sa,Sb,Sc,Sd;
    output [2:0]Ta,Tb,Tc,Td;

    wire [4:0] counter_output;   // internal counter current value
    wire [4:0] load_value;       // value to be loaded to the counter
    wire load_en;                // load enable

    Traffic_Controller FSM (.Sa(Sa),.Sb(Sb),.Sc(Sc),.Sd(Sd),.clk(clk),.rst_n(rst_n),
    .counter_value(counter_output),.Ta(Ta),.Tb(Tb),.Tc(Tc),.Td(Td),.load_counter(load_en),.load_value(load_value));

    counter internal_counter (.clk(clk),.load(load_en),.data(load_value),.count(counter_output));
     
endmodule