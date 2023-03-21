//EE 310 Fundamentals of Computer Engineering
//Assignment: lab4
//Author: Adam Montano
//Module Name: alu_tb
//Module Function: arithmetic logic unit hardware
//**************************************************************************************

//module declaration

module alu_tb(	input logic [9:0] SW,
					input logic [3:0] KEY,
					output logic [9:0] LEDR,
					output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
					
logic [7:0] AC; // AC BUS
logic [7:0] PC0; // IRL value
logic [7:0] PC1; //IRU opcode
logic [7:0] PC; // PC MDR
logic [7:0] Z; //DA Z

always_comb
	LEDR[7:0] = PC0; //the first LEDs get value. 


ac ac1(.Z(SW[7:0]), .clk(KEY[0]), .LOAD_AC(~KEY[2]), .AC(AC));

ir ir1(.MDR(SW[7:0]), .clk(KEY[0]), .reset(SW[8]), .LOAD_IRU(SW[9]), .LOAD_IRL(~KEY[1]), .IRL(PC0), .IRU(PC1));

pc pc1(.clk(KEY[0]), .reset(SW[8]), .LOAD_PC(~KEY[3]), .INCR_PC(0), .ADDR(SW[7:0]), .PC(PC)); //no increment reeeeeee

alu alu1(.mdr(PC), .ac(AC), .value(PC0), .opcode(PC1), .nflg(LEDR[8]), .zflg(LEDR[9]), .zout(Z));


dual_seg7 Z_out(.blank(0), .test(0), .data(Z), .segments1(HEX1), .segments2(HEX0));//Z
dual_seg7 ac_out(.blank(0), .test(0), .data(AC), .segments1(HEX3), .segments2(HEX2));//AC
dual_seg7 MDR_out(.blank(0), .test(0), .data(PC), .segments1(HEX5), .segments2(HEX4));//MDR


endmodule