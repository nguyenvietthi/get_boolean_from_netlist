`timescale 1ns/1ps
module test ();
  reg [8:0] laddr;
  wire [8:0] paddr;
  wire [8:0] paddr_t;


addr_conv_l2p dut ( laddr, paddr , paddr_t);

initial begin 
	repeat(1000000) begin 
		#100;
		laddr = $random();
	end
end

 always_comb begin 
 	if(paddr != paddr_t) begin 
 		$display("FALSE",);
 		$display("%b\n%b\n", paddr, paddr_t);
 	end
 
 end

endmodule