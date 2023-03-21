//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab3
//Author: Adam Montano
//Module Name: dual_seg7_tb
//Module Function dual seg7 display decoder
//**************************************************************************************

//Module Declaration

module dual_seg7_tb (input logic [9:0] SW,
							output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
							
//Instantiate DUT
//Right pair of 7seg displays
dual_seg7 allsegs1( .blank(SW[9]), .test(SW[8]), .data(SW[7:0]),
							.segments2(HEX0), .segments1(HEX1));
//Middle pair of 7seg displays
dual_seg7 allsegs2( .blank(SW[9]), .test(SW[8]), .data(SW[7:0]),
							.segments2(HEX2), .segments1(HEX3));
//Left Pair of 7seg displays
dual_seg7 allsegs3( .blank(SW[9]), .test(SW[8]), .data(SW[7:0]),
							.segments2(HEX4), .segments1(HEX5));
							
endmodule
							
