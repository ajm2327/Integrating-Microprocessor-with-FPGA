//EE 310 Fundamentals of Computer Engineering
//Assignment: lab4
//Author: Adam Montano
//Module Name: ac_tb
//Module Function: accumulator hardware
//**************************************************************************************

//module declaration

module ac_tb(input logic [8:0] SW,
					input logic [0:0] KEY[0],
					output logic [6:0] HEX0, HEX1);
					
	logic [7:0] AC; // internal AC Bus
	//Call AC module Z input comes from switches on FPGA
	ac ac1(.Z(SW[7:0]), .clk(KEY[0]), .LOAD_AC(SW[8]), .AC(AC));
	//Output AC value to display on 7 seg display
	//Hex0 and Hex1 are the right two 7 segment displays on the FPGA board.
	dual_seg7 dualright(.blank(0), .test(0), .data(AC), .segments1(HEX1), .segments2(HEX0));
	
	endmodule
