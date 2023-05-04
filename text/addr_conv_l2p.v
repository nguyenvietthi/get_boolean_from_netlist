/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : Q-2019.12-SP4
// Date      : Thu May  4 10:36:22 2023
/////////////////////////////////////////////////////////////


module addr_conv_l2p ( laddr, paddr );
  input [8:0] laddr;
  output [8:0] paddr;
  wire   n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32;
  wire   [8:0] laddr_adj_0;
  assign laddr_adj_0[5] = laddr[5];
  assign laddr_adj_0[4] = laddr[4];
  assign laddr_adj_0[3] = laddr[3];
  assign laddr_adj_0[2] = laddr[2];
  assign laddr_adj_0[1] = laddr[1];
  assign laddr_adj_0[0] = laddr[0];

  dti_55g_10t_invx8 U20 ( .A(laddr_adj_0[2]), .Z(n13) );
  dti_55g_10t_invx8 U21 ( .A(n13), .Z(paddr[2]) );
  dti_55g_10t_invx8 U22 ( .A(laddr_adj_0[3]), .Z(n14) );
  dti_55g_10t_invx8 U23 ( .A(n14), .Z(paddr[3]) );
  dti_55g_10t_invx8 U24 ( .A(laddr_adj_0[4]), .Z(n15) );
  dti_55g_10t_invx8 U25 ( .A(n15), .Z(paddr[4]) );
  dti_55g_10t_invx8 U26 ( .A(laddr_adj_0[5]), .Z(n16) );
  dti_55g_10t_invx8 U27 ( .A(n16), .Z(paddr[5]) );
  dti_55g_10t_xor2x8 U28 ( .A(laddr_adj_0[2]), .B(laddr_adj_0[0]), .Z(paddr[0]) );
  dti_55g_10t_xor2x8 U29 ( .A(laddr_adj_0[2]), .B(laddr_adj_0[1]), .Z(paddr[1]) );
  dti_55g_10t_or2x8 U30 ( .A(laddr[8]), .B(laddr[7]), .Z(n19) );
  dti_55g_10t_invx8 U31 ( .A(laddr[6]), .Z(n20) );
  dti_55g_10t_and2x8 U32 ( .A(laddr[8]), .B(n20), .Z(n30) );
  dti_55g_10t_and2x8 U33 ( .A(laddr[8]), .B(laddr[7]), .Z(n32) );
  dti_55g_10t_invx8 U34 ( .A(n32), .Z(n17) );
  dti_55g_10t_and2x8 U35 ( .A(laddr[6]), .B(n17), .Z(n24) );
  dti_55g_10t_or2x8 U36 ( .A(n30), .B(n24), .Z(n18) );
  dti_55g_10t_and2x8 U37 ( .A(n19), .B(n18), .Z(n22) );
  dti_55g_10t_invx8 U38 ( .A(n19), .Z(n28) );
  dti_55g_10t_and2x8 U39 ( .A(n28), .B(n20), .Z(n21) );
  dti_55g_10t_or2x8 U40 ( .A(n22), .B(n21), .Z(n23) );
  dti_55g_10t_and2x8 U41 ( .A(laddr_adj_0[5]), .B(n23), .Z(n27) );
  dti_55g_10t_or4x8 U42 ( .A(laddr_adj_0[5]), .B(n28), .C(n30), .D(n24), .Z(
        n25) );
  dti_55g_10t_invx8 U43 ( .A(n25), .Z(n26) );
  dti_55g_10t_or2x8 U44 ( .A(n27), .B(n26), .Z(paddr[6]) );
  dti_55g_10t_and2x8 U45 ( .A(n28), .B(laddr[6]), .Z(n29) );
  dti_55g_10t_or3x8 U46 ( .A(n30), .B(n32), .C(n29), .Z(paddr[7]) );
  dti_55g_10t_and2x8 U47 ( .A(laddr[8]), .B(laddr[6]), .Z(n31) );
  dti_55g_10t_or2x8 U48 ( .A(n32), .B(n31), .Z(paddr[8]) );
endmodule
