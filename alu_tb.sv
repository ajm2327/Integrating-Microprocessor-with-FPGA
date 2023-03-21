//EE 310 Fundamentals of Computer Engineering
//Assignment: lab4
//Author: Adam Montano
//Module Name: alu_tb
//Module Function: arithmetic logic unit hardware
//**************************************************************************************
//This module puts together the previous registers in order to implement the ALU
//module declaration

module alu_tb(	input logic [9:0] SW,
					input logic [3:0] KEY,
					output logic [9:0] LEDR,
					output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
					
logic [7:0] AC; // AC BUS
logic [7:0] PC0; // IRL value
logic [7:0] PC1; //IRU opcode
logic [7:0] PC; // PC MDR
logic [7:0] Z; // ALU output

always_comb
	LEDR[7:0] = PC0; //the first 8 LEDs get value (IRL). 

//Call ac module
ac ac1(.Z(SW[7:0]), .clk(KEY[0]), .LOAD_AC(~KEY[2]), .AC(AC));
//Call ir module
ir ir1(.MDR(SW[7:0]), .clk(KEY[0]), .reset(SW[8]), .LOAD_IRU(SW[9]), .LOAD_IRL(~KEY[1]), .IRL(PC0), .IRU(PC1));
//Call pc module
pc pc1(.clk(KEY[0]), .reset(SW[8]), .LOAD_PC(~KEY[3]), .INCR_PC(0), .ADDR(SW[7:0]), .PC(PC)); //no increment
//Call alu module takes outputs from each register as input
alu alu1(.mdr(PC), .ac(AC), .value(PC0), .opcode(PC1), .nflg(LEDR[8]), .zflg(LEDR[9]), .zout(Z));

//Output ALU result to right pair of 7seg displays
dual_seg7 Z_out(.blank(0), .test(0), .data(Z), .segments1(HEX1), .segments2(HEX0));//Z
//Output AC value to middle pair of 7seg displays
dual_seg7 ac_out(.blank(0), .test(0), .data(AC), .segments1(HEX3), .segments2(HEX2));//AC
//Output PC value to left pair of 7seg displays
dual_seg7 MDR_out(.blank(0), .test(0), .data(PC), .segments1(HEX5), .segments2(HEX4));//MDR


endmodule
