//EE 310 Fundamentals of Computer Engineering
//Assignment: lab6
//Author: Adam Montano
//Module Name: ramlpm
//Module Function: RAMLPM hardware demo
//**************************************************************************************


module ramlpm_tb (input logic [9:0] SW,
						input logic [2:0] KEY,
						output logic [6:0] HEX0, HEX1, HEX2, HEX3);
						
logic[7:0] PC;
logic[7:0] Q1;


	pc pc1(.clk(~KEY[0]), .reset(~KEY[1]), .LOAD_PC(~KEY[2]), .INCR_PC(SW[9]), .ADDR(SW[7:0]), .PC(PC));
	
	ramlpminit demo(.address(PC), .clock(~KEY[0]), .data(SW[7:0]), .wren(SW[8]), .q(Q1));

	dual_seg7 dualright(.blank(0), .test(0), .data(PC), .segments1(HEX1), .segments2(HEX0));
	dual_seg7 dualleft(.blank(0), .test(0), .data(Q1), .segments1(HEX3), .segments2(HEX2));


	
endmodule