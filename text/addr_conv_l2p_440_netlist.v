/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : Q-2019.12-SP4
// Date      : Thu May  4 17:33:29 2023
/////////////////////////////////////////////////////////////


module addr_conv_l2p ( laddr, paddr );
  input [8:0] laddr;
  output [8:0] paddr;
  wire   n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69;
  wire   [8:0] laddr_adj_0;
  wire   [8:0] laddr_adj_1;
  assign laddr_adj_0[2] = laddr[2];
  assign laddr_adj_0[1] = laddr[1];
  assign laddr_adj_0[0] = laddr[0];
  assign laddr_adj_1[5] = laddr[5];
  assign laddr_adj_1[4] = laddr[4];
  assign laddr_adj_1[3] = laddr[3];

  dti_55g_10t_invx8 U46 ( .A(laddr_adj_0[2]), .Z(n36) );
  dti_55g_10t_invx8 U47 ( .A(n36), .Z(paddr[2]) );
  dti_55g_10t_xor2x8 U48 ( .A(laddr_adj_0[2]), .B(laddr_adj_0[0]), .Z(paddr[0]) );
  dti_55g_10t_xor2x8 U49 ( .A(laddr_adj_0[2]), .B(laddr_adj_0[1]), .Z(paddr[1]) );
  dti_55g_10t_invx8 U50 ( .A(laddr_adj_1[3]), .Z(n37) );
  dti_55g_10t_or2x8 U51 ( .A(laddr[7]), .B(laddr[8]), .Z(n53) );
  dti_55g_10t_and2x8 U52 ( .A(n37), .B(n53), .Z(n39) );
  dti_55g_10t_and2x8 U53 ( .A(laddr_adj_1[3]), .B(laddr_adj_1[4]), .Z(n44) );
  dti_55g_10t_and3x8 U54 ( .A(laddr[6]), .B(laddr_adj_1[5]), .C(n44), .Z(n57)
         );
  dti_55g_10t_or2x8 U55 ( .A(n57), .B(n53), .Z(n62) );
  dti_55g_10t_invx8 U56 ( .A(n62), .Z(n50) );
  dti_55g_10t_and2x8 U57 ( .A(n50), .B(laddr_adj_1[3]), .Z(n38) );
  dti_55g_10t_or2x8 U58 ( .A(n39), .B(n38), .Z(paddr[3]) );
  dti_55g_10t_invx8 U59 ( .A(n44), .Z(n41) );
  dti_55g_10t_or2x8 U60 ( .A(laddr_adj_1[3]), .B(laddr_adj_1[4]), .Z(n40) );
  dti_55g_10t_and3x8 U61 ( .A(n53), .B(n41), .C(n40), .Z(n43) );
  dti_55g_10t_and2x8 U62 ( .A(laddr_adj_1[4]), .B(n50), .Z(n42) );
  dti_55g_10t_or2x8 U63 ( .A(n43), .B(n42), .Z(paddr[4]) );
  dti_55g_10t_and2x8 U64 ( .A(laddr_adj_1[5]), .B(n50), .Z(n46) );
  dti_55g_10t_xor2x8 U65 ( .A(n44), .B(laddr_adj_1[5]), .Z(n49) );
  dti_55g_10t_and2x8 U66 ( .A(n49), .B(n53), .Z(n45) );
  dti_55g_10t_or2x8 U67 ( .A(n46), .B(n45), .Z(paddr[5]) );
  dti_55g_10t_and3x8 U68 ( .A(laddr_adj_1[3]), .B(laddr_adj_1[4]), .C(
        laddr_adj_1[5]), .Z(n63) );
  dti_55g_10t_or2x8 U69 ( .A(laddr[6]), .B(n63), .Z(n68) );
  dti_55g_10t_and2x8 U70 ( .A(n68), .B(laddr[7]), .Z(n47) );
  dti_55g_10t_xor2x8 U71 ( .A(laddr[8]), .B(n47), .Z(n48) );
  dti_55g_10t_xor2x8 U72 ( .A(n49), .B(n48), .Z(n51) );
  dti_55g_10t_or2x8 U73 ( .A(n51), .B(n50), .Z(n52) );
  dti_55g_10t_invx8 U74 ( .A(n52), .Z(n56) );
  dti_55g_10t_invx8 U75 ( .A(n53), .Z(n65) );
  dti_55g_10t_invx8 U76 ( .A(laddr[6]), .Z(n54) );
  dti_55g_10t_and3x8 U77 ( .A(laddr_adj_1[5]), .B(n65), .C(n54), .Z(n55) );
  dti_55g_10t_or2x8 U78 ( .A(n56), .B(n55), .Z(paddr[6]) );
  dti_55g_10t_xor2x8 U79 ( .A(laddr[7]), .B(n57), .Z(n58) );
  dti_55g_10t_invx8 U80 ( .A(n58), .Z(n59) );
  dti_55g_10t_and2x8 U81 ( .A(n59), .B(n68), .Z(n60) );
  dti_55g_10t_xor2x8 U82 ( .A(laddr[8]), .B(n60), .Z(n61) );
  dti_55g_10t_and2x8 U83 ( .A(n62), .B(n61), .Z(n67) );
  dti_55g_10t_invx8 U84 ( .A(n63), .Z(n64) );
  dti_55g_10t_and3x8 U85 ( .A(laddr[6]), .B(n65), .C(n64), .Z(n66) );
  dti_55g_10t_or2x8 U86 ( .A(n67), .B(n66), .Z(paddr[7]) );
  dti_55g_10t_or2x8 U87 ( .A(laddr[7]), .B(n68), .Z(n69) );
  dti_55g_10t_and2x8 U88 ( .A(laddr[8]), .B(n69), .Z(paddr[8]) );
endmodule

