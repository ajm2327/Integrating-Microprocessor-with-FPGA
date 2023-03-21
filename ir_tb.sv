//EE 310 Fundamentals of Computer Engineering
//Assignment: lab4
//Author: Adam Montano
//Module Name: ir_tb
//Module Function: instruction register hardware
//**************************************************************************************

module ir_tb( input logic [9:0] SW,
					input logic [1:0] KEY,
					output logic [6:0] HEX0, HEX1, HEX2, HEX3);
					
	logic [7:0] PC0; //IRL Value
	logic [7:0] PC1; //IRU Opcode
	
//Call Instruction register module, using switches 7:0 as data input with switches 9:8 being LOAD_IRU/IRL respectively					
ir ir1(.MDR(SW[7:0]), .clk(KEY[0]), .reset(~KEY[1]), .LOAD_IRU(SW[9]), .LOAD_IRL(SW[8]), .IRL(PC0), .IRU(PC1));
//Output IRL (Value) to the right pair of 7seg displays
dual_seg7 dualright(.blank(0), .test(0), .data(PC0), .segments1(HEX1), .segments2(HEX0));
//Output IRU (Opcode) to the middle pair of 7seg displays
dual_seg7 dualleft(.blank(0), .test(0), .data(PC1), .segments1(HEX3), .segments2(HEX2));

endmodule
