/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Sun Dec 15 22:58:56 2024
/////////////////////////////////////////////////////////////


module Traffic_Controller ( Sa, Sb, Sc, Sd, clk, rst_n, counter_value, Ta, Tb, 
        Tc, Td, load_counter, load_value );
  input [1:0] Sa;
  input [1:0] Sb;
  input [1:0] Sc;
  input [1:0] Sd;
  input [4:0] counter_value;
  output [2:0] Ta;
  output [2:0] Tb;
  output [2:0] Tc;
  output [2:0] Td;
  output [4:0] load_value;
  input clk, rst_n;
  output load_counter;
  wire   n33, n34, n35, n36, n37, n38, n39, n40, N158, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n1, \load_value[4] , n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign load_value[1] = 1'b1;
  assign load_value[0] = N158;
  assign load_value[2] = \load_value[4] ;
  assign load_value[3] = \load_value[4] ;
  assign load_value[4] = \load_value[4] ;

  NOR3BX4M U18 ( .AN(n117), .B(n118), .C(n119), .Y(n99) );
  DFFRX1M \current_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(rst_n), 
        .Q(current_state[1]), .QN(n21) );
  DFFRX1M \current_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(rst_n), 
        .Q(current_state[0]), .QN(n15) );
  DFFRX1M \current_state_reg[2]  ( .D(N158), .CK(clk), .RN(rst_n), .Q(
        current_state[2]), .QN(n20) );
  OR3X2M U3 ( .A(current_state[1]), .B(current_state[2]), .C(n15), .Y(n1) );
  NAND3X12M U4 ( .A(n1), .B(n13), .C(n125), .Y(Ta[2]) );
  NAND3X12M U5 ( .A(n19), .B(n17), .C(n125), .Y(Tb[2]) );
  NOR3BX4M U6 ( .AN(n100), .B(Td[0]), .C(n38), .Y(n125) );
  NAND3X12M U7 ( .A(n16), .B(n18), .C(n123), .Y(Td[2]) );
  CLKINVX8M U8 ( .A(n16), .Y(Tc[0]) );
  NOR3X2M U9 ( .A(current_state[0]), .B(current_state[2]), .C(n21), .Y(n38) );
  INVX2M U10 ( .A(n38), .Y(n16) );
  CLKINVX8M U11 ( .A(n13), .Y(Tb[1]) );
  NOR3X2M U12 ( .A(n15), .B(current_state[1]), .C(n20), .Y(n35) );
  INVX2M U13 ( .A(n35), .Y(n13) );
  CLKBUFX8M U14 ( .A(n36), .Y(Tc[2]) );
  AND3X1M U15 ( .A(n124), .B(n1), .C(n17), .Y(n123) );
  NAND3BX2M U16 ( .AN(Td[0]), .B(n14), .C(n123), .Y(n36) );
  CLKINVX8M U17 ( .A(n1), .Y(Tb[0]) );
  CLKINVX8M U19 ( .A(n18), .Y(Tc[1]) );
  NOR3X2M U20 ( .A(n20), .B(current_state[0]), .C(n21), .Y(n37) );
  INVX2M U21 ( .A(n37), .Y(n18) );
  CLKINVX8M U22 ( .A(n19), .Y(Ta[1]) );
  INVX2M U23 ( .A(n33), .Y(n19) );
  NOR3X2M U24 ( .A(current_state[0]), .B(current_state[1]), .C(n20), .Y(n33)
         );
  OR3X2M U25 ( .A(n15), .B(current_state[2]), .C(n21), .Y(n40) );
  INVX8M U26 ( .A(n40), .Y(Td[0]) );
  CLKINVX8M U27 ( .A(n17), .Y(Ta[0]) );
  NOR3X2M U28 ( .A(current_state[1]), .B(current_state[2]), .C(
        current_state[0]), .Y(n34) );
  INVX2M U29 ( .A(n34), .Y(n17) );
  CLKINVX8M U30 ( .A(n14), .Y(Td[1]) );
  NOR3X2M U31 ( .A(n20), .B(n15), .C(n21), .Y(n39) );
  INVX2M U32 ( .A(n39), .Y(n14) );
  NOR2XLM U33 ( .A(n33), .B(n35), .Y(n124) );
  NOR2X1M U34 ( .A(n37), .B(n39), .Y(n100) );
  OAI221X1M U35 ( .A0(n16), .A1(n126), .B0(n1), .B1(n127), .C0(n128), .Y(N158)
         );
  INVX2M U36 ( .A(n108), .Y(n23) );
  OAI32X1M U37 ( .A0(n14), .A1(n99), .A2(n23), .B0(n12), .B1(n100), .Y(n98) );
  OAI221X1M U38 ( .A0(n23), .A1(n18), .B0(n19), .B1(n22), .C0(n94), .Y(n106)
         );
  INVX2M U39 ( .A(n99), .Y(n22) );
  INVX2M U40 ( .A(N158), .Y(\load_value[4] ) );
  NAND3BX2M U41 ( .AN(n102), .B(n110), .C(n12), .Y(n95) );
  OAI22X1M U42 ( .A0(n99), .A1(n19), .B0(n13), .B1(n107), .Y(n110) );
  NOR3BX2M U43 ( .AN(n114), .B(n115), .C(n116), .Y(n102) );
  NAND3X2M U44 ( .A(n111), .B(n112), .C(n113), .Y(n107) );
  NAND3BX2M U45 ( .AN(n120), .B(n121), .C(n122), .Y(n108) );
  AOI21X2M U46 ( .A0(n100), .A1(n124), .B0(n12), .Y(n131) );
  OAI32X2M U47 ( .A0(n24), .A1(Sb[0]), .A2(n133), .B0(Sb[1]), .B1(n26), .Y(
        n119) );
  OAI32X2M U48 ( .A0(n24), .A1(Sc[0]), .A2(n134), .B0(Sc[1]), .B1(n26), .Y(
        n115) );
  OAI31X1M U49 ( .A0(n112), .A1(n121), .A2(n117), .B0(n12), .Y(n126) );
  OAI31X1M U50 ( .A0(n111), .A1(n122), .A2(n114), .B0(n12), .Y(n127) );
  AOI221XLM U51 ( .A0(n129), .A1(Td[0]), .B0(n130), .B1(n34), .C0(n131), .Y(
        n128) );
  AOI32X1M U52 ( .A0(Sa[0]), .A1(n31), .A2(n132), .B0(n32), .B1(Sa[1]), .Y(
        n113) );
  AOI32X1M U53 ( .A0(Sc[0]), .A1(n31), .A2(n136), .B0(n32), .B1(Sc[1]), .Y(
        n112) );
  AOI32X1M U54 ( .A0(Sb[0]), .A1(n31), .A2(n139), .B0(n32), .B1(Sb[1]), .Y(
        n111) );
  AOI32X1M U55 ( .A0(Sb[0]), .A1(n29), .A2(n140), .B0(n30), .B1(Sb[1]), .Y(
        n114) );
  AOI2BB1X2M U56 ( .A0N(n141), .A1N(n27), .B0(n133), .Y(n122) );
  OAI21X2M U57 ( .A0(Sb[1]), .A1(n26), .B0(n24), .Y(n141) );
  AOI2BB1X2M U58 ( .A0N(n144), .A1N(n29), .B0(n134), .Y(n121) );
  OAI21X2M U59 ( .A0(Sc[1]), .A1(n26), .B0(n24), .Y(n144) );
  AOI31X2M U60 ( .A0(n115), .A1(n119), .A2(n25), .B0(n109), .Y(n130) );
  INVX2M U61 ( .A(n113), .Y(n25) );
  AOI31X2M U62 ( .A0(n118), .A1(n120), .A2(n116), .B0(n109), .Y(n129) );
  INVX2M U63 ( .A(Sa[1]), .Y(n26) );
  OAI21X2M U64 ( .A0(n31), .A1(n135), .B0(n136), .Y(n116) );
  OAI21X2M U65 ( .A0(Sd[1]), .A1(n30), .B0(n29), .Y(n135) );
  OAI21X2M U66 ( .A0(n31), .A1(n137), .B0(n132), .Y(n120) );
  OAI21X2M U67 ( .A0(Sd[1]), .A1(n26), .B0(n24), .Y(n137) );
  INVX2M U68 ( .A(Sa[0]), .Y(n24) );
  INVX2M U69 ( .A(Sb[1]), .Y(n28) );
  NOR2X2M U70 ( .A(n28), .B(Sa[1]), .Y(n133) );
  NOR2X2M U71 ( .A(n30), .B(Sa[1]), .Y(n134) );
  OAI21X2M U72 ( .A0(n31), .A1(n138), .B0(n139), .Y(n118) );
  OAI21X2M U73 ( .A0(Sd[1]), .A1(n28), .B0(n27), .Y(n138) );
  NAND2X2M U74 ( .A(Sd[1]), .B(n26), .Y(n132) );
  NAND2X2M U75 ( .A(Sd[1]), .B(n28), .Y(n139) );
  NAND2X2M U76 ( .A(Sd[1]), .B(n30), .Y(n136) );
  INVX2M U77 ( .A(Sb[0]), .Y(n27) );
  INVX2M U78 ( .A(Sc[0]), .Y(n29) );
  INVX2M U79 ( .A(Sc[1]), .Y(n30) );
  NAND2X2M U80 ( .A(Sc[1]), .B(n28), .Y(n140) );
  INVX2M U81 ( .A(Sd[1]), .Y(n32) );
  OA21X2M U82 ( .A0(n29), .A1(n143), .B0(n140), .Y(n117) );
  OAI21X2M U83 ( .A0(Sc[1]), .A1(n28), .B0(n27), .Y(n143) );
  NAND2BXLM U84 ( .AN(n107), .B(Tc[1]), .Y(n94) );
  INVX2M U85 ( .A(n109), .Y(n12) );
  XNOR2X4M U86 ( .A(\load_value[4] ), .B(current_state[2]), .Y(load_counter) );
  INVX2M U87 ( .A(Sd[0]), .Y(n31) );
  NAND4X2M U88 ( .A(n103), .B(n95), .C(n104), .D(n105), .Y(next_state[0]) );
  OAI21XLM U89 ( .A0(Td[1]), .A1(Tb[1]), .B0(n109), .Y(n104) );
  NAND3XLM U90 ( .A(Td[1]), .B(n108), .C(n99), .Y(n103) );
  AOI22X1M U91 ( .A0(n12), .A1(n106), .B0(current_state[0]), .B1(n20), .Y(n105) );
  NAND4X2M U92 ( .A(n94), .B(n95), .C(n96), .D(n97), .Y(next_state[1]) );
  NAND3X2M U93 ( .A(n12), .B(n101), .C(n102), .Y(n96) );
  AOI21X2M U94 ( .A0(current_state[1]), .A1(n20), .B0(n98), .Y(n97) );
  OAI21XLM U95 ( .A0(n99), .A1(n19), .B0(n13), .Y(n101) );
  NAND3BX2M U96 ( .AN(counter_value[1]), .B(counter_value[0]), .C(n142), .Y(n109) );
  NOR3X2M U97 ( .A(counter_value[2]), .B(counter_value[4]), .C(counter_value[3]), .Y(n142) );
endmodule


module counter ( clk, rst_n, load, data, count );
  input [4:0] data;
  output [4:0] count;
  input clk, rst_n, load;
  wire   N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, n1, n2, n3, n4, n5;

  DFFSQX2M \count_reg[1]  ( .D(N11), .CK(clk), .SN(rst_n), .Q(count[1]) );
  DFFSQX2M \count_reg[4]  ( .D(N14), .CK(clk), .SN(rst_n), .Q(count[4]) );
  DFFSQX2M \count_reg[2]  ( .D(N12), .CK(clk), .SN(rst_n), .Q(count[2]) );
  DFFSQX2M \count_reg[3]  ( .D(N13), .CK(clk), .SN(rst_n), .Q(count[3]) );
  DFFSQX2M \count_reg[0]  ( .D(N10), .CK(clk), .SN(rst_n), .Q(count[0]) );
  INVX2M U3 ( .A(load), .Y(n5) );
  AO22X1M U4 ( .A0(data[2]), .A1(load), .B0(N7), .B1(n5), .Y(N12) );
  AO22X1M U5 ( .A0(data[0]), .A1(load), .B0(N5), .B1(n5), .Y(N10) );
  INVX2M U6 ( .A(count[0]), .Y(N5) );
  AO22X1M U7 ( .A0(load), .A1(data[4]), .B0(N9), .B1(n5), .Y(N14) );
  AO22X1M U8 ( .A0(data[3]), .A1(load), .B0(N8), .B1(n5), .Y(N13) );
  AO22X1M U9 ( .A0(data[1]), .A1(load), .B0(N6), .B1(n5), .Y(N11) );
  INVX2M U10 ( .A(count[2]), .Y(n4) );
  NOR2X1M U11 ( .A(count[1]), .B(count[0]), .Y(n1) );
  AO21XLM U12 ( .A0(count[0]), .A1(count[1]), .B0(n1), .Y(N6) );
  CLKNAND2X2M U13 ( .A(n1), .B(n4), .Y(n2) );
  OAI21X1M U14 ( .A0(n1), .A1(n4), .B0(n2), .Y(N7) );
  XNOR2X1M U15 ( .A(count[3]), .B(n2), .Y(N8) );
  NOR2X1M U16 ( .A(count[3]), .B(n2), .Y(n3) );
  CLKXOR2X2M U17 ( .A(count[4]), .B(n3), .Y(N9) );
endmodule


module Topmodule ( clk, rst_n, Sa, Sb, Sc, Sd, Ta, Tb, Tc, Td );
  input [1:0] Sa;
  input [1:0] Sb;
  input [1:0] Sc;
  input [1:0] Sd;
  output [2:0] Ta;
  output [2:0] Tb;
  output [2:0] Tc;
  output [2:0] Td;
  input clk, rst_n;
  wire   load_en;
  wire   [1:0] Sa_reading;
  wire   [1:0] Sb_reading;
  wire   [1:0] Sc_reading;
  wire   [1:0] Sd_reading;
  wire   [4:0] counter_output;
  wire   [4:0] load_value;
  wire   SYNOPSYS_UNCONNECTED__0;

  Traffic_Controller FSM ( .Sa(Sa_reading), .Sb(Sb_reading), .Sc(Sc_reading), 
        .Sd(Sd_reading), .clk(clk), .rst_n(rst_n), .counter_value(
        counter_output), .Ta(Ta), .Tb(Tb), .Tc(Tc), .Td(Td), .load_counter(
        load_en), .load_value({load_value[4:2], SYNOPSYS_UNCONNECTED__0, 
        load_value[0]}) );
  counter internal_counter ( .clk(clk), .rst_n(rst_n), .load(load_en), .data({
        load_value[4:2], 1'b1, load_value[0]}), .count(counter_output) );
  CLKXOR2X2M U9 ( .A(Sb[1]), .B(Sb[0]), .Y(Sb_reading[0]) );
  CLKXOR2X2M U10 ( .A(Sc[1]), .B(Sc[0]), .Y(Sc_reading[0]) );
  CLKXOR2X2M U11 ( .A(Sa[1]), .B(Sa[0]), .Y(Sa_reading[0]) );
  CLKXOR2X2M U12 ( .A(Sd[1]), .B(Sd[0]), .Y(Sd_reading[0]) );
  AND2X2M U13 ( .A(Sd[0]), .B(Sd[1]), .Y(Sd_reading[1]) );
  AND2X2M U14 ( .A(Sc[0]), .B(Sc[1]), .Y(Sc_reading[1]) );
  AND2X2M U15 ( .A(Sb[0]), .B(Sb[1]), .Y(Sb_reading[1]) );
  AND2X2M U16 ( .A(Sa[0]), .B(Sa[1]), .Y(Sa_reading[1]) );
endmodule
