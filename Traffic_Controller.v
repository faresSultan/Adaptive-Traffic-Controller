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
                else next_state <= Oa;    // move to orange state in preparation to stop the traffic of this side
                end

            Gb: begin
                if (((Sb>Sa)&&(Sb>Sc)&&(Sb>Sd)) || counter_value !=0) begin // B is the highest priority or counter isn't finished
                    next_state <= Gb;      // remain in the same state
                end
                else next_state <= Ob;    // move to orange state in preparation to stop the traffic of this side
                end

            Gc: begin
                if (((Sc>Sa)&&(Sc>Sb)&&(Sc>Sd)) || counter_value !=0) begin // C is the highest priority or counter isn't finished
                    next_state <= Gc;      // remain in the same state
                end
                else next_state <= Oc;    // move to orange state in preparation to stop the traffic of this side
                end

            Gd: begin
                if (((Sd>Sa)&&(Sd>Sb)&&(Sd>Sc)) || counter_value !=0) begin // D is the highest priority or counter isn't finished
                    next_state <= Gd;      // remain in the same state
                end
                else next_state <= Od;    // move to orange state in preparation to stop the traffic of this side
                end

            Oa: begin
                    if (counter_value !=0)  // remaining in the same state untill counter ends
                         next_state <= Oa;
                    else if (((Sa == Sb)&&(Sa == Sc)&&(Sa == Sd)) || (Sb>Sa)) // moving to Gb if all traffics have equal prioroties or B is the highest
                        next_state <= Gb;
                    else if ((Sc>Sa)&&(Sc>Sb))   // moving to Gc if c has higher priority than A,B
                        next_state <= Gc;
                    else if ((Sd>Sa)&&(Sd>Sb)&&(Sd>Sc))  // D is the highest priority
                        next_state <= Gd;
                    else  // if any ubnormal case happened -> regular flow
                        next_state<= Gb;  
                end  

            Ob: begin
                    if (counter_value !=0)  // remaining in the same state untill counter ends
                         next_state <= Ob;
                    else if (((Sa == Sb)&&(Sa == Sc)&&(Sa == Sd)) || (Sc>Sb)) // moving to Gc if all traffics have equal prioroties or B is the highest
                        next_state <= Gc;
                    else if ((Sd>Sb)&&(Sd>Sc))   // moving to Gd if d has higher priority than B,C
                        next_state <= Gd;
                    else if ((Sa>Sb)&&(Sa>Sc)&&(Sa>Sd))  // A is the highest priority
                        next_state <= Ga;
                    else  // if any ubnormal case happened -> regular flow
                        next_state<= Gc;  
                end

            Oc: begin
                    if (counter_value !=0)  // remaining in the same state untill counter ends
                         next_state <= Oc;
                    else if (((Sa == Sb)&&(Sa == Sc)&&(Sa == Sd)) || (Sd>Sc)) // moving to Gd if all traffics have equal prioroties or B is the highest
                        next_state <= Gd;
                    else if ((Sa>Sc)&&(Sa>Sd))   // moving to Ga if a has higher priority than C,D
                        next_state <= Ga;
                    else if ((Sb>Sc)&&(Sb>Sd)&&(Sb>Sa))  // B is the highest priority
                        next_state <= Gb;
                    else  // if any ubnormal case happened -> regular flow
                        next_state<= Gd;  
                end

            Od: begin
                    if (counter_value !=0)  // remaining in the same state untill counter ends
                         next_state <= Od;
                    else if (((Sa == Sb)&&(Sa == Sc)&&(Sa == Sd)) || (Sa>Sd)) // moving to Ga if all traffics have equal prioroties or B is the highest
                        next_state <= Ga;
                    else if ((Sb>Sd)&&(Sb>Sa))   // moving to Gb if a has higher priority than D,A
                        next_state <= Gb;
                    else if ((Sc>Sd)&&(Sc>Sb)&&(Sc>Sa))  // c is the highest priority
                        next_state <= Gc;
                    else  // if any ubnormal case happened -> regular flow
                        next_state<= Ga;  
                end
            default: 
        endcase
    end

    
endmodule