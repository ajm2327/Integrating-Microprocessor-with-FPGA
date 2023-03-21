//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab3
//Author: Adam Montano
//Module Name: seg7
//Module Function seg7 display decoder
//**************************************************************************************

//Module Declaration
module seg7(	input logic blank, test,
					input logic [3:0] data,
					output logic [6:0] segments);
					
	always_comb
		if(blank) segments = 7'b111_1111;
		else if (test) segments = 7'b000_0000;
		
		else case(data)
		//                  abc_defg
		0: 		segments = 7'b100_0000; //the bits are flipped!?
		1:			segments = 7'b111_1001;
		2:			segments = 7'b010_0100;
		3:			segments = 7'b011_0000;
		4:			segments = 7'b001_1001;
		5:			segments = 7'b001_0010;
		6:			segments = 7'b000_0010;
		7:			segments = 7'b111_1000;
		8:			segments = 7'b000_0000;
		9:			segments = 7'b001_1000; 
		10:		segments = 7'b000_1000; //A
		11:		segments = 7'b000_0011; //B
		12:		segments = 7'b100_0110; //C
		13:		segments = 7'b010_0001; //D
		14:		segments = 7'b000_0110; //E
		15:		segments = 7'b000_1110; //F
		default: segments = 7'b111_1111;
	endcase





endmodule