//EE 310 Fundamentals of Computer Engineering
//Assignment: lab4
//Author: Adam Montano
//Module Name: pc_tb
//Module Function: program counter hardware
//**************************************************************************************


module pc_tb(input logic [9:0] SW, 
					input logic [1:0] KEY,
					output logic [6:0] HEX0, HEX1);
					
		logic[7:0] PC; //internal PC i think
		
		pc pc1(.clk(KEY[0]), .reset(~KEY[1]), .LOAD_PC(SW[9]), .INCR_PC(SW[8]), .ADDR(SW[7:0]), .PC(PC));
		
		dual_seg7 dualright(.blank(0), .test(0), .data(PC), .segments1(HEX1), .segments2(HEX0));
		
		endmodule