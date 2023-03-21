//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab3
//Author: Adam Montano
//Module Name: dual_seg7
//Module Function dual seg7 display decoder
//**************************************************************************************

//Module Declaration

module dual_seg7(input logic blank, 
						input logic test, 
						input logic [7:0] data,
						output logic [6:0] segments1,
						output logic [6:0] segments2);
						
		seg7  leftdisp (blank, test, data[7:4], segments1);
		seg7 rightdisp (blank, test, data[3:0], segments2);
		
endmodule