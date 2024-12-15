/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Thu Dec 12 03:57:15 2024
/////////////////////////////////////////////////////////////


module alu ( clk, rst_n, cin, a, b, alu_fun, out );
  input [1:0] a;
  input [1:0] b;
  input [1:0] alu_fun;
  output [2:0] out;
  input clk, rst_n, cin;
  wire   N23, N24, N25, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29;

  DFFRHQX8M \out_reg[0]  ( .D(N23), .CK(clk), .RN(rst_n), .Q(out[0]) );
  DFFRHQX8M \out_reg[1]  ( .D(N24), .CK(clk), .RN(rst_n), .Q(out[1]) );
  DFFRHQX8M \out_reg[2]  ( .D(N25), .CK(clk), .RN(rst_n), .Q(out[2]) );
  INVX2M U28 ( .A(n22), .Y(n13) );
  INVX2M U29 ( .A(n20), .Y(n14) );
  INVX2M U30 ( .A(n23), .Y(n10) );
  INVX2M U31 ( .A(n28), .Y(n9) );
  NOR2X2M U32 ( .A(n12), .B(a[0]), .Y(n23) );
  NOR2X2M U33 ( .A(alu_fun[0]), .B(alu_fun[1]), .Y(n22) );
  OAI22X1M U34 ( .A0(n24), .A1(n14), .B0(n13), .B1(n25), .Y(N24) );
  XNOR2X2M U35 ( .A(n23), .B(n8), .Y(n24) );
  XNOR2X2M U36 ( .A(n19), .B(n18), .Y(n25) );
  INVX2M U37 ( .A(n18), .Y(n8) );
  AOI21X2M U38 ( .A0(n12), .A1(a[0]), .B0(n23), .Y(n28) );
  NOR2X2M U39 ( .A(n15), .B(alu_fun[0]), .Y(n20) );
  NAND2X2M U40 ( .A(a[1]), .B(n10), .Y(n21) );
  INVX2M U41 ( .A(alu_fun[1]), .Y(n15) );
  AOI22X1M U42 ( .A0(n9), .A1(cin), .B0(a[0]), .B1(b[0]), .Y(n19) );
  XNOR2X2M U43 ( .A(b[1]), .B(a[1]), .Y(n18) );
  OAI21BX1M U44 ( .A0(n16), .A1(n11), .B0N(n17), .Y(N25) );
  INVX2M U45 ( .A(b[1]), .Y(n11) );
  AOI22X1M U46 ( .A0(n20), .A1(n21), .B0(n22), .B1(a[1]), .Y(n16) );
  OAI33X2M U47 ( .A0(n18), .A1(n19), .A2(n13), .B0(n14), .B1(a[1]), .B2(n10), 
        .Y(n17) );
  OAI2B1X2M U48 ( .A1N(alu_fun[0]), .A0(n26), .B0(n27), .Y(N23) );
  AOI22X1M U49 ( .A0(a[1]), .A1(n15), .B0(alu_fun[1]), .B1(b[1]), .Y(n26) );
  AOI32X1M U50 ( .A0(n22), .A1(cin), .A2(n28), .B0(n29), .B1(n9), .Y(n27) );
  OAI21X2M U51 ( .A0(cin), .A1(n13), .B0(n14), .Y(n29) );
  INVX2M U52 ( .A(b[0]), .Y(n12) );
endmodule

