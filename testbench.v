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

    Sa=1;Sb=1;Sc=1;Sd=1;
    for (i = 0; i<150; i=i+1) begin
        @(negedge clk);
    end // round robin 

    Sa=2;Sb=2;Sc=2;Sd=2;
    for (i = 0; i<150; i=i+1) begin
        @(negedge clk);
    end// round robin 

    Sa=3;Sb=3;Sc=3;Sd=3;
    for ( i = 0; i<150; i=i+1) begin
        @(negedge clk);
    end// round robin 

    Sa=0;Sb=0;Sc=0;Sd=0;
    for ( i = 0; i<150; i=i+1) begin
        @(negedge clk);
    end

    ////round robin done////



    Sa = 3;
    for ( i = 0; i<150; i=i+1) begin
        @(negedge clk);
    end // stay at a

    Sb = 3;
    for ( i = 0; i<150; i=i+1) begin
        @(negedge clk);
    end //round robin bet a & b

    Sc = 3;
    for ( i = 0; i<150; i=i+1) begin
        @(negedge clk);
    end //round robin bet a & b & c





    Sd = 3; Sa =1;Sb =1;Sc =1;
    for ( i = 0; i<65; i=i+1) begin
        @(negedge clk);
    end // priority given to d, stay at d

    Sc = 3; Sa =1;Sb =1;Sd =1;
    for ( i = 0; i<65; i=i+1) begin
        @(negedge clk);
    end // priority given to c, stay at c

    Sb = 3; Sa =1;Sd =1;Sc =1;
    for ( i = 0; i<65; i=i+1) begin
        @(negedge clk);
    end // priority given to b, stay at b

    Sa = 3; Sd =1;Sb =1;Sc =1;
    for ( i = 0; i<65; i=i+1) begin
        @(negedge clk);
    end // priority given to b, stay at b





    Sa = 2; Sd =3;Sb =1;Sc =0;
    for ( i = 0; i<65; i=i+1) begin
        @(negedge clk);
    end // stay at d


    $stop;
end

endmodule