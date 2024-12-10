module asic_tb ();

reg clk,rst_n;
reg [1:0] Sa,Sb,Sc,Sd;
wire [2:0] Ta,Tb,Tc,Td;

integer i;
initial begin
    clk =1;
    forever begin
        #1 clk = ~clk;
    end
end

Topmodule t1 (clk,rst_n,
    Sa,Sb,Sc,Sd,
    Ta,Tb,Tc,Td);

initial begin
    rst_n = 0;
    @(negedge clk);
    rst_n = 1;


    //// Round Robin ////

    // Test Case 1: All inputs are 1
    Sa = 1; Sb = 1; Sc = 1; Sd = 1;
    for (i = 0; i < 150; i = i + 1) begin
        @(negedge clk);
    end
    $display("After Test Case 1: Sa=%0d, Sb=%0d, Sc=%0d, Sd=%0d => Ta=%0d, Tb=%0d, Tc=%0d, Td=%0d", 
             Sa, Sb, Sc, Sd, Ta, Tb, Tc, Td);

    // Test Case 2: All inputs are 2
    Sa = 2; Sb = 2; Sc = 2; Sd = 2;
    for (i = 0; i < 150; i = i + 1) begin
        @(negedge clk);
    end
    $display("After Test Case 2: Sa=%0d, Sb=%0d, Sc=%0d, Sd=%0d => Ta=%0d, Tb=%0d, Tc=%0d, Td=%0d", 
             Sa, Sb, Sc, Sd, Ta, Tb, Tc, Td);

    // Test Case 3: All inputs are 3
    Sa = 3; Sb = 3; Sc = 3; Sd = 3;
    for (i = 0; i < 150; i = i + 1) begin
        @(negedge clk);
    end
    $display("After Test Case 3: Sa=%0d, Sb=%0d, Sc=%0d, Sd=%0d => Ta=%0d, Tb=%0d, Tc=%0d, Td=%0d", 
             Sa, Sb, Sc, Sd, Ta, Tb, Tc, Td);

    // Test Case 4: All inputs are 0
    Sa = 0; Sb = 0; Sc = 0; Sd = 0;
    for (i = 0; i < 150; i = i + 1) begin
        @(negedge clk);
    end
    $display("After Test Case 4: Sa=%0d, Sb=%0d, Sc=%0d, Sd=%0d => Ta=%0d, Tb=%0d, Tc=%0d, Td=%0d", 
             Sa, Sb, Sc, Sd, Ta, Tb, Tc, Td);



    //// Special Round Robin ////


    // Stay at A
    Sa = 3;
    for ( i = 0; i<150; i=i+1) begin
        @(negedge clk);
    end 
    $display("Special Round Robin Test 1: Sa=%0d, Sb=%0d, Sc=%0d, Sd=%0d => Ta=%0d, Tb=%0d, Tc=%0d, Td=%0d", 
             Sa, Sb, Sc, Sd, Ta, Tb, Tc, Td);

    // Round Robin between A & B
    Sb = 3;
    for ( i = 0; i<150; i=i+1) begin
        @(negedge clk);
    end
    $display("Special Round Robin Test 2: Sa=%0d, Sb=%0d, Sc=%0d, Sd=%0d => Ta=%0d, Tb=%0d, Tc=%0d, Td=%0d", 
             Sa, Sb, Sc, Sd, Ta, Tb, Tc, Td);

    // Round Robin between A & B & C
    Sc = 3;
    for ( i = 0; i<150; i=i+1) begin
        @(negedge clk);
    end 
    $display("Special Round Robin Test 3: Sa=%0d, Sb=%0d, Sc=%0d, Sd=%0d => Ta=%0d, Tb=%0d, Tc=%0d, Td=%0d", 
             Sa, Sb, Sc, Sd, Ta, Tb, Tc, Td);



    //// Priority Given ////

    //to D
    Sd = 3; Sa =1;Sb =1;Sc =1;
    for ( i = 0; i<65; i=i+1) begin
        @(negedge clk);
    end

    $display("Priority Test 1: Sa=%0d, Sb=%0d, Sc=%0d, Sd=%0d => Ta=%0d, Tb=%0d, Tc=%0d, Td=%0d", 
             Sa, Sb, Sc, Sd, Ta, Tb, Tc, Td);


    //To C
    Sc = 3; Sa =1;Sb =1;Sd =1;
    for ( i = 0; i<65; i=i+1) begin
        @(negedge clk);
    end

    $display("Priority Test 2: Sa=%0d, Sb=%0d, Sc=%0d, Sd=%0d => Ta=%0d, Tb=%0d, Tc=%0d, Td=%0d", 
             Sa, Sb, Sc, Sd, Ta, Tb, Tc, Td);


    //To B
    Sb = 3; Sd = 1; Sc = 1; Sa = 1;
    for (i = 0; i < 65; i = i + 1) begin
        @(negedge clk);
    end
    $display("Priority Test 3: Sa=%0d, Sb=%0d, Sc=%0d, Sd=%0d => Ta=%0d, Tb=%0d, Tc=%0d, Td=%0d", 
             Sa, Sb, Sc, Sd, Ta, Tb, Tc, Td);
 
    //To A
    Sa = 3; Sd = 1; Sb = 1; Sc = 1;
    for (i = 0; i < 65; i = i + 1) begin
        @(negedge clk);
    end
    $display("Priority Test 4: Sa=%0d, Sb=%0d, Sc=%0d, Sd=%0d => Ta=%0d, Tb=%0d, Tc=%0d, Td=%0d", 
             Sa, Sb, Sc, Sd, Ta, Tb, Tc, Td); 




    // D > A,B > C 
    Sa = 2; Sd =3;Sb =1;Sc =0;
    for ( i = 0; i<65; i=i+1) begin
        @(negedge clk);
    end 
    $display("Test Case: Sa=%0d, Sb=%0d, Sc=%0d, Sd=%0d => Ta=%0d, Tb=%0d, Tc=%0d, Td=%0d", 
             Sa, Sb, Sc, Sd, Ta, Tb, Tc, Td); 


    $stop;
end

endmodule
