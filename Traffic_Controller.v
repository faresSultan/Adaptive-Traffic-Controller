module Traffic_Controller (Sa,Sb,Sc,Sd,clk,rst_n,counter_value,Ta,Tb,Tc,Td,load_counter,load_value);
    parameter Ga = 3'b000 ;
    parameter Gb = 3'b001 ;
    parameter Gc = 3'b010 ;
    parameter Gd = 3'b011 ;
    parameter Oa = 3'b100 ;
    parameter Ob = 3'b101 ;
    parameter Oc = 3'b110 ;
    parameter Od = 3'b111 ;

    input clk,rst_n;
    input [1:0] Sa,Sb,Sc,Sd;  // traffic sensors
    input [4:0] counter_value;   // internal counter value
    output reg[2:0] Ta,Tb,Tc,Td;    // traffic lights  001 ->green, 010 -> orange, 100 -> red
    output load_counter;    // load enable
    output [4:0] load_value; // value to be loaded in the counter after a trasition, 30 -> green, 3 -> orange


    reg [2:0] current_state, next_state;

    //---

    // current state logic

    always @(posedge clk or negedge rst_n) begin

        if(!rst_n) begin
            current_state <= Ga;
        end
        else begin
            current_state <= next_state;
        end 
        
    end

    // Next state logic

    always @(*) begin
        case (current_state)
            Ga: begin
                if (((Sa>Sb)&&(Sa>Sc)&&(Sa>Sd)) || counter_value !=1) begin // A is the highest priority or counter isn't finished
                    next_state <= Ga;      // remain in the same state
                end
                else begin 
                    next_state <= Oa;
                end   // move to orange state in preparation to stop the traffic of this side
                end

            Gb: begin
                if (((Sb>Sa)&&(Sb>Sc)&&(Sb>Sd)) || counter_value !=1) begin // B is the highest priority or counter isn't finished
                    next_state <= Gb;      // remain in the same state
                end
                else begin 
                    next_state <= Ob;
                end   // move to orange state in preparation to stop the traffic of this side
                end

            Gc: begin
                if (((Sc>Sa)&&(Sc>Sb)&&(Sc>Sd)) || counter_value !=1) begin // C is the highest priority or counter isn't finished
                    next_state <= Gc;      // remain in the same state
                end
                else begin 
                    next_state <= Oc;
                end   // move to orange state in preparation to stop the traffic of this side
                end

            Gd: begin
                if (((Sd>Sa)&&(Sd>Sb)&&(Sd>Sc)) || counter_value !=1) begin // D is the highest priority or counter isn't finished
                    next_state <= Gd;      // remain in the same state
                end
                else begin 
                    next_state <= Od;
                end    // move to orange state in preparation to stop the traffic of this side
                end

            Oa: begin
                    if (counter_value != 1) begin
                        next_state <= Oa; // Stay in orange if counter isn't done
                    end else begin
                        // Determine next state based on traffic priorities
                        if ((Sb >= Sa) && (Sb >= Sc) && (Sb >= Sd)) 
                            next_state <= Gb;
                        else if ((Sc >= Sa) && (Sc >= Sb) && (Sc >= Sd))
                            next_state <= Gc;
                        else
                            next_state <= Gd; // Default to Gb
                    end
                end  

            Ob: begin
                    if (counter_value != 1)  // Stay in orange if counter isn't done
                        next_state <= Ob;
                    else begin      
                        // Determine next state based on traffic priorities
                        if ((Sc >= Sa) && (Sc >= Sb) && (Sc >= Sd)) 
                            next_state <= Gc;
                        else if ((Sd >= Sa) && (Sd >= Sb) && (Sd >= Sc))   
                            next_state <= Gd;
                        else  
                            next_state <= Ga; // Default to Gd 
                    end  
                end

            Oc: begin
                    if (counter_value !=1)  // Stay in orange if counter isn't done
                        next_state <= Oc;
                    else begin 
                        // Determine next state based on traffic priorities
                        if ((Sd >= Sa) && (Sd >= Sb) && (Sd >= Sc)) 
                            next_state <= Gd;
                        else if ((Sa >= Sb) && (Sa >= Sc) && (Sa >= Sd))   
                            next_state <= Ga;
                        else  
                            next_state <= Gb; // Default to Gd 
                    end

                end

            Od: begin
                    if (counter_value !=1)  // Stay in orange if counter isn't done
                        next_state = Od;
                    else begin 
                        // Determine next state based on traffic priorities
                        if ((Sa >= Sb) && (Sa >= Sc) && (Sa >= Sd)) 
                            next_state = Ga;
                        else if ((Sb >= Sa) && (Sb >= Sc) && (Sa >= Sd))   
                            next_state = Gb;
                        else  
                            next_state = Gc; // Default to Ga 
                    end 
                end
        endcase
    end

    // output logic
    always @(current_state) begin
        case (current_state)
            Ga: begin
                Ta <= 3'b001;   // green
                Tb <= 3'b100;   // red
                Tc <= 3'b100;   // red
                Td <= 3'b100;   // red
            end

            Gb: begin
                Tb = 3'b001;   // green
                Ta = 3'b100;   // red
                Tc = 3'b100;   // red
                Td = 3'b100;   // red
                                               // 30 sec for green light
            end

            Gc: begin
                Tc = 3'b001;   // green
                Ta = 3'b100;   // red
                Tb = 3'b100;   // red
                Td = 3'b100;   // red
                                               // 30 sec for green light
            end

            Gd: begin
                Td = 3'b001;   // green
                Ta = 3'b100;   // red
                Tb = 3'b100;   // red
                Tc = 3'b100;   // red
                                               // 30 sec for green light
            end

            Oa: begin
                Ta = 3'b010;   // orange
                Tb = 3'b100;   // red
                Tc = 3'b100;   // red
                Td = 3'b100;   // red
                                                // 3 sec for orange light
            end

            Ob: begin
                Tb = 3'b010;   // orange
                Ta = 3'b100;   // red
                Tc = 3'b100;   // red
                Td = 3'b100;   // red
                                                // 3 sec for orange light
            end

            Oc: begin
                Tc = 3'b010;   // orange
                Ta = 3'b100;   // red
                Tb = 3'b100;   // red
                Td = 3'b100;   // red
                                              // 3 sec for orange light
            end

            Od: begin
                Td = 3'b010;   // orange
                Ta = 3'b100;   // red
                Tb = 3'b100;   // red
                Tc = 3'b100;   // red
                                // 3 sec for orange light
            end 

            default: begin
                Ta = 3'b100;   // red
                Tb = 3'b100;   // red
                Tc = 3'b100;   // red
                Td = 3'b100;   // red
            end
        endcase
    end 
    assign load_counter = (current_state !== next_state);
    assign load_value = (next_state > 3 ? 3 : 30);

endmodule