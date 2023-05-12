/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : Q-2019.12-SP4
// Date      : Thu May  4 17:31:32 2023
/////////////////////////////////////////////////////////////


module addr_conv_l2p ( laddr, paddr );
  input [8:0] laddr;
  output [8:0] paddr;
  wire   n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48;
  wire   [8:0] laddr_adj_0;
  assign laddr_adj_0[1] = laddr[1];
  assign laddr_adj_0[0] = laddr[0];

  dti_55g_10t_xor2x8 U36 ( .A(laddr[2]), .B(laddr_adj_0[0]), .Z(paddr[0]) );
  dti_55g_10t_xor2x8 U37 ( .A(laddr[2]), .B(laddr_adj_0[1]), .Z(paddr[1]) );
  dti_55g_10t_and4x8 U38 ( .A(laddr[5]), .B(laddr[2]), .C(laddr[3]), .D(
        laddr[4]), .Z(n41) );
  dti_55g_10t_and2x8 U39 ( .A(n41), .B(laddr[6]), .Z(n47) );
  dti_55g_10t_or3x8 U40 ( .A(laddr[7]), .B(n47), .C(laddr[8]), .Z(n34) );
  dti_55g_10t_xor2x8 U41 ( .A(laddr[2]), .B(n34), .Z(paddr[2]) );
  dti_55g_10t_and2x8 U42 ( .A(laddr[2]), .B(n34), .Z(n25) );
  dti_55g_10t_xor2x8 U43 ( .A(laddr[3]), .B(n25), .Z(paddr[3]) );
  dti_55g_10t_and3x8 U44 ( .A(laddr[3]), .B(laddr[2]), .C(n34), .Z(n26) );
  dti_55g_10t_xor2x8 U45 ( .A(laddr[4]), .B(n26), .Z(paddr[4]) );
  dti_55g_10t_and3x8 U46 ( .A(laddr[2]), .B(laddr[3]), .C(laddr[4]), .Z(n27)
         );
  dti_55g_10t_xor2x8 U47 ( .A(laddr[5]), .B(n27), .Z(n32) );
  dti_55g_10t_or2x8 U48 ( .A(laddr[7]), .B(laddr[8]), .Z(n28) );
  dti_55g_10t_and2x8 U49 ( .A(n32), .B(n28), .Z(n30) );
  dti_55g_10t_invx8 U50 ( .A(n34), .Z(n29) );
  dti_55g_10t_and2x8 U51 ( .A(laddr[5]), .B(n29), .Z(n36) );
  dti_55g_10t_or2x8 U52 ( .A(n30), .B(n36), .Z(paddr[5]) );
  dti_55g_10t_invx8 U53 ( .A(laddr[8]), .Z(n42) );
  dti_55g_10t_and2x8 U54 ( .A(n47), .B(laddr[7]), .Z(n31) );
  dti_55g_10t_xor2x8 U55 ( .A(n42), .B(n31), .Z(n33) );
  dti_55g_10t_xor2x8 U56 ( .A(n33), .B(n32), .Z(n35) );
  dti_55g_10t_and2x8 U57 ( .A(n35), .B(n34), .Z(n37) );
  dti_55g_10t_or2x8 U58 ( .A(n37), .B(n36), .Z(paddr[6]) );
  dti_55g_10t_xor2x8 U59 ( .A(laddr[7]), .B(laddr[6]), .Z(n38) );
  dti_55g_10t_or2x8 U60 ( .A(laddr[8]), .B(n38), .Z(n46) );
  dti_55g_10t_invx8 U61 ( .A(laddr[7]), .Z(n39) );
  dti_55g_10t_and4x8 U62 ( .A(n39), .B(n41), .C(laddr[8]), .D(laddr[6]), .Z(
        n40) );
  dti_55g_10t_invx8 U63 ( .A(n40), .Z(n45) );
  dti_55g_10t_xor2x8 U64 ( .A(n42), .B(n41), .Z(n43) );
  dti_55g_10t_or2x8 U65 ( .A(laddr[6]), .B(n43), .Z(n44) );
  dti_55g_10t_and3x8 U66 ( .A(n46), .B(n45), .C(n44), .Z(paddr[7]) );
  dti_55g_10t_or2x8 U67 ( .A(laddr[7]), .B(n47), .Z(n48) );
  dti_55g_10t_and2x8 U68 ( .A(laddr[8]), .B(n48), .Z(paddr[8]) );
endmodule

