//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab7
//Author: Adam Montano
//Module Name: up3_tb
//Module Function: Everything except the Control Unit: hardware
//**************************************************************************************

module up3_tb(input logic [6:0] SW,
					input logic [1:0] KEY,
					output logic [6:0] LEDR,
					output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
					
					
		logic [7:0] MDR;
		logic [7:0] OP;
		logic [7:0] VAL;
		
		
		assign LEDR = SW;
		
		
		up3 test(.clk(KEY[0]), .reset(~KEY[1]), .store_mem(SW[0]), .fetch(SW[1]), .load_pc(SW[3]), .incr_pc(SW[2]), 
					.load_iru(SW[5]), .load_irl(SW[4]), .load_ac(SW[6]), .mdr(MDR), .opcode(OP), .value(VAL));
					
					
		dual_seg7 PC_out(.blank(0), .test(0), .data(MDR), .segments1(HEX5), .segments2(HEX4));//PC
		dual_seg7 OP_out(.blank(0), .test(0), .data(OP), .segments1(HEX3), .segments2(HEX2));//Opcode (IR upper)
		dual_seg7 VAL_out(.blank(0), .test(0), .data(VAL), .segments1(HEX1), .segments2(HEX0));//Value (IR lower)
		
		
		
endmodule
					
					