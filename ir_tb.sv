//EE 310 Fundamentals of Computer Engineering
//Assignment: lab4
//Author: Adam Montano
//Module Name: ir_tb
//Module Function: instruction register hardware
//**************************************************************************************

module ir_tb( input logic [9:0] SW,
					input logic [1:0] KEY,
					output logic [6:0] HEX0, HEX1, HEX2, HEX3);
					
	logic [7:0] PC0; //IRL
	logic [7:0] PC1; //IRU I might have it backwards
	
					
ir ir1(.MDR(SW[7:0]), .clk(KEY[0]), .reset(~KEY[1]), .LOAD_IRU(SW[9]), .LOAD_IRL(SW[8]), .IRL(PC0), .IRU(PC1));

dual_seg7 dualright(.blank(0), .test(0), .data(PC0), .segments1(HEX1), .segments2(HEX0));
dual_seg7 dualleft(.blank(0), .test(0), .data(PC1), .segments1(HEX3), .segments2(HEX2));

endmodule