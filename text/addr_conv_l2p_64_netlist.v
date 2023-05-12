/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : Q-2019.12-SP4
// Date      : Thu May  4 17:30:17 2023
/////////////////////////////////////////////////////////////


module addr_conv_l2p ( laddr, paddr );
  input [8:0] laddr;
  output [8:0] paddr;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  wire   [8:0] laddr_adj_0;
  assign laddr_adj_0[5] = laddr[5];
  assign laddr_adj_0[4] = laddr[4];
  assign laddr_adj_0[3] = laddr[3];
  assign laddr_adj_0[2] = laddr[2];
  assign laddr_adj_0[1] = laddr[1];
  assign laddr_adj_0[0] = laddr[0];

  dti_55g_10t_invx8 U15 ( .A(laddr_adj_0[2]), .Z(n8) );
  dti_55g_10t_invx8 U16 ( .A(n8), .Z(paddr[2]) );
  dti_55g_10t_invx8 U17 ( .A(laddr_adj_0[3]), .Z(n9) );
  dti_55g_10t_invx8 U18 ( .A(n9), .Z(paddr[3]) );
  dti_55g_10t_invx8 U19 ( .A(laddr_adj_0[4]), .Z(n10) );
  dti_55g_10t_invx8 U20 ( .A(n10), .Z(paddr[4]) );
  dti_55g_10t_invx8 U21 ( .A(laddr_adj_0[5]), .Z(n11) );
  dti_55g_10t_invx8 U22 ( .A(n11), .Z(paddr[5]) );
  dti_55g_10t_xor2x8 U23 ( .A(laddr_adj_0[2]), .B(laddr_adj_0[0]), .Z(paddr[0]) );
  dti_55g_10t_xor2x8 U24 ( .A(laddr_adj_0[2]), .B(laddr_adj_0[1]), .Z(paddr[1]) );
  dti_55g_10t_or2x8 U25 ( .A(laddr[7]), .B(laddr[6]), .Z(n12) );
  dti_55g_10t_and2x8 U26 ( .A(laddr[8]), .B(n12), .Z(n13) );
  dti_55g_10t_xor2x8 U27 ( .A(laddr_adj_0[5]), .B(n13), .Z(n15) );
  dti_55g_10t_or3x8 U28 ( .A(laddr[8]), .B(laddr[7]), .C(laddr[6]), .Z(n14) );
  dti_55g_10t_and2x8 U29 ( .A(n15), .B(n14), .Z(paddr[6]) );
  dti_55g_10t_invx8 U30 ( .A(laddr[6]), .Z(n16) );
  dti_55g_10t_and2x8 U31 ( .A(laddr[7]), .B(n16), .Z(n17) );
  dti_55g_10t_xor2x8 U32 ( .A(laddr[8]), .B(n17), .Z(paddr[7]) );
  dti_55g_10t_and2x8 U33 ( .A(laddr[6]), .B(laddr[7]), .Z(n18) );
  dti_55g_10t_xor2x8 U34 ( .A(laddr[8]), .B(n18), .Z(paddr[8]) );
endmodule

