module Traffic_Controller (Sa,Sb,Sc,Sd,clk,rst_n,counter_value,Ta,Tb,Tc,Td,load_counter);
    
    input clk,rst_n;
    input [1:0] Sa,Sb,Sc,Sd;  // traffic sensors
    input [4:0] counter_value;   // internal counter value
    output [2:0] Ta,Tb,Tc,Td;    // traffic lights
    output load_counter;    // load enable

    parameter Ga = 000 ;
    parameter Gb = 001 ;
    parameter Gc = 010 ;
    parameter Gd = 011 ;
    parameter Oa = 100 ;
    parameter Ob = 101 ;
    parameter Oc = 110 ;
    parameter Od = 111 ;

    reg [2:0] current_state, next_state;

    //---
//Counter (clk,load_data,load,counter)
    Counter internal_counter (.clk(clk),.load_data(),.load(load_counter),.counter(counter_value));


    // current state logic

    always @(posedge clk or negedge rst_n) begin

        if(!rst_n) current_state <= Ga;

        else current_state <= next_state;
        
    end

    // Next state logic

    always @(*) begin
        case (current_state)
            Ga: begin
                if (((Sa>Sb)&&(Sa>Sc)&&(Sa>Sd)) || counter_value !=0) begin // A is the highest priority or counter isn't finished
                    next_state <= Ga;      // remain in the same state
                end
            end
            Gb: 
            Gc: 
            Gd: 
            Oa: 
            Ob: 
            Oc: 
            Od: 
            default: 
        endcase
    end

    
endmodule