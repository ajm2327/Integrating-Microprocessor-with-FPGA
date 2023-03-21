//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab7
//Author: Adam Montano
//Module Name: up3_cu_tb
//Module Function: up3_cu hardware
//**************************************************************************************


module up3cu_tb(input logic [1:0] KEY,
					 output logic [9:0] LEDR,
					 output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);	 
						 
		logic [7:0] PC;
		logic [7:0] OP;	
		logic [7:0] VAL;
	 
	 
		up3_cu up3cu(.clk(KEY[0]), .reset(~KEY[1]), .state(LEDR[9:7]), .pc(PC), .opcode(OP), .value(VAL), .load_ac(LEDR[6]), 
						 .load_iru(LEDR[5]), .load_irl(LEDR[4]), .load_pc(LEDR[3]), .incr_pc(LEDR[2]), .fetch(LEDR[1]), .store_mem(LEDR[0]));
	   
		dual_seg7 PC_out(.blank(0), .test(0), .data(PC), .segments1(HEX5), .segments2(HEX4));//PC
		dual_seg7 OP_out(.blank(0), .test(0), .data(OP), .segments1(HEX3), .segments2(HEX2));//Opcode (IR upper)
		dual_seg7 VAL_out(.blank(0), .test(0), .data(VAL), .segments1(HEX1), .segments2(HEX0));//Value (IR lower)
		
		
endmodule 